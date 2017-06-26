json.partial! "bets/bet", bet: @bet
json.bet_options @bet.bet_options do |bo|
  json.description bo.description
  json.percentage bo.percentage
end
