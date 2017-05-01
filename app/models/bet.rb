class Bet < ApplicationRecord
  has_many :bet_options
  has_many :user_bets, through: :bet_options
  has_many :comments
  accepts_nested_attributes_for :bet_options
end
