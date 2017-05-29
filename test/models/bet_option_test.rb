# == Schema Information
#
# Table name: bet_options
#
#  id          :integer          not null, primary key
#  description :string
#  percentage  :float
#  bet_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  win         :boolean          default("false")
#  user_bet_id :integer
#

require 'test_helper'

class BetOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
