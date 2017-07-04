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
  has_many :bet_options, :dependent => :destroy
  has_many :user_bets, :through => :bet_options
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :bet_options
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :execution_date, timeliness: { on_or_after: lambda { Date.current }, type: :date }

  after_save :automanage_execution

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

  private
    def automanage_execution
      self.delay(run_at: execution_date).finish_bet_second_ver
    end

    def finish_bet_second_ver
      winner_bet_opts = self.bet_options.find_by(win: true).first

      winner_user_bets = winner_bet_opts.user_bets

      winner_bets_per_user = Hash.new(0)

      total_in_winner_bets = 0

      winner_user_bets.each do |w_ub|
        winner_bets_per_user[w_ub.user] += w_ub.amount
        total_in_winner_bets += w_ub.amount
      end

      # Rates to multiply the winner's pool later.
      winner_rate_per_user = Hash.new(0)

      winner_bets_per_user.each do |user, bet|
        winner_rate_per_user[user] = bet / total_in_winner_bets
        puts(bet / total_in_winner_bets)
      end

      total_money_waged_on_bet = 0

      self.user_bets.each do |u_bet|
        total_money_waged_on_bet += u_bet.amount
      end

      commision = 0.05 # 5% commision

      puts("The house gets #{commision * total_money_waged_on_bet}")

      total_money_to_give_out = total_money_waged_on_bet * (1 - commision)

      puts("A total of #{total_money_to_give_out} will be given out to winners")

      winner_rate_per_user.each do |user, rate|
        user.balance += total_money_to_give_out * rate
        user.save

        puts("#{total_money_to_give_out * rate} was given to #{user.name}")
      end
    end

    # To be run after a bet's execution date has been reached.
    def finish_bet
      bet_options.each do |op|
        if op.win
          op.user_bets.each do |ub|
            amount = ub.amount * ub.percentage
            us = ub.user
            us.amount = us.amount + amount
            us.save
          end
        end
      end
      self.user_bets.each do |usr_bet|
        UserMailer.bet_finished(usr_bet.user, self).deliver_now
      end
    end
end
