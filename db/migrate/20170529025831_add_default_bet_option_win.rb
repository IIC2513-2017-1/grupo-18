class AddDefaultBetOptionWin < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:bet_options, :win, false)
  end
end
