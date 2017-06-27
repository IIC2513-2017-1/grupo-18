class UsersController < ApplicationController
include UsersHelper
include FriendsHelper
include BetsHelper
# include SessionsHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_action :check_logged_in, only: [:new, :create]

  before_action :admin_barrier, only: [:edit, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @friends = real_friends(@user)
    @private_bets = Bet.where(user: @user, visible: false)

    # if different_user? && only_he_is_friend?(current_user, @user) || are_we_both_friends?(current_user, @user)
    #   @private_bets = Bet.where(user: @user, visible: false)
    # else
    #   @private_bets = []
    # end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.gravatar_usage = true if request.format.json?
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url }
        format.json { render json:{message: 'Creacion exitosa', activate: edit_account_activation_url(@user.activation_token, email: @user.email)}, status: :ok, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Blocks edit and destroy access for non-admins.
    ## It allows self-edit and self-destruct, though.
    def admin_barrier
      unless admin_access? || logged_in? && current_user == @user
        flash[:error] = "You must have admin access to do that."
        redirect_to :back
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      admin_access? && admin_user_filter || normal_user_filter
    end

    ## Helpers for user_params
    def normal_user_filter
      params.require(:user).permit(:username, :name, :email, :password, :image, :remove_image, :gravatar_usage)
    end
    def admin_user_filter
      params.require(:user).permit(:username, :name, :email, :password, :image, :remove_image, :gravatar_usage, :user_type)
    end
end
