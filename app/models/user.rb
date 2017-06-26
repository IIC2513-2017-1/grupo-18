# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(20)
#  email              :string
#  confirmation_token :string
#  confirmed_at       :string
#  user_type          :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  balance            :float            default("0.0")
#  name               :string
#  password_digest    :string
#  image              :string
#  activation_digest  :string
#  activated          :boolean          default("false")
#  activated_at       :datetime
#  gravatar_usage     :boolean          default("false")
#

# For use with the Gravatar API
require 'digest/md5'

class User < ApplicationRecord
  attr_accessor :activation_token

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
  has_many :friends
  has_many :comments
  has_many :friends
  has_many :bets

  # Triggers
  after_create  :send_activation_email
  before_create :create_activation_digest
  before_save   :downcase_email

  # Avatar uploader mounting
  mount_uploader :image, AvatarUploader

  # Methods

  ## Sends email with confirmation token to validate user
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Generates the gravatar URL for this user
  def gravatar_url
    hash = Digest::MD5.hexdigest(self.email)

    image_src = "//www.gravatar.com/avatar/#{hash}?d=identicon"
  end

  def self.gravatar_url email
    hash = Digest::MD5.hexdigest(email)

    image_src = "//www.gravatar.com/avatar/#{hash}?d=identicon"
  end


  # private
    # To be able to use it and compare it easily
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
