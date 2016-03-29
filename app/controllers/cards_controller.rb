class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    year_month = params[:year_month]
    d = Date.today
    
    if year_month
      d_t = Date.new(year_month[0..3].to_i, year_month[-2..-1].to_i, 1)
      d_s = Date.new(d_t.last_month.year, d_t.last_month.month, 26)
      d_e = Date.new(d_t.year, d_t.month, 25)
    elsif d.day > 25
      d_s = d
      d_e = d.next_month
    else
      d_s = d.last_month
      d_e = d
    end
    
    d_start = Date.new(d_s.year, d_s.month, 26)
    d_end = Date.new(d_e.year, d_e.month, 25)
    @cards = Card.date_between(d_start, d_end).order("date DESC")
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    @cost = params[:cost]
    to = params[:to]
    cc = params[:cc]

    respond_to do |format|
      if @card.save
        UserMailer.registration_confirmation(@card, @cost, to, cc).deliver_later
        format.html { redirect_to cards_url, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:date, :start, :end, :reststart, :restend)
    end
end
