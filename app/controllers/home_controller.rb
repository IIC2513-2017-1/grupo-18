class HomeController < ApplicationController
  include BetsHelper
  def index
    

    if logged_in?
      @bets_wagered_on = bets_where_user_participates(current_user)
    else
    end
  end
end
