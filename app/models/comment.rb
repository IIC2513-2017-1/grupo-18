# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  bet_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Comment < ApplicationRecord
include SessionsHelper

  # Model relationships
  belongs_to :bet
  belongs_to :user
  # Validates
  validates :content, length: { in: 1..512 }
  def create_notification
    Notification.create(message: "El usuario #{self.user.name} ha comentado la apuesta #{self.bet.name}", user: self.bet.user)
  end
end
