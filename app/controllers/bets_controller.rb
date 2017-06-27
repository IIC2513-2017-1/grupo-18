class BetsController < ApplicationController
  include BetsHelper
  include FriendsHelper
  include SessionsHelper
  include UsersHelper

  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  before_action :check_privacy, only: [:show, :edit, :update, :destroy]

  # GET /bets
  # GET /bets.json
  def index
    @bets_friends = bets_owned_by_friends_of(current_user)
    @bets_public = bets_public_and_not_owned_by_friends_or_user(current_user)
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
    @bonos = @bet.bet_options
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
    params[:bet_options].each do |meh|
      if params[:bet_options]["#{meh}"]["win"].count == 2
        params[:bet_options]["#{meh}"]["win"] = "true"
      else
        params[:bet_options]["#{meh}"]["win"] = "false"
      end
    end
    aux[:bet][:bet_options_attributes] = params[:bet_options]
    aux[:bet][:bet_options_attributes].delete("{index}")
    aux.delete("bet_options")
    aux = aux.require(:bet).permit(:name , :execution_date,:avatar, :description, :remove_avatar, :visible, bet_options_attributes: [:description, :percentage, :win, :id])
    @bet = Bet.new(aux)
    @bet.user = current_user
    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        #byebug
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    aux = params
    params[:bet_options].each do |meh|
      if params[:bet_options]["#{meh}"]["win"].count == 2
        params[:bet_options]["#{meh}"]["win"] = "true"
      else
        params[:bet_options]["#{meh}"]["win"] = "false"
      end
    end
    aux[:bet][:bet_options_attributes] = params[:bet_options]
    aux[:bet][:bet_options_attributes].delete("{index}")
    aux.delete("bet_options")
    aux = aux.require(:bet).permit(:name , :execution_date,:avatar ,:description, bet_options_attributes: [:description, :percentage, :win, :id])
    respond_to do |format|
      if @bet.update(aux)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        puts @bet.errors.full_messages
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

    def check_privacy
      if(!admin_access? && !do_I_have_access?(current_user))
          redirect_to bets_url
      end
    end

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

    def 

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:name, :execution_date, :description, :avatar, :visible, bets_options_attributes: [:description, :percentage, :win])
    end
end
