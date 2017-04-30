json.extract! user_bet, :id, :amount, :user_id, :bet_id, :created_at, :updated_at
json.url user_bet_url(user_bet, format: :json)
