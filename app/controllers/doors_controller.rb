class DoorsController < ApplicationController
  def open
    render :text => Door.open(params[:door])
  end

  # GET /doors
  # GET /doors.xml
  def index
    @doors = Door.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doors }
    end
  end

  # GET /doors/1
  # GET /doors/1.xml
  def show
    @door = Door.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @door }
    end
  end

  # GET /doors/new
  # GET /doors/new.xml
  def new
    @door = Door.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @door }
    end
  end

  # GET /doors/1/edit
  def edit
    @door = Door.find(params[:id])
  end

  # POST /doors
  # POST /doors.xml
  def create
    @door = Door.new(params[:door])

    respond_to do |format|
      if @door.save
        format.html { redirect_to(@door, :notice => 'Door was successfully created.') }
        format.xml  { render :xml => @door, :status => :created, :location => @door }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @door.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doors/1
  # PUT /doors/1.xml
  def update
    @door = Door.find(params[:id])

    respond_to do |format|
      if @door.update_attributes(params[:door])
        format.html { redirect_to(@door, :notice => 'Door was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @door.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doors/1
  # DELETE /doors/1.xml
  def destroy
    @door = Door.find(params[:id])
    @door.destroy

    respond_to do |format|
      format.html { redirect_to(doors_url) }
      format.xml  { head :ok }
    end
  end
end
