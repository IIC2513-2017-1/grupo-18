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
#

class BetOption < ApplicationRecord
  belongs_to :bet
end
