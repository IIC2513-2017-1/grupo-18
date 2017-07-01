# == Schema Information
#
# Table name: bet_options
#
#  id          :integer          not null, primary key
#  description :string
#  bet_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  win         :boolean          default("false")
#  user_bet_id :integer
#

class BetOption < ApplicationRecord
  belongs_to :bet, required: false
  has_many :user_bets, dependent: :destroy
end
