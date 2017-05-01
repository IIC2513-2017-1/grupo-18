class Payment < ApplicationRecord
  belongs_to :user
  before_save :update_balance
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}
  def update_balance
    user.balance = user.balance + amount
    user.save
  end
end
