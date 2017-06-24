class AddGravatarUsageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gravatar_usage, :bool
  end
end
