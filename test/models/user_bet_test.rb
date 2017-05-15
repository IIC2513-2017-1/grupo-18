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

require 'test_helper'

class UserBetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
