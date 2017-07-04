module BetOptionsHelper
	def total_amount_bet_on(bet_opt)
		total = 0
		bet_opt.user_bets.each do |u_bet|
			total += u_bet.amount
		end
		total
	end

	def is_this_bet_opt_winner?(bet_opt)
		bet_opt.win
	end

end
