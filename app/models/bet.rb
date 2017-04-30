class Bet < ApplicationRecord
  has_many :user_bets
  has_many :bet_options
  has_many :comments
  accepts_nested_attributes_for :bet_options
end
