class AddAvatarToBet < ActiveRecord::Migration[5.0]
  def change
    add_column :bets, :avatar, :string
  end
end
