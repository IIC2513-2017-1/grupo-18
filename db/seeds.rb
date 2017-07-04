# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts("Seeding the database...")

## Step 1: basic elements of the DB.
pepe = User.create!(
	username: "pepe_el_pollo",
	email: "pepe.el.pollo.gmail@gmail.com",
	user_type: 0,
	balance: 100,
	name: "Pepe",
	password: "1234567890")

pato = User.create!(
	username: "pato_el_pez",
	email: "pato.el.pez.gmail@gmail.com",
	user_type: 0,
	balance: 300,
	name: "Patricio (el pez)",
	password: "1234567890")

felix = User.create!(
	username: "felix91gr",
	email: "felix91gr@gmail.com",
	user_type: 1,
	balance: 9001,
	name: "Félix Fischer",
	password: "wololowololo",
	remote_image_url: "https://steamuserimages-a.akamaihd.net/ugc/595886736952637584/BAD4E4DF66A7C18C1C37C2BE37B8AB2D75BDAA9A/",
	gravatar_usage: true)

felipe = User.create!(
  	username: "felipe",
  	email: "farojos@uc.cl",
  	user_type: 1,
  	balance: 9001,
  	name: "Felipe Rojos",
  	password: "jojooojo",
  	remote_image_url: "http://vignette4.wikia.nocookie.net/alejoyvalentina/images/9/91/El_viejo_del_viejo.png/revision/latest?cb=20120129130054&path-prefix=es",
	gravatar_usage: true)

### Nuevos user ###########################
pablo = User.create!(
	username: "pablo",
	email: "pablo.007.gmail@gmail.com",
	user_type: 0,
	balance: 1400,
	name: "Pablo X",
	password: "1234567890",
	gravatar_usage: true)

jorge = User.create!(
	username: "horuhe",
	email: "horuhe.kun.gmail@gmail.com",
	user_type: 0,
	balance: 3200,
	name: "Horuhe Yoshida",
	password: "1234567890",
	gravatar_usage: true)

matthew = User.create!(
	username: "panzer",
	email: "matthew.panzerino.gmail@gmail.com",
	user_type: 0,
	balance: 3300,
	name: "Matt Panzerino",
	password: "1234567890")

gruber = User.create!(
	username: "gruber",
	email: "jgruber.gmail@gmail.com",
	user_type: 0,
	balance: 13300,
	name: "John Gruber",
	password: "1234567890")

siracusa = User.create!(
	username: "siracusa",
	email: "jsir.gmail@gmail.com",
	user_type: 0,
	balance: 9000,
	name: "John Siracusa",
	password: "1234567890")

User.all.each do |usr|
	usr.activate
end

### Amistades #############################

## Amistad completa entre los admins :)
Friend.create!(
	user: felix,
	friend: felipe)
Friend.create!(
	user: felipe,
	friend: felix)

## Amistades unilaterales hacia pepe
Friend.create!(
	user: felix,
	friend: pepe)
Friend.create!(
	user: felipe,
	friend: pepe)

## Amistad unilateral desde pato
Friend.create!(
	user: pato,
	friend: felix)
Friend.create!(
	user: pato,
	friend: felipe)

###################

### Bets ##################################

surf = Bet.create!(
	user: pepe,
	name: "Who will win at the surfing contest?",
	description: %q(
"Surf's up!
Pepe el pollo, Cody Maverick and El Tanque are surfing for the great prize of the finals!),
	remote_avatar_url: "https://images.askmen.com/720x540/entertainment/better_look/surfing-films/3-1454432243.jpg",
	execution_date: Time.zone.now + 24.hours)

sandwich = Bet.create!(
	user: pato,
	name: "Cuál será el día de sandwich?",
	description: %q(
Lilo por qué estas tan mojada?
-Es día de sandwich, cada ~~~s le doy a pato el pez un sandwich de mermelada-
-Pato es un pez?-
-Y hoy no hay mermelada, y entonces mi hermana me﻿ dijo que le diera un sandwich de atún, no le puedo dar a pato atún.. Tú sabes lo que es atún?-
-Pez?-
-ES PEZ SI PATO COMO PEZ SERÍA UNA ABOMINACIÓN!!!!. Llegué tarde por ir a la tienda, por mermelada, porque solo había ese, ese tonto atún!-
-Lilo, Lilo, por que es tan importante?-
-Pato controla el clima-),
	# remote_avatar_url: "http://68.media.tumblr.com/tumblr_m5tokh9VLL1rnra94o1_500.gif",
	remote_avatar_url: "https://i.ytimg.com/vi/6INkgXyFwiI/hqdefault.jpg",
	execution_date: Time.zone.now + 2.days)

reverencia = Bet.create!(
	user: felix,
	name: "El viento sopla. La montaña, lo reverencia?",
	description: %q(
Li Shang v/s El Emperador),
	remote_avatar_url: "https://s-media-cache-ak0.pinimg.com/originals/07/95/86/079586311a1bef0cd6f1a0ca10624d09.jpg",
	execution_date: Time.zone.now + 2.hours)

feelingBlue = Bet.create!(
	user: felipe,
	name: "What's the use of feeling blue?",
	description:%q(Come on Pearl, sing for her. Make her feel better.),
	remote_avatar_url: "http://funnypictures3.fjcdn.com/pictures/Blue_50da62_6144448.jpg",
	execution_date: Time.zone.now + 1.day)
###########################################


