# Migration
class AddWinOptionToBetOption < ActiveRecord::Migration[5.0]
  def change
    add_column :bet_options, :win, :boolean
  end
end
