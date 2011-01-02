require 'nokogiri'
require 'open-uri'

class WebpagesController < ApplicationController
  # GET /webpages
  # GET /webpages.xml
  def index
    @webpages = Webpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @webpages }
    end
  end

  # GET /webpages/1
  # GET /webpages/1.xml
  def show
    @webpage = Webpage.find(params[:id])

    check_title
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @webpage }
    end
  end

  # GET /webpages/new
  # GET /webpages/new.xml
  def new
    @webpage = Webpage.new

    @skip_fields = {}
    if (publisher_id = params[:publisher_id])
      publisher = Publisher.find(publisher_id)
      @webpage.publisher = publisher
      @skip_fields[:publisher_id] = true
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @webpage }
    end
  end

  # GET /webpages/1/edit
  def edit
    @webpage = Webpage.find(params[:id])
  end

  # POST /webpages
  # POST /webpages.xml
  def create
    @webpage = Webpage.new(params[:webpage])

    check_title

    respond_to do |format|
      if @webpage.save
        format.html { redirect_to(@webpage, :notice => 'Webpage was successfully created.') }
        format.xml  { render :xml => @webpage, :status => :created, :location => @webpage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @webpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /webpages/1
  # PUT /webpages/1.xml
  def update
    @webpage = Webpage.find(params[:id])

    check_title

    respond_to do |format|
      if @webpage.update_attributes(params[:webpage])
        format.html { redirect_to(@webpage, :notice => 'Webpage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @webpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /webpages/1
  # DELETE /webpages/1.xml
  def destroy
    @webpage = Webpage.find(params[:id])
    @webpage.destroy

    respond_to do |format|
      format.html { redirect_to(webpages_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def check_title
    return if @webpage.title && @webpage.title.length > 0
    
    doc = Nokogiri::HTML(open(@webpage.url))
    title_tag = doc.at_css('title')
    if title_tag
      if title_tag.text.length > 0
        @webpage.title = title_tag.text
      else
        @webpage.title = @webpage.url.split('/').last
      end
      @webpage.save!
    end
  end
  
end
