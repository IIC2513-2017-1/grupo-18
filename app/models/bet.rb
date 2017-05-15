# == Schema Information
#
# Table name: bets
#
#  id             :integer          not null, primary key
#  execution_date :datetime
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Bet < ApplicationRecord
  has_many :bet_options
  has_many :user_bets, through: :bet_options
  has_many :comments
  accepts_nested_attributes_for :bet_options
  belongs_to :user
end
