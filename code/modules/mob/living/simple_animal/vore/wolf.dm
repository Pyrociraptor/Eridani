/mob/living/simple_animal/hostile/wolf
	name = "grey wolf"
	desc = "My, what big jaws it has!"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "wolf-dead"
	icon_living = "wolf"
	icon_state = "wolf"

	speed = 5

	run_at_them = 0
	cooperative = 1
	investigates = 1
	returns_home = 1
	reacts = 1

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 25

	minbodytemp = 200