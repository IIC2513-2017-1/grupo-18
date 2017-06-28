# == Schema Information
#
# Table name: payments
#
#  id           :integer          not null, primary key
#  amount       :float            default("0.0")
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  payment_type :integer
#

class Payment < ApplicationRecord
  belongs_to :user
  before_save :update_balance
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}
  validates :user, presence: true

  def update_balance
    user.balance = user.balance + amount
    user.save
  end
end
