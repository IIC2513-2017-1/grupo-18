class FriendsController < ApplicationController

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

    if @friendship.save
      redirect_to user_path(@friendship.friend)
    else
      redirect_to :back
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

    @friendship.destroy

    redirect_to user_path(this_friend)
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
