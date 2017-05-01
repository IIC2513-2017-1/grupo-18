class UserBet < ApplicationRecord
  belongs_to :user
  belongs_to :bet_option
  delegate :bet, to: :bet_option
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}
  before_create :update_balance
  def update_balance
    user.balance = user.balance - amount
    user.save
  end
end
