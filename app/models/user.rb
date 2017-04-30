class User < ApplicationRecord
  require 'digest/sha2'
  require 'securerandom'
  attr_accessor :password
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 4, allow_blank: true
  validates :password, confirmation: true # password_confirmation attr
  before_save :encrypt_password
  after_save :clear_password
  def encrypt_password
    return unless password.present?
    self.encrypted_password = Digest::SHA256.hexdigest(password)
  end

  def clear_password
    self.password = nil
  end
end
