class AccessGroupsController < ApplicationController
  # GET /access_groups
  # GET /access_groups.xml
  def index
    @access_groups = AccessGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @access_groups }
    end
  end

  # GET /access_groups/1
  # GET /access_groups/1.xml
  def show
    @access_group = AccessGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @access_group }
    end
  end

  # GET /access_groups/new
  # GET /access_groups/new.xml
  def new
    @access_group = AccessGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @access_group }
    end
  end

  # GET /access_groups/1/edit
  def edit
    @access_group = AccessGroup.find(params[:id])
  end

  # POST /access_groups
  # POST /access_groups.xml
  def create
    @access_group = AccessGroup.new(params[:access_group])

    respond_to do |format|
      if @access_group.save
        format.html { redirect_to(@access_group, :notice => 'Access group was successfully created.') }
        format.xml  { render :xml => @access_group, :status => :created, :location => @access_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @access_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /access_groups/1
  # PUT /access_groups/1.xml
  def update
    @access_group = AccessGroup.find(params[:id])

    respond_to do |format|
      if @access_group.update_attributes(params[:access_group])
        format.html { redirect_to(@access_group, :notice => 'Access group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @access_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /access_groups/1
  # DELETE /access_groups/1.xml
  def destroy
    @access_group = AccessGroup.find(params[:id])
    @access_group.destroy

    respond_to do |format|
      format.html { redirect_to(access_groups_url) }
      format.xml  { head :ok }
    end
  end
end
