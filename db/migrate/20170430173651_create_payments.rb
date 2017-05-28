# Migration
class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.float :amount, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
