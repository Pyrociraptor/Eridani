/mob/living/simple_animal/catgirl
	name = "catgirl"
	desc = "Her hobbies are catnaps, knocking things over, and headpats."
	icon = 'icons/mob/vore.dmi'
	icon_state = "catgirl"

	speed = 5

	run_at_them = 0
	cooperative = 1
	investigates = 1
	reacts = 1

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 10

	speak_chance = 2
	speak = list("Meow!","Esp!","Purr!","HSSSSS","Mew?","Nya~")
	speak_emote = list("purrs","meows")
	emote_hear = list("meows","mews")
	emote_see = list("shakes her head","shivers")
	attacktext = list("swatted")

	var/random_skin = 1
	var/list/skins = list(
		"catgirlnude",
		"catgirlbikini",
		"catgirlrednude",
		"catgirlredbikini",
		"catgirlblacknude",
		"catgirlblackbikini",
		"catgirlbrownnude",
		"catgirlbrownbikini",
		"catgirlred",
		"catgirlblack",
		"catgirlbrown"
	)

/mob/living/simple_animal/catgirl/New()
	..()
	if(random_skin)
		icon_living = pick(skins)
		icon_rest = "[icon_living]asleep"
		icon_dead = "[icon_living]-dead"
		update_icon()

/mob/living/simple_animal/catgirl/retaliate
	retaliate = 1
