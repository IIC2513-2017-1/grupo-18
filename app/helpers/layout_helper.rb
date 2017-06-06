module LayoutHelper
	
	def cp(path)
		"current" if current_page?(path)
	end

	def cc(c)
		"current" if controller_name == c
	end
	
	def random_quote
		[
			"Quit while you’re ahead. All the best gamblers do.", 
			"Eat your betting money, but never bet your eating money.",
			"Show me a wealthy gambler and I’ll show you a man who made his fortune from something other than gambling.",
			"A dollar won is twice as sweet as a dollar earned.",
			"Remember this: The house doesn’t beat the player. It just gives him an opportunity to beat himself.",
			"Fortune knocks at every man's door once in a lifetime, but in a good many cases the man is in a neighboring saloon and does not hear her.",
			"Luck is what happens when preparation meets opportunity.",
			"If you must play, decide three things when you start: the rules, the stakes of the game, and the quitting time.",
			"Scared money never wins.",
			"If you ain't just a little scared when you enter a casino, you are either very rich or you haven't studied the games enough.",
			"The subject of gambling is all encompassing. It combines man's natural play instinct with his desire to know about his fate and his future.",
			"Depend on the rabbit's foot if you will, but remember it didn't work for the rabbit.",
			"One of the healthiest ways to gamble is with a spade and a package of garden seeds."
			].sample
	end
end
