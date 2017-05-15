class HomeController < ApplicationController
  def index

    @bets = Bet.all unless current_user.user_type.zero?

  end
end
