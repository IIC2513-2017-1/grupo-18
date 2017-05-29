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
#  name           :string
#  avatar         :string
#

class Bet < ApplicationRecord
  has_many :bet_options
  has_many :user_bets, :through => :bet_options
  has_many :comments
  accepts_nested_attributes_for :bet_options
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :execution_date, timeliness: { on_or_after: lambda { Date.current }, type: :date }
  # To be run after a bet's execution date has been reached.
  def finish_bet
  	# Foreach user that's following this bet
  	# Send that user a mail with this bet's result
  	self.user_bets.each do |usr_bet|
  	  UserMailer.bet_finished(usr_bet.user, self).deliver_now
  	end

  	#FIXME: also give each winning user their prize
  end
  def get_total
    amount = 0
    self.user_bets.each do |ub|
      amount = amount + ub.amount
    end
    amount
  end

  def winners
    win = self.bet_options.where(win: true)
    st = ""
    win.each do |q|
      st = st + q.id.to_s + " ; "
    end
    st[0...-3]
  end

  def short_description
    #byebug
    unless description[0..30] == description
      auxiliar = description
      auxiliar2 = description[0..30]
      truncated = auxiliar[31] == ' ' || auxiliar2[30] == ' '
      unless truncated
        text = auxiliar2.split(/ /)
        text.pop
        return text.join(' ') + ' ...'
      end
    end
    description
  end
end
