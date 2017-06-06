class HomeController < ApplicationController
  skip_before_action :check_logged_in
  def index
    
    if logged_in?
      @bets = Bet.all unless current_user.user_type.zero?
      @bets = Bet.where(visible: true).or(Bet.where(user_id: Friend.where(friend_id:current_user.id).pluck(:user_id))) if current_user.user_type.zero?
    else
      @bets = []
    end
  end
end
