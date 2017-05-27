class AddNameToBet < ActiveRecord::Migration[5.0]
  def change
    add_column :bets, :name, :string
  end
end
