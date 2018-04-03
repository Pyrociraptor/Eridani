
/*
Swimsuits
*/

/datum/gear/uniform/swimsuits
	display_name = "swimsuits selection"
	path = /obj/item/weapon/storage/box/fluff/swimsuit

/datum/gear/uniform/swimsuits/New()
	..()
	var/list/swimsuits = list()
	for(var/swimsuit in typesof(/obj/item/weapon/storage/box/fluff/swimsuit))
		var/obj/item/weapon/storage/box/fluff/swimsuit/swimsuit_type = swimsuit
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(swimsuits))

/datum/gear/uniform/suit/gnshorts
	display_name = "GN shorts"
	path = /obj/item/clothing/under/fluff/gnshorts


//Tron Siren outfit
/datum/gear/uniform/siren
	display_name = "jumpsuit, Siren"
	path = /obj/item/clothing/under/fluff/siren