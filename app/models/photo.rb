require 'net/http'
require 'digest/md5'
require 'digest/sha1'
require 'RMagick'

class Photo < ActiveRecord::Base
  belongs_to :webpage
  belongs_to :gallery
  
  validates_uniqueness_of :photo_url

  CACHED_PHOTOS_DIR = "#{Rails.root}/public/images/cached_photos"
  CACHED_PHOTOS_URL = "/images/cached_photos"

  def title_safe
    if title && title.length > 0
      title
    elsif webpage.title && webpage.title.length > 0
      webpage.title
    else
      '<i>Unknown</i>'.html_safe
    end
  end
  
  def cached_photo_url(options={})
    options[:photo_id] = self.id
    begin
      cphotos = CachedPhoto.where(options)
      if cphotos.size > 0
        cphotos.each do |cp|
          return "#{CACHED_PHOTOS_URL}/#{cp.filename}"
        end
      end
    rescue Exception => e
    end

    return photo_url
  end
  
  def load_image_from_url
    # load original image
    url = URI.parse(photo_url)
    begin
      Net::HTTP.start(url.host, url.port) {|http|
        response = http.get(url.path)
        orig_md5 = Digest::MD5.hexdigest(response.body)
        orig_sha1 = Digest::SHA1.hexdigest(response.body)
        t = Time.now
        datestamp = "#{t.year}_#{t.month}_#{t.day}_#{t.hour}_#{t.min}_#{t.sec}"
        orig_ext = photo_url.split('/').last.split('.').last
        tmp_filename = "#{Rails.root}/tmp/photo_#{datestamp}__#{Time.now.to_i}.#{orig_ext}"
        puts "Saving original photo \##{id} '#{title_safe}' to file '#{tmp_filename}'"
        puts "Orig MD5:#{orig_md5}"
        puts "Orig SHA1:#{orig_sha1}"
        open( tmp_filename, 'wb' ) { |file|
          file.write(response.body)
        }

        # load in using ImageMagick
        @image = Magick::Image.read(tmp_filename).first
      
        # delete temp file
        File.delete tmp_filename
      
        return @image
      }
    rescue
      return nil
    end
  end
  
  def create_metadata_from_url
    @image = load_image_from_url unless @image
    return if @image.nil?
    
    self.width = @image.columns
    self.height = @image.rows
    blob = @image.to_blob
    self.md5 = Digest::MD5.hexdigest(blob)
    self.sha1 = Digest::SHA1.hexdigest(blob)
    save!
  end
  
  def create_cached_photo(options = {})
    return unless options[:width] or options[:height]

    # load original image
    @image = load_image_from_url
    return if @image.nil?

    # extract metadata (unless we already have it)
    puts "@image info: #{@image.inspect}"
    create_metadata_from_url unless (width and height)
    
    # get image dimensions
    orig_width = @image.columns
    orig_height = @image.rows

    # figure out new dimensions
    if options[:width] and options[:height]
      new_width = options[:width]
      new_height = options[:height]
    elsif options[:width]
      new_width = options[:width]
      scale = new_width.to_f / orig_width.to_f
      new_height = (orig_height * scale).to_i
    elsif options[:height]
      new_height = options[:height]
      scale = new_height.to_f / orig_height.to_f
      new_width = (orig_width * scale).to_i
    end
    
    # resize it
    puts "resizing from #{orig_width}x#{orig_height} to #{new_width}x#{new_height}"
    new_image = @image.resize(new_width, new_height)
    new_blob = new_image.to_blob
    new_md5 = Digest::MD5.hexdigest(new_blob)
    new_sha1 = Digest::SHA1.hexdigest(new_blob)
    puts "New MD5:#{new_md5}"
    puts "New SHA1:#{new_sha1}"
    new_filename = "#{new_sha1}_#{new_width}x#{new_height}.png"
    new_pathname = "#{CACHED_PHOTOS_DIR}/#{new_filename}"
    new_image.write(new_pathname)
    
    # look for matching CachedImage records
    cphoto = nil
    begin
      cphotos = CachedPhoto.where(:photo_id => self.id, :width => new_width, :height => new_height, :filename => new_filename, :md5 => new_md5, :sha1 => new_sha1)
      if cphotos.size > 0
        cphotos.each do |cp|
          puts "Found existing CachedPhoto id=#{cp.id}"
          cphoto = cp
        end
      end
    rescue Exception => e
      puts "EXCEPTION: #{e.message}\n#{e.backtrace}"
    end

    # create CachedImage record (unless it exist already)
    if cphoto.nil?
      cphoto = CachedPhoto.create(:photo_id => self.id, :width => new_width, :height => new_height, :filename => new_filename, :md5 => new_md5, :sha1 => new_sha1)
      puts "Created new CachedPhoto id=#{cphoto.id}"
    end
  end
  
end
