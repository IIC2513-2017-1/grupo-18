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
#  win         :boolean
#  user_bet_id :integer
#
class BetOption < ApplicationRecord
  belongs_to :bet, required: false
  has_many :user_bets
  validates :percentage, presence: true, numericality: { greater_than: 0 }
end
