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

class User < ApplicationRecord

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_length_of :password, minimum: 8
  has_many :user_bets
  has_many :payments
  # validates :balance, :numericality => { :greater_than_or_equal_to => 0}

end
