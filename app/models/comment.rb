# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  bet_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
include SessionsHelper

  # Model relationships
  belongs_to :bet
  belongs_to :user

  # Validates
  validates :content, length: { in: 1..512 }

  # Triggers
  before_create :fill_values


  # Methods
  def fill_values
  	self.user_id = current_user.id
  	self.bet_id = 1
  end


end
