class AddBetOptionToUserBet < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_bets, :bet_option, foreign_key: true
  end
end
