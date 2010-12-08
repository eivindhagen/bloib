class Demo::SiteUrlsController < ApplicationController
  # GET /demo/site_urls
  # GET /demo/site_urls.xml
  def index
    @demo_site_urls = Demo::SiteUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @demo_site_urls }
    end
  end

  # GET /demo/site_urls/1
  # GET /demo/site_urls/1.xml
  def show
    @demo_site_url = Demo::SiteUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @demo_site_url }
    end
  end

  # GET /demo/site_urls/new
  # GET /demo/site_urls/new.xml
  def new
    @demo_site_url = Demo::SiteUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @demo_site_url }
    end
  end

  # GET /demo/site_urls/1/edit
  def edit
    @demo_site_url = Demo::SiteUrl.find(params[:id])
  end

  # POST /demo/site_urls
  # POST /demo/site_urls.xml
  def create
    @demo_site_url = Demo::SiteUrl.new(params[:demo_site_url])

    respond_to do |format|
      if @demo_site_url.save
        format.html { redirect_to(@demo_site_url, :notice => 'Site url was successfully created.') }
        format.xml  { render :xml => @demo_site_url, :status => :created, :location => @demo_site_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @demo_site_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /demo/site_urls/1
  # PUT /demo/site_urls/1.xml
  def update
    @demo_site_url = Demo::SiteUrl.find(params[:id])

    respond_to do |format|
      if @demo_site_url.update_attributes(params[:demo_site_url])
        format.html { redirect_to(@demo_site_url, :notice => 'Site url was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @demo_site_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /demo/site_urls/1
  # DELETE /demo/site_urls/1.xml
  def destroy
    @demo_site_url = Demo::SiteUrl.find(params[:id])
    @demo_site_url.destroy

    respond_to do |format|
      format.html { redirect_to(demo_site_urls_url) }
      format.xml  { head :ok }
    end
  end
end
