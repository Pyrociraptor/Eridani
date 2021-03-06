/*
// This file holds all of the accessories used as part of the modular armor system. At some point it might be wise to split this into multiple files.
*/

/obj/item/clothing/accessory/armor
	name = "armor accessory"
	desc = "You should never see this description. Ahelp this, please."
	icon_override = 'icons/mob/modular_armor.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "pouches"
	w_class = ITEMSIZE_NORMAL

///////////
//Pouches
///////////
/obj/item/clothing/accessory/storage/pouches
	name = "storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to two items."
	icon_override = 'icons/mob/modular_armor.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "pouches"
	w_class = ITEMSIZE_NORMAL
	gender = PLURAL
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 2

/obj/item/clothing/accessory/storage/pouches/blue
	desc = "A collection of blue pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_blue"

/obj/item/clothing/accessory/storage/pouches/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_navy"

/obj/item/clothing/accessory/storage/pouches/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_green"

/obj/item/clothing/accessory/storage/pouches/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "pouches_tan"

/obj/item/clothing/accessory/storage/pouches/large
	name = "large storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches"
	slots = 4
	slowdown = 0.25

/obj/item/clothing/accessory/storage/pouches/large/blue
	desc = "A collection of blue pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_blue"

/obj/item/clothing/accessory/storage/pouches/large/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_navy"

/obj/item/clothing/accessory/storage/pouches/large/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_green"

/obj/item/clothing/accessory/storage/pouches/large/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "lpouches_tan"

////////////////
//Armor plates
////////////////
/obj/item/clothing/accessory/armor/armorplate
	name = "armor plate"
	desc = "A really shitty armor plate. Ahelp if you see this."
	icon_state = "armor_light"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_C

/obj/item/clothing/accessory/armor/armorplate/swat
	name = "swat armor plate"
	desc = "A medium armor plate with additional ablative coating. Attaches to a plate carrier."
	icon_state = "armor_tactical"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/combat
	name = "heavy armor plate"
	desc = "A ceramic armor plate with ablative laser coating. Attaches to a plate carrier."
	icon_state = "armor_merc"
	armor = list(melee = 70, bullet = 65, laser = 65, energy = 45, bomb = 45, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/specops
	name = "heavy armor plate"
	desc = "A ceramics-reinforced synthetic armor plate, providing state of of the art protection. Attaches to a plate carrier."
	icon_state = "armor_merc"
	armor = list(melee = 80, bullet = 70, laser = 70,energy = 50, bomb = 50, bio = 10, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/security
	name = "security armor insert"
	desc = "A standard NT-issue security vest insert for all NTDS contractors."
	icon_state = "insert_stab"
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 10, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/security/heavy
	name = "security armor plate"
	desc = "An armoured plate issued to NTDS contractors when shit hits the fan."
	icon_state = "armor_medium"
	armor = list(melee = 50, bullet = 40, laser = 40, energy = 25, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/bulletproof
	name = "bulletproof armor insert"
	desc = "A high density and strength bulletproof armor insert, has excellent bulletproof protection, but it's just at that."
	icon_state = "insert_kevlar"
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armorplate/laserproof
	name = "ablative armor insert"
	desc = "An ablative armor insert for plate carriers for assailants primarily armed with energy weapons."
	icon_state = "insert_ablative"
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.1

/obj/item/clothing/accessory/armor/armorplate/laserproof/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile/energy) || istype(damage_source, /obj/item/projectile/beam))
		var/obj/item/projectile/P = damage_source

		if(P.reflected) // Can't reflect twice
			return ..()

		var/reflectchance = 40 - round(damage/3)
		if(!(def_zone in BP_TORSO))
			reflectchance /= 2
		if(P.starting && prob(reflectchance))
			visible_message("<span class='danger'>\The [user]'s [src.name] reflects [attack_text]!</span>")

			// Find a turf near or on the original location to bounce to
			var/new_x = P.starting.x + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/new_y = P.starting.y + pick(0, 0, 0, 0, 0, -1, 1, -2, 2)
			var/turf/curloc = get_turf(user)

			// redirect the projectile
			P.redirect(new_x, new_y, curloc, user)
			P.reflected = 1



//////////////
//Arm guards
//////////////
/obj/item/clothing/accessory/armor/armguards
	name = "arm guards"
	desc = "A pair of black arm pads reinforced with armor plating. Attaches to a plate carrier."
//	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor.dmi', slot_wear_suit_str = 'icons/mob/modular_armor.dmi')
	icon_state = "armguards"
	gender = PLURAL
	body_parts_covered = ARMS
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_A

/obj/item/clothing/accessory/armor/armguards/blue
	desc = "A pair of blue arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_blue"

/obj/item/clothing/accessory/armor/armguards/navy
	desc = "A pair of navy blue arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_navy"

/obj/item/clothing/accessory/armor/armguards/green
	desc = "A pair of green arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_green"

/obj/item/clothing/accessory/armor/armguards/tan
	desc = "A pair of tan arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_tan"

/obj/item/clothing/accessory/armor/armguards/swat
	desc = "A pair of tactical arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "armguards_swat"
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 40, bomb = 35, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armguards/merc
	name = "heavy arm guards"
	desc = "A pair of red-trimmed black arm pads reinforced with heavy armor plating. Attaches to a plate carrier."
	icon_state = "armguards_merc"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armguards/laserproof
	name = "ablative arm guards"
	desc = "These arm guards will protect your arms from energy weapons."
	icon_state = "armguards_laser"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.4 //This is worse than the other ablative pieces, to avoid this from becoming the poor warden's insulated gloves.
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armguards/bulletproof
	name = "bullet resistant arm guards"
	desc = "These arm guards will protect your arms from ballistic weapons."
	icon_state = "armguards_bullet"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.7
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/armguards/riot
	name = "riot arm guards"
	desc = "These arm guards will protect your arms from close combat weapons."
	icon_state = "armguards_riot"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	siemens_coefficient = 0.5
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 50, bomb = 0, bio = 0, rad = 0)

