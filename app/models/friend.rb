# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User",
                                          foreign_key: "friend_id"

end
