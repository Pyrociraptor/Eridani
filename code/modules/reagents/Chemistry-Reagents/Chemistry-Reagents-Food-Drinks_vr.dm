/datum/reagent/nutriment
	nutriment_factor = 10

/datum/reagent/lipozine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.nutrition = max(M.nutrition - 20 * removed, 0)
	M.overeatduration = 0
	if(M.nutrition < 0)
		M.nutrition = 0

/datum/reagent/ethanol/deathbell
	name = "Deathbell"
	id = "deathbell"
	description = "A successful experiment to make the most alcoholic thing possible."
	taste_description = "your brains smashed out by a smooth brick of hard, ice cold alcohol"
	color = "#9f6aff"
	taste_mult = 5
	strength = 10
	adj_temp = 10
	targ_temp = 330

	glass_name = "Deathbell"
	glass_desc = "The perfect blend of the most alcoholic things a bartender can get their hands on."

/datum/reagent/ethanol/deathbell/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()

	if(dose * strength >= strength) // Early warning
		M.make_dizzy(24) // Intentionally higher than normal to compensate for it's previous effects.
	if(dose * strength >= strength * 2.5) // Slurring takes longer. Again, intentional.
		M.slurring = max(M.slurring, 30)

/datum/reagent/ethanol/monstertamer
	name = "Monster Tamer"
	id = "monstertamer"
	description = "A questionably-delicious blend of a carnivore's favorite food and a potent neural depressant."
	taste_description = "the gross yet satisfying combination of chewing on a raw steak while downing a shot of whiskey"
	strength = 50
	color = "#d3785d"
	metabolism = REM * 2.5 // about right for mixing nutriment and ethanol.

	glass_name = "Monster Tamer"
	glass_desc = "This looks like a vaguely-alcoholic slurry of meat. Gross."

/datum/reagent/ethanol/monstertamer/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()