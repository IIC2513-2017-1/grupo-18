module BetsHelper
	def bets_where_user_participates(user)
		Bet.where(id: BetOption.where(id: UserBet.where(user_id:user.id).pluck(:bet_option_id)).pluck(:bet_id))
	end

	def bets_owned_by_friends_of(user)
		Bet.where(visible: true).or(Bet.where(user_id: Friend.where(friend_id:user.id).pluck(:user_id)))
	end
end
