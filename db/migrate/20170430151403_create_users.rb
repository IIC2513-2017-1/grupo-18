class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :confirmation_token
      t.string :confirmed_at
      t.integer :user_type

      t.timestamps
    end
  end
end
