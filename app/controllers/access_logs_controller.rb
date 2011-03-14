class AccessLogsController < ApplicationController
  def timeline
    @access_logs = AccessLog.order("logged DESC").all

    respond_to do |format|
      format.html 
    end
  end

  # GET /access_logs
  # GET /access_logs.xml
  def index
    @access_logs = AccessLog.order("logged DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @access_logs }
    end
  end

  # GET /access_logs/1
  # GET /access_logs/1.xml
  def show
    @access_log = AccessLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @access_log }
    end
  end

  # GET /access_logs/new
  # GET /access_logs/new.xml
  def new
    @access_log = AccessLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @access_log }
    end
  end

  # GET /access_logs/1/edit
  def edit
    @access_log = AccessLog.find(params[:id])
  end

  # POST /access_logs
  # POST /access_logs.xml
  def create
    @access_log = AccessLog.new(params[:access_log])

    respond_to do |format|
      if @access_log.save
        format.html { redirect_to(@access_log, :notice => 'Access log was successfully created.') }
        format.xml  { render :xml => @access_log, :status => :created, :location => @access_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @access_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /access_logs/1
  # PUT /access_logs/1.xml
  def update
    @access_log = AccessLog.find(params[:id])

    respond_to do |format|
      if @access_log.update_attributes(params[:access_log])
        format.html { redirect_to(@access_log, :notice => 'Access log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @access_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /access_logs/1
  # DELETE /access_logs/1.xml
  def destroy
    @access_log = AccessLog.find(params[:id])
    @access_log.destroy

    respond_to do |format|
      format.html { redirect_to(access_logs_url) }
      format.xml  { head :ok }
    end
  end
end
