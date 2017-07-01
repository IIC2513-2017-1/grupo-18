class RemovePercentageFromBetOptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :bet_options, :percentage, :float
  end
end
