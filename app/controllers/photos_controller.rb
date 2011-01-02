class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    @skip_fields = {}
    @add_fields = {}
    if (publisher_id = params[:publisher_id])
      publisher = Publisher.find(publisher_id)
      @add_fields[:publisher_id] = publisher_id
    end

    # when creating a new photo, auto-fill some fields if they are passed in here
    if (webpage_id = params[:webpage_id])
      begin
        webpage = Webpage.find(webpage_id)
      rescue
        webpage = nil
      end
      @photo.webpage = webpage
      @skip_fields[:webpage_id] = webpage_id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])

    # special support for adding the webpage and the photo using a single form with one extra hidden field (publisher_id) and one extra text field (webpage_url)
    if (webpage_url = params[:webpage_url]) && (publisher_id = params[:publisher_id])
      webpage = Webpage.find_or_create_by_url(webpage_url, :publisher_id => publisher_id) # create the webpage record if it didn't already exist
      @photo.webpage = webpage
    end

    respond_to do |format|
      if @photo.save
        format.html { redirect_to(@photo, :notice => 'Photo was successfully created.') }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end
end
