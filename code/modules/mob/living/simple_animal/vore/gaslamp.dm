/*
LORE:
Gaslamps are a phoron-based life form endemic to the world of Virgo-3B. They are
a sort of fungal organism with physical ties to Diona and Vox, deriving energy
for movement from a gentle combustion-like reaction in their bodies using
atmospheric phoron, carefully filtered trace oxygen, and captured meat products.
Over-exposure to oxygen causes their insides to burn too hot and eventually
kills them.

TODO: Make them light up and heat the air when exposed to oxygen.
*/

/mob/living/simple_animal/retaliate/gaslamp
	name = "gaslamp"
	desc = "Some sort of floaty alien with a warm glow. This creature is endemic to Virgo-3B."
	icon = 'icons/mob/vore32x64.dmi'
	icon_state = "gaslamp"
	icon_living = "gaslamp"
	icon_dead = "gaslamp-dead"

	faction = "virgo3b"
	maxHealth = 100
	health = 100
	move_to_delay = 4

	speak_chance = 1
	emote_see = list("looms", "sways gently")

	speed = 2

	melee_damage_lower = 30 // Because fuck anyone who hurts this sweet, innocent creature.
	melee_damage_upper = 30
	attacktext = list("thrashed")
	friendly = "caressed"

	response_help   = "brushes"	// If clicked on help intent
	response_disarm = "pushes" // If clicked on disarm intent
	response_harm   = "swats"	// If clicked on harm intent

	minbodytemp = 0
	maxbodytemp = 350

	min_oxy = 0
	max_oxy = 10 // Does not like oxygen very much.
	min_tox = 0 // Needs phoron to survive.
	max_tox = 5
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0