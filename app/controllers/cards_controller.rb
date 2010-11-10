class CardsController < ApplicationController
  before_filter :adjust_card, :only => [:create, :update]

  def captured
    time = Time.parse(params[:capture_time])
    if((found = AccessLog.last_denied(time)) && found.card_id)
      render :text => found.card_id 
    else
      head :not_found
    end
  end

  # GET /cards
  # GET /cards.xml
  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.xml
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.xml
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.xml
  def create
    @card = Card.new(params[:card])
    @card.card_id = params[:card][:card_id]

    respond_to do |format|
      if @card.save
        format.html { redirect_to(@card, :notice => 'Card was successfully created.') }
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to(@card, :notice => 'Card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to(cards_url) }
      format.xml  { head :ok }
    end
  end

  private 
  def adjust_card
    params[:card][:card_id]     = params[:id] || params[:card_id] || params[:hidden_card_id]
    params[:card][:magic]       = params[:card][:magic] == '1' ? 'Y' : 'N'
    params[:card][:disabled]    = params[:card][:disabled] == '1' ? 'Y' : 'N'
    params[:card][:after_hours] = params[:card][:after_hours] == '1' ? 'Y' : 'N'
  end
end