//////////////
//Leg guards
//////////////
/obj/item/clothing/accessory/armor/legguards
	name = "leg guards"
	desc = "A pair of armored leg pads in black. Attaches to a plate carrier."
//	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor.dmi', slot_wear_suit_str = 'icons/mob/modular_armor.dmi')
	icon_state = "legguards"
	gender = PLURAL
	body_parts_covered = LEGS
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_L

/obj/item/clothing/accessory/armor/legguards/blue
	desc = "A pair of armored leg pads in blue. Attaches to a plate carrier."
	icon_state = "legguards_blue"

/obj/item/clothing/accessory/armor/legguards/navy
	desc = "A pair of armored leg pads in navy blue. Attaches to a plate carrier."
	icon_state = "legguards_navy"

/obj/item/clothing/accessory/armor/legguards/green
	desc = "A pair of armored leg pads in green. Attaches to a plate carrier."
	icon_state = "legguards_green"

/obj/item/clothing/accessory/armor/legguards/tan
	desc = "A pair of armored leg pads in tan. Attaches to a plate carrier."
	icon_state = "legguards_tan"

/obj/item/clothing/accessory/armor/legguards/swat
	desc = "A pair of armored leg pads. Attaches to a plate carrier."
	icon_state = "legguards_swat"
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 35, bomb = 35, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/legguards/merc
	name = "heavy leg guards"
	desc = "A pair of heavily armored leg pads in red-trimmed black. Attaches to a plate carrier."
	icon_state = "legguards_merc"
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/legguards/laserproof
	name = "ablative leg guards"
	desc = "These will protect your legs from energy weapons."
	icon_state = "legguards_laser"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.1
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/legguards/bulletproof
	name = "bullet resistant leg guards"
	desc = "These will protect your legs from ballistic weapons."
	icon_state = "legguards_bullet"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.7
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/legguards/riot
	name = "riot leg guards"
	desc = "These will protect your legs from close combat weapons."
	icon_state = "legguards_riot"
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	siemens_coefficient = 0.5
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

//////////////////////////
//Decorative attachments
//////////////////////////
/obj/item/clothing/accessory/armor/tag
	name = "\improper SCG Flag"
	desc = "An emblem depicting the Solar Confederate Government's flag."
//	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor.dmi', slot_wear_suit_str = 'icons/mob/modular_armor.dmi')
	icon_state = "solflag"
	slot = ACCESSORY_SLOT_ARMOR_M
	w_class = ITEMSIZE_SMALL

