class BetOptionsController < ApplicationController
  before_action :set_bet_option, only: [:show, :edit, :update, :destroy]

  # GET /bet_options
  # GET /bet_options.json
  def index
    @bet_options = BetOption.all
  end

  # GET /bet_options/1
  # GET /bet_options/1.json
  def show
  end

  # GET /bet_options/new
  def new
    @bet_option = BetOption.new
  end

  # GET /bet_options/1/edit
  def edit
  end

  # POST /bet_options
  # POST /bet_options.json
  def create
    @bet_option = BetOption.new(bet_option_params)
    @bet_option.user = current
    respond_to do |format|
      if @bet_option.save
        format.html { redirect_to @bet_option, notice: 'Bet option was successfully created.' }
        format.json { render :show, status: :created, location: @bet_option }
      else
        format.html { render :new }
        format.json { render json: @bet_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_options/1
  # PATCH/PUT /bet_options/1.json
  def update
    respond_to do |format|
      if @bet_option.update(bet_option_params)
        format.html { redirect_to @bet_option, notice: 'Bet option was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_option }
      else
        format.html { render :edit }
        format.json { render json: @bet_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_options/1
  # DELETE /bet_options/1.json
  def destroy
    @bet_option.destroy
    respond_to do |format|
      format.html { redirect_to bet_options_url, notice: 'Bet option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet_option
      @bet_option = BetOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_option_params
      params.require(:bet_option).permit(:description, :bet_id)
    end
end
