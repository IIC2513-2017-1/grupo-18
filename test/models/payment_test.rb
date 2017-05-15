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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