### Bet Options ###########################

## Campeonato de surf
BetOption.create!(
	description: "Pepe el pollo",
	percentage: 1.45,
	bet: surf,
	win: true)

gana_cody = BetOption.create!(
	description: "Cody Maverick",
	percentage: 1.25,
	bet: surf)

gana_tanque = BetOption.create!(
	description: "Tanque",
	percentage: 0.05,
	bet: surf)

## Día de Sandwich
será_lunes = BetOption.create!(
	description: "Lunes",
	percentage: 1.2,
	bet: sandwich)

BetOption.create!(
	description: "Martes",
	percentage: 0.8,
	bet: sandwich)

BetOption.create!(
	description: "Miércoles",
	percentage: 0.2,
	bet: sandwich)

será_jueves = BetOption.create!(
	description: "Jueves",
	percentage: 0.001,
	bet: sandwich,
	win: true)

BetOption.create!(
	description: "Viernes",
	percentage: 0.2,
	bet: sandwich)

BetOption.create!(
	description: "Sábado",
	percentage: 0.8,
	bet: sandwich)

será_domingo = BetOption.create!(
	description: "Domingo",
	percentage: 1.2,
	bet: sandwich)

## Emperador v/s Shen Long
li_shang = BetOption.create!(
	description: "Sí",
	percentage: 1.8,
	bet: reverencia)

emperador = BetOption.create!(
	description: "No",
	percentage: 0.1,
	bet: reverencia,
	win: true)

## What's the use of feeling blue?
BetOption.create!(
	description: "AAAaaaAA",
	percentage: 0.1,
	bet: feelingBlue)

BetOption.create!(
	description: "AAAaaaAA",
	percentage: 0.1,
	bet: feelingBlue)

BetOption.create!(
	description: "AAAaaaAaaAAaaAA",
	percentage: 0.1,
	bet: feelingBlue)

BetOption.create!(
	description: "https://www.youtube.com/watch?v=dYqlYyQqzgY",
	percentage: 0.1,
	bet: feelingBlue,
	win: true)

###########################################

## Pepe cree que ganará su amigo
UserBet.create!(
	user: pepe,
	amount: 10,
	bet_option: gana_cody)
## Pato el pez cree que Tanque es el mejor
UserBet.create!(
	user: pato,
	amount: 50,
	bet_option: gana_tanque)

## Pato el pez sabe que el jueves es el día de sandwich
UserBet.create!(
	user: pato,
	amount: 100,
	bet_option: será_jueves)
## El iluso... xD
UserBet.create!(
	user: felix,
	amount: 200,
	bet_option: será_lunes)
## Otro más... xD
UserBet.create!(
	user: felipe,
	amount: 150,
	bet_option: será_domingo)

## Creemos en el emperador
UserBet.create!(
	user: felix,
	amount: 200,
	bet_option: emperador)
UserBet.create!(
	user: felipe,
	amount: 250,
	bet_option: emperador)
## Pato el pez no >:c
UserBet.create!(
	user: pato,
	amount: 150,
	bet_option: li_shang)

###########################################

### Comments ##############################

## Surf
Comment.create!(
	user: pepe,
	bet: surf,
	content: "Vamos Cody 🐧, yo sé que puedes 😄")
Comment.create!(
	user: pato,
	bet: surf,
	content: "Tanque los va a aplastar 😏")

## Sandwich
Comment.create!(
	user: pato,
	bet: sandwich,
	content: "Jajaja yo sé qué día es 😈")
Comment.create!(
	user: felix,
	bet: sandwich,
	content: "😮")
Comment.create!(
	user: felix,
	bet: sandwich,
	content: "Eso no se vale 🙁")

Comment.create!(
	user: felipe,
	bet: reverencia,
	content: "Vamos emperador 🙏🏻💪🏻")
Comment.create!(
	user: felix,
	bet: reverencia,
	content: "No lo reverencie!")
Comment.create!(
	user: pato,
	bet: reverencia,
	content: "Este viejo está acabado 😂")

Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: "Vamos Blue no llores 💔")
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
Why would you want to be here?
What do you ever see here?
That doesn’t make you feel worse than you do?
And tell me, what’s the use of feeling, Blue?))
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
Why would you want to employ her
Subjects that destroyed her?
Why keep up her silly
Zoo? Oh, tell me
What’s the use of feeling, Blue?))
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
An army has a use
They can go and fight a war
A Sapphire has a use
She can tell you what it’s for
An Agate terrifies
A Lapis terraforms
Where’s their diamond
When they need her, Blue?
You’ve got to be a leader, Blue))
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
Yes, of course, we still love her
And we’re always thinking of her
But now there’s nothing we can
Do, so tell me (Ahh-ahh)
What’s the use of feeling?
What’s the use of feeling?
What’s the use of feeling, Blue?))
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
Ohh
How can you stand to be here with it all? (here with it all)
Drowning in all this regret?
Wouldn’t you rather forget her? Ohhh
Won’t it be grand to get rid of it all? (rid of it all)
Let’s make a plan of attack
Start looking forward and stop looking back, oh))
Comment.create!(
	user: pepe,
	bet: feelingBlue,
	content: %q(
Yes, of course, we still love her
And we’re always thinking of her
Don’t you know I miss her, too?
But tell me
What’s the use of feeling?
What’s the use of feeling?
What’s the use of feeling—))

###########################################
puts("Database seeded.")

# foreach: usr.activate
