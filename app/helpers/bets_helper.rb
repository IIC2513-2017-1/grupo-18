module BetsHelper
include FriendsHelper

	def bets_where_user_participates(user)
		Bet.where(id: BetOption.where(id: UserBet.where(user_id:user.id).pluck(:bet_option_id)).pluck(:bet_id))
	end

	def bets_of(user)
		Bet.where(user_id: user.id)
	end

	def bets_owned_by_friends_of(user)
		Bet.where(user_id: Friend.where(friend_id:user.id).pluck(:user_id))
	end

	def bets_public_and_not_owned_by_friends_or_user(user)
		Bet.where(visible: true) - bets_of(user) - bets_owned_by_friends_of(user)
	end

	def do_I_have_access?(me, owner)
		are_we_both_friends?(me, owner) ||
		me == @bet.user 
	end

	def is_this_bet_open?
		@bet.execution_date > Time.now
	end

	def get_winner_options
		@bet.bet_options.where(win: :true).first.description
	end
end
