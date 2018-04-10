//Our call for the NIF to do whatever
/mob/living/carbon/human/proc/handle_nif()
	if(!nif) return

	//Process regular life stuff
	nif.life()