/obj/item/clothing/accessory/armor/tag/sifguard
	name = "\improper Sif Defense Force crest"
	desc = "An emblem depicting the crest of the Sif Defense Force."
	icon_state = "ecflag"

/obj/item/clothing/accessory/armor/tag/sec
	name = "\improper POLICE tag"
	desc = "An armor tag with the word POLICE printed in silver lettering on it."
	icon_state = "sectag"

/obj/item/clothing/accessory/armor/tag/com
	name = "\improper SCG tag"
	desc = "An armor tag with the words SOLAR CONFEDERATE GOVERNMENT printed in gold lettering on it."
	icon_state = "comtag"

/obj/item/clothing/accessory/armor/tag/nt
	name = "\improper CORPORATE SECURITY tag"
	desc = "An armor tag with the words CORPORATE SECURITY printed in red lettering on it."
	icon_state = "nanotag"

/obj/item/clothing/accessory/armor/tag/pcrc
	name = "\improper PCRC tag"
	desc = "An armor tag with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering on it."
	icon_state = "pcrctag"

/obj/item/clothing/accessory/armor/tag/saare
	name = "\improper SAARE tag"
	desc = "An armor tag with the acronym SAARE printed in olive-green lettering on it."
	icon_state = "saaretag"

/obj/item/clothing/accessory/armor/tag/opos
	name = "\improper O+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O POSITIVE."
	icon_state = "opostag"

/obj/item/clothing/accessory/armor/tag/oneg
	name = "\improper O- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O NEGATIVE."
	icon_state = "onegtag"

/obj/item/clothing/accessory/armor/tag/apos
	name = "\improper A+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A POSITIVE."
	icon_state = "apostag"

/obj/item/clothing/accessory/armor/tag/aneg
	name = "\improper A- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A NEGATIVE."
	icon_state = "anegtag"

/obj/item/clothing/accessory/armor/tag/bpos
	name = "\improper B+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B POSITIVE."
	icon_state = "bpostag"

/obj/item/clothing/accessory/armor/tag/bneg
	name = "\improper B- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B NEGATIVE."
	icon_state = "bnegtag"

/obj/item/clothing/accessory/armor/tag/abpos
	name = "\improper AB+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB POSITIVE."
	icon_state = "abpostag"

/obj/item/clothing/accessory/armor/tag/abneg
	name = "\improper AB- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB NEGATIVE."
	icon_state = "abnegtag"

/////////////////
// Helmet Covers
/////////////////

obj/item/clothing/accessory/armor/helmcover
	name = "helmet cover"
	desc = "A fabric cover for armored helmets."
	icon_override = 'icons/mob/ties.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	icon_state = "helmcover_blue"
	slot = ACCESSORY_SLOT_HELM_C

/obj/item/clothing/accessory/armor/helmcover/blue
	name = "blue helmet cover"
	desc = "A fabric cover for armored helmets in a bright blue color."
	icon_state = "helmcover_blue"

/obj/item/clothing/accessory/armor/helmcover/navy
	name = "navy blue helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue."
	icon_state = "helmcover_navy"

/obj/item/clothing/accessory/armor/helmcover/green
	name = "green helmet cover"
	desc = "A fabric cover for armored helmets. This one has a woodland camouflage pattern."
	icon_state = "helmcover_green"

/obj/item/clothing/accessory/armor/helmcover/tan
	name = "tan helmet cover"
	desc = "A fabric cover for armored helmets. This one has a desert camouflage pattern."
	icon_state = "helmcover_tan"

/obj/item/clothing/accessory/armor/helmcover/nt
	name = "\improper NanoTrasen helmet cover"
	desc = "A fabric cover for armored helmets. This one has NanoTrasen's colors."
	icon_state = "helmcover_nt"

/obj/item/clothing/accessory/armor/helmcover/pcrc
	name = "\improper PCRC helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue and has a tag in the back with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering on it."
	icon_state = "helmcover_pcrc"

/obj/item/clothing/accessory/armor/helmcover/saare
	name = "\improper SAARE helmet cover"
	desc = "A fabric cover for armored helmets. This one has SAARE's colors."
	icon_state = "helmcover_saare"