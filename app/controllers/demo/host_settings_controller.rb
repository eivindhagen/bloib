class Demo::HostSettingsController < ApplicationController
  # GET /demo/host_settings
  # GET /demo/host_settings.xml
  def index
    @demo_host_settings = Demo::HostSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @demo_host_settings }
    end
  end

  # GET /demo/host_settings/1
  # GET /demo/host_settings/1.xml
  def show
    @demo_host_setting = Demo::HostSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @demo_host_setting }
    end
  end

  # GET /demo/host_settings/new
  # GET /demo/host_settings/new.xml
  def new
    @demo_host_setting = Demo::HostSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @demo_host_setting }
    end
  end

  # GET /demo/host_settings/1/edit
  def edit
    @demo_host_setting = Demo::HostSetting.find(params[:id])
  end

  # POST /demo/host_settings
  # POST /demo/host_settings.xml
  def create
    @demo_host_setting = Demo::HostSetting.new(params[:demo_host_setting])

    respond_to do |format|
      if @demo_host_setting.save
        format.html { redirect_to(@demo_host_setting, :notice => 'Host setting was successfully created.') }
        format.xml  { render :xml => @demo_host_setting, :status => :created, :location => @demo_host_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @demo_host_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /demo/host_settings/1
  # PUT /demo/host_settings/1.xml
  def update
    @demo_host_setting = Demo::HostSetting.find(params[:id])

    respond_to do |format|
      if @demo_host_setting.update_attributes(params[:demo_host_setting])
        format.html { redirect_to(@demo_host_setting, :notice => 'Host setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @demo_host_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /demo/host_settings/1
  # DELETE /demo/host_settings/1.xml
  def destroy
    @demo_host_setting = Demo::HostSetting.find(params[:id])
    @demo_host_setting.destroy

    respond_to do |format|
      format.html { redirect_to(demo_host_settings_url) }
      format.xml  { head :ok }
    end
  end
end
