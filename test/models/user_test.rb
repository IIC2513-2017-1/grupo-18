# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(20)
#  email              :string
#  encrypted_password :string
#  confirmation_token :string
#  confirmed_at       :string
#  user_type          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  balance            :float            default("0.0")
#  name               :string
#  password_hash      :string
#  password_digest    :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
