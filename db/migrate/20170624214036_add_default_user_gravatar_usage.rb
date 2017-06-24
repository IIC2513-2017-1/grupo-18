class AddDefaultUserGravatarUsage < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:users, :gravatar_usage, false)
  end
end
