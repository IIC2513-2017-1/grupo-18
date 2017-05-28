class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all unless current_user.user_type.zero?
    @bets = Bet.where(visible: true).or(Bet.where(user_id: Friend.where(friend_id:current_user.id).pluck(:user_id))) if current_user.user_type.zero?
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
    redirect_to home_path, notice: 'Bet not found' unless @bet.present?
  end

  # GET /bets/new
  def new
    @bet = Bet.new
    @bonos = @bet.bet_options#1.times { @bet.bet_options.build }
  end

  # GET /bets/1/edit
  def edit
    redirect_to home_path, notice: 'Bet not found' unless @bet.present?
  end

  def export
    # Nombre de la apuesta
    # Autor o entidad relacionada a la apuesta
    # Fecha de inicio
    # Fecha de termino
    # Cantidad de apostantes
    # Suma total apostada por los apostantes
    # Opcion ganadora de la apuesta
    @bets = Bet.all unless current_user.user_type.zero?
    @bets = Bet.where(visible: true).or(Bet.where(user_id: Friend.where(friend_id:current_user.id).pluck(:user_id))) if current_user.user_type.zero?
    respond_to do |format|
      format.xls
    end

  end

  # POST /bets
  # POST /bets.json
  def create
    aux = params
    aux[:bet][:bet_options_attributes] = params[:bet_options]
    aux[:bet][:bet_options_attributes].delete("{index}")
    aux.delete("bet_options")
    aux = aux.require(:bet).permit(:execution_date, :description, bet_options_attributes: [:description, :percentage])
    @bet = Bet.new(aux)
    @bet.user = current_user
    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      if current_user.present?
        bets = Bet.all unless current_user.user_type.zero?
        bets = Bet.where(visible: true).or(Bet.where(user_id: Friend.where(friend_id:current_user.id).pluck(:user_id))) if current_user.user_type.zero?
        @bet = bets.find_by(id: params[:id])
      else
        @bet = nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:execution_date, :description, :avatar,bets_options_attributes: [:description, :percentage])
    end
end
