class RemoveEncryptedPasswordFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :password_hash, :string
  end
end
