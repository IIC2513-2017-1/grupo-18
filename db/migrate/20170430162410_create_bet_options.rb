class CreateBetOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :bet_options do |t|
      t.string :description
      t.float :percentage
      t.references :bet, foreign_key: true

      t.timestamps
    end
  end
end
