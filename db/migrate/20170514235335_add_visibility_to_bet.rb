class AddVisibilityToBet < ActiveRecord::Migration[5.0]
  def change
    add_column :bets, :visible, :boolean, default: true
  end
end
