class AddDefaultUserType < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:users, :user_type, 0)
  end
end
