class BetOption < ApplicationRecord
  belongs_to :bet, required: false
  validates :percentage, presence: true, numericality: { greater_than: 0 }
end
