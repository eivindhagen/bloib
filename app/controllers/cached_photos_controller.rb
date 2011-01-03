class CachedPhotosController < ApplicationController
  # GET /cached_photos
  # GET /cached_photos.xml
  def index
    @cached_photos = CachedPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cached_photos }
    end
  end

  # GET /cached_photos/1
  # GET /cached_photos/1.xml
  def show
    @cached_photo = CachedPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cached_photo }
    end
  end

  # GET /cached_photos/new
  # GET /cached_photos/new.xml
  def new
    @cached_photo = CachedPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cached_photo }
    end
  end

  # GET /cached_photos/1/edit
  def edit
    @cached_photo = CachedPhoto.find(params[:id])
  end

  # POST /cached_photos
  # POST /cached_photos.xml
  def create
    @cached_photo = CachedPhoto.new(params[:cached_photo])

    respond_to do |format|
      if @cached_photo.save
        format.html { redirect_to(@cached_photo, :notice => 'Cached photo was successfully created.') }
        format.xml  { render :xml => @cached_photo, :status => :created, :location => @cached_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cached_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cached_photos/1
  # PUT /cached_photos/1.xml
  def update
    @cached_photo = CachedPhoto.find(params[:id])

    respond_to do |format|
      if @cached_photo.update_attributes(params[:cached_photo])
        format.html { redirect_to(@cached_photo, :notice => 'Cached photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cached_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cached_photos/1
  # DELETE /cached_photos/1.xml
  def destroy
    @cached_photo = CachedPhoto.find(params[:id])
    @cached_photo.destroy

    respond_to do |format|
      format.html { redirect_to(cached_photos_url) }
      format.xml  { head :ok }
    end
  end
end
