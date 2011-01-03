require 'rubygems'
require 'nokogiri'
require 'open-uri'

# url = "http://www.google.com/images?um=1&hl=en&safe=off&biw=1221&bih=1010&tbs=isch:1&sa=1&q=site:kristvi.net+norman+hagen&btnG=Search&aq=f&aqi=&aql=&oq=&gs_rfai="
# doc = Nokogiri::HTML(open(url))

def create_webpage_and_photo(gallery_id, publisher_id, webpage_url, photo_url)
  webpage = Webpage.find_or_create_by_url(webpage_url, :publisher_id => publisher_id) # create the webpage record if it didn't already exist
  webpage.save!
  puts "WEBPAGE id=#{webpage.id}"
  
  photo = Photo.find_or_create_by_photo_url(photo_url)
  photo.webpage = webpage
  photo.gallery_id = gallery_id
  photo.save!
  puts "PHOTO id=#{photo.id}"
end

def import_google_image_search_html(gallery_id, publisher_id, file_name)
  doc = Nokogiri::HTML.parse(File.read(file_name))

  puts doc.at_css("title").text
  # puts doc.at_css("a.rg_l").collect(&:href)
  # puts doc.xpath("//a").collect(&:text)
  # puts doc.xpath("//image").collect(&:href)

  re_image = Regexp.new('\?imgurl=(.*)\&imgrefurl')
  re_page = Regexp.new('\&imgrefurl=(.*)\&usg=')

  num = 0

# doc.css("li.rg_li").each do |rgli|
  doc.css("a.rg_l").each do |rgli|
#   a = rgli.at_css("a.rg_l")
    a = rgli
    href = a[:href]
    m_image = re_image.match href
    m_page = re_page.match href
    if m_image and m_page and m_image.size > 1 and m_page.size > 1
      image_url = m_image[1]
      webpage_url = m_page[1]
      puts "IMAGE: #{image_url}"
      puts "PAGE: #{webpage_url}"
      # create_webpage_and_photo(gallery_id, publisher_id, webpage_url, image_url)
    else
      puts "COULD NOT PARSE: #{href}"
    end
    
    num += 1
    # return if num >= 25
  end
  
  puts "IMPORTED: #{num}"
end

import_google_image_search_html(1, 4, 'images3.html')
