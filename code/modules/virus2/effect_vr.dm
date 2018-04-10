///////////////////////////////////////////////
/////////////////// Stage 1 ///////////////////

/datum/disease2/effect/mlem
	name = "Mlemington's Syndrome"
	stage = 1
	chance_maxm = 25
	activate(var/mob/living/carbon/mob,var/multiplier)
		mob.say("[pick("Mlem.","MLEM!","Mlem?")]")

/datum/disease2/effect/spin
	name = "Spyndrome"
	stage = 1
	chance_maxm = 7

	var/list/directions = list(2,4,1,8,2,4,1,8,2,4,1,8,2,4,1,8,2,4,1,8)
	activate(var/mob/living/carbon/mob,var/multiplier)
		if(mob.buckled())
			viewers(mob) << "<span class='warning'>[mob.name] struggles violently against their restraints!</span>"
		else
			viewers(mob) << "<span class='warning'>[mob.name] spins around violently!</span>"
			for(var/D in directions)
				mob.dir = D
				sleep(1)
			mob.dir = pick(2,4,1,8) //For that added annoyance

///////////////////////////////////////////////
/////////////////// Stage 2 ///////////////////

/datum/disease2/effect/lang
	name = "Lingual Dissocation"
	stage = 2
	chance_maxm = 2

	activate(var/mob/living/carbon/mob,var/multiplier)
		mob.set_default_language(pick(mob.languages))