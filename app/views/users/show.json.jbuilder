json.partial! "users/user", user: @user
unless different_user?
  json.bet_you_are_on do
    @bets_wagered_on.each do |bet|
      json.name bet.name
    end
  end
end
