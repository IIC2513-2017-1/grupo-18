class FriendsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  def show
  	redirect_to user_path(@friendship.friend)
  end

  def new
    @friendship = Friend.new
  end

  def edit
  end

  def create
    @friendship = Friend.new(friendship_params)
    @user = @friendship.friend

    @private_bets = []
    @private_bets = Bet.where(user: @user, visible: false) if @user.friends.find_by(user: current_user).present?


    respond_to do |format|
      if @friendship.save
        format.html { redirect_to user_path(@friendship.friend) }
        format.js
      else
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @friendship.update(friendship_params)
      redirect_to user_path(@friendship.friend)
    else
      redirect_to :back
    end
  end

  # DELETE /comments/1
  def destroy
  	this_friend = @friendship.friend
    @private_bets = []
    @user = @friendship.friend
    respond_to do |format|
      if @friendship.destroy
        format.html { redirect_to user_path(this_friend) }
        format.js
      else
        format.html { redirect_to :back }
        format.js
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end

end
