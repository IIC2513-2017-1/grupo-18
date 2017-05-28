class AddUserBetsToBetOption < ActiveRecord::Migration[5.0]
  def change
    add_column :bet_options, :user_bet_id, :integer
  end
end
