class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.datetime :execution_date
      t.string :description

      t.timestamps
    end
  end
end
