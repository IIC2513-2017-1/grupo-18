# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(20)
#  email              :string
#  confirmation_token :string
#  confirmed_at       :string
#  user_type          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  balance            :float            default("0.0")
#  name               :string
#  password_digest    :string
#

class User < ApplicationRecord

  # Bcrypt imports
  has_secure_password

  # Validates
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, length: { in: 8..72 }, on: :create
  validates :balance, :numericality => { :greater_than_or_equal_to => 0}

  # Model relationships
  has_many :user_bets
  has_many :payments

  # Triggers
  after_create :send_confirmation
  before_create :default_values

  # Methods
  
  ## Sends email with confirmation token to validate user
  def send_confirmation
  end

  def default_values
    # Normal user
    self.user_type = 0
  end

end
