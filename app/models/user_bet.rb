# == Schema Information
#
# Table name: user_bets
#
#  id            :integer          not null, primary key
#  amount        :float
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bet_option_id :integer
#

class UserBet < ApplicationRecord
  belongs_to :user
  belongs_to :bet_option
  delegate :bet, to: :bet_option
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}
  before_create :update_balance
  before_destroy :devolver_plata
  def update_balance
    user.balance = user.balance - amount
    user.save
  end
  def devolver_plata
    user.balance = user.balance + amount
    user.save
  end
end
