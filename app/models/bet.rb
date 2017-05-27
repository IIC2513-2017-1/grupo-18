# == Schema Information
#
# Table name: bets
#
#  id             :integer          not null, primary key
#  execution_date :datetime
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  visible        :boolean          default("true")
#

class Bet < ApplicationRecord
  has_many :bet_options
  has_many :user_bets, :through => :bet_options
  has_many :comments
  accepts_nested_attributes_for :bet_options
  belongs_to :user


  # To be run after a bet's execution date has been reached.
  def finish_bet
  	# Foreach user that's following this bet
  	# Send that user a mail with this bet's result
  	self.user_bets.each do |usr_bet|
  	  UserMailer.bet_finished(usr_bet.user, self).deliver_now
  	  # usr_bet.user.send_activation_email
  	end

  	#FIXME: also give each winning user their prize
  end
end
