class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true, limit: 20
      t.string :email, unique: true
      t.string :encrypted_password
      t.string :confirmation_token
      t.string :confirmed_at
      t.integer :user_type
      t.timestamps
    end
  end
end
