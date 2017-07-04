module LayoutHelper
	
	def cp(path)
		"current" if current_page?(path)
	end

	def cc(c)
		"current" if controller_name == c
	end
	
	def random_quote
		if I18n.locale == :en
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
		elsif I18n.locale == :es 
			[
				"Renuncia mientras vas ganando, todos los buenos apostadores lo hacen.",
				"Come con el dinero que apuestas, pero nunca apuestes el dinero con el que comes.",
				"Muéstrame un apostador rico y te mostraré un hombre que creó su fortuna de algo más que las apuestas.",
				"Un dólar ganado es dos veces más dulce que un dólar trabajado.",
				"Recuerda esto: la casa no vence al jugador, sólo le da una oportunidad para vencerse a sí mismo.",
				"La suerte golpea a la puerta de todo hombre una vez en la vida, pero en muchos casos éste está bebiendo en un bar cercano y no la escucha golpear.",
				"Suerte es lo que pasa cuando la preparación se encuentra con la oportunidad.",
				"Si tienes que jugar, decide tres cosas al comenzar: las reglas, qué apostarás y en qué momento te retirarás.",
				"Un jugador asustado nunca gana.",
				"Si no estás siquiera un poco asustado cuando entras a un casino, o eres muy rico o no has estudiado los juegos lo suficiente.",
				"La apuesta, como tema, es muy incluyente: combina el instinto natural del hombre de jugar y su deseo de saber sobre su destino y su futuro.",
				"Depende de la pata del conejo si quieres, pero recuerda que no le sirvió al conejo.",
				"Una de las formas más sanas de apostar es con una pala y un paquete de semillas."
				].sample
		else
			"I do not speak this locale."
		end
	end
end
