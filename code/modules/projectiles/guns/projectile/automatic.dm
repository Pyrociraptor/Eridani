/obj/item/weapon/gun/projectile/automatic //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude //Except burstfire isn't fit for an rp server --Mark
	name = "prototype SMG"
	desc = "A protoype lightweight, fast firing gun. Uses 9mm rounds."
	icon_state = "saber"	//ugly
	w_class = ITEMSIZE_NORMAL
	load_method = SPEEDLOADER //yup. until someone sprites a magazine for it.
	max_shells = 22
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/a9mm
	projectile_type = /obj/item/projectile/bullet/pistol
	multi_aim = 1
	burst_delay = 2

//	one_handed_penalty = 15

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0))
//		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15,-30,-30), dispersion=list(0.6, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/c20r
	name = "C-20r"
	desc = "The C-20r is a lightweight and rapid firing SMG, for when you REALLY need someone dead. It has a Seburo Arms authentication stamped on the stock. Uses 10mm rounds."
	icon_state = "c20r"
	item_state = "c20r"
	w_class = ITEMSIZE_NORMAL
	force = 10
	caliber = "10mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	fire_sound = 'sound/weapons/c20r.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m10mm
	allowed_magazines = list(/obj/item/ammo_magazine/m10mm)
	projectile_type = /obj/item/projectile/bullet/pistol/medium
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

//	one_handed_penalty = 15

/obj/item/weapon/gun/projectile/automatic/c20r/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "c20r-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "c20r"
	return

/obj/item/weapon/gun/projectile/automatic/sts35
	name = "STS-35"
	desc = "The rugged Frontier Armament Company STS-35 is a durable automatic weapon that is standard issue with Frontier Federation forces. Uses 5.45mm rounds."
	icon_state = "arifle"
	item_state = "arifle"
	wielded_item_state = "arifle-wielded"
	item_state = null
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "5.45mm"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m545
	allowed_magazines = list(/obj/item/ammo_magazine/m545)
	projectile_type = /obj/item/projectile/bullet/rifle/a545
	fire_sound = 'sound/weapons/sts35.ogg'

//	one_handed_penalty = 30

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-15,-30), dispersion=list(0.0, 0.6, 0.6))
//		list(mode_name="short bursts", 	burst=5, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-15,-30,-30,-45), dispersion=list(0.6, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/sts35/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/m545/small))
		icon_state = "arifle-small" // If using the small magazines, use the small magazine sprite.
	else
		icon_state = (ammo_magazine)? "arifle" : "arifle-empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/wt550
	name = "WT-550"
	desc = "The WT550 Saber is a cheap self-defense weapon mass-produced by Ward-Takahashi for paramilitary and private use. Uses 9mm rounds."
	icon_state = "wt550"
	item_state = "wt550"
	w_class = ITEMSIZE_NORMAL
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = "/obj/item/ammo_casing/a9mmr"
	fire_sound = 'sound/weapons/wt550.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m9mmt/rubber
	allowed_magazines = list(/obj/item/ammo_magazine/m9mmt)
	projectile_type = /obj/item/projectile/bullet/pistol/medium

/obj/item/weapon/gun/projectile/automatic/wt550/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "wt550-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "wt550"
	return

/obj/item/weapon/gun/projectile/automatic/z8
	name = "Z8"
	desc = "The Z8 is an older model designated marksman rifle, made by the now defunct Zendai Foundries. Makes you feel like a space marine when you hold it, even though it can only hold 10 round magazines. Uses 7.62mm rounds and has an under barrel grenade launcher."
	name = "Type 8 - DMR"
	desc = "The Z8 Bulldog is an older model designated marksman rifle, reproduced by Kusanagi Precision under the name of 'Type 8'. Makes you feel like a space marine when you hold it. Uses 7.62mm rounds and has an under barrel grenade launcher."
	icon_state = "carbine" // This isn't a carbine. :T
	item_state = "z8carbine"
	wielded_item_state = "z8carbine-wielded"
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "7.62mm"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 3)
	fire_sound = 'sound/weapons/z8.ogg'
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m762
	allowed_magazines = list(/obj/item/ammo_magazine/m762)
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

//	one_handed_penalty = 60

	burst_delay = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=null, move_delay=6,    use_launcher=null, burst_accuracy=list(0,-15), dispersion=list(0.0, 0.6)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/z8/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/z8/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes(user) //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/update_icon(var/ignore_inhands)
	..()
	if(ammo_magazine)
		icon_state = "carbine"
	else
		icon_state = "carbine-empty"

	if(!ignore_inhands) update_held_icon()
	return

/obj/item/weapon/gun/projectile/automatic/z8/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/weapon/gun/projectile/automatic/z8/civilian
	name = "Z8-C"
	desc = "The Z8-C is the civilian version of the Z8 DMR, locked in semi-auto and the grenade launcher removed."
	use_launcher = 0

	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, burst_accuracy=null, dispersion=null)
		)

/obj/item/weapon/gun/projectile/automatic/z8/examine(mob/user)
	..()

/obj/item/weapon/gun/projectile/automatic/l6_saw
	name = "L6 SAW"
	desc = "A rather traditionally made L6 SAW with a pleasantly lacquered wooden pistol grip. 'Olympia Foundry-2531' is engraved on the reciever. Uses 5.45mm rounds. It's also compatible with magazines from STS-35 assault rifles."
	icon_state = "l6closed100"
	item_state = "l6closed"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = 0
	max_shells = 50
	caliber = "5.45mm"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	fire_sound = 'sound/weapons/machinegun.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m545saw
	allowed_magazines = list(/obj/item/ammo_magazine/m545saw, /obj/item/ammo_magazine/m545)
	projectile_type = /obj/item/projectile/bullet/rifle/a545

//	one_handed_penalty = 90

	var/cover_open = 0

/*	Commented out for quality control and testing.
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0), automatic = 0),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2), automatic = 0),
		list(mode_name="automatic",       burst=1, fire_delay=-1,    move_delay=null, burst_accuracy=null, dispersion=null, automatic = 1),
		)
*/

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
		)

/obj/item/weapon/gun/projectile/automatic/l6_saw/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/update_icon()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/m762))
		icon_state = "l6[cover_open ? "open" : "closed"]mag"
		item_state = icon_state
	else
		icon_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? round(ammo_magazine.stored_ammo.len, 25) : "-empty"]"
		item_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? "" : "-empty"]"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/l6_saw/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/as24
	name = "AS-24"
	desc = "The AS-24 is a rugged and dangerous automatic shotgun produced by PyroCorp Industries. Due to the nature of this firearm, it is classified as a destructive device on many civilized worlds and is illegal to own. Commonly seen in use by Frontier Federation shock troopers and is chambered in 12 gauge."
	icon_state = "ashot"
	item_state = null
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "12g"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m12gdrum
	allowed_magazines = list(/obj/item/ammo_magazine/m12gdrum)
	projectile_type = /obj/item/projectile/bullet/shotgun

//	one_handed_penalty = 60

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.0, 0.6, 0.6))
//		list(mode_name="6-round bursts", burst=6, move_delay=6, burst_accuracy = list(0,-15,-15,-30,-30, -30), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/as24/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ashot-[round(ammo_magazine.stored_ammo.len,12)]"
	else
		icon_state = "ashot"
	return

/obj/item/weapon/gun/projectile/automatic/mini_uzi
	name = "\improper Uzi"
	desc = "The iconic Uzi is a lightweight, compact, fast firing machine pistol. Olympia Foundry famously still produces these designs, which have changed little since the 20th century. Uses .45 rounds."
	icon_state = "mini-uzi"
	w_class = ITEMSIZE_NORMAL
	load_method = MAGAZINE
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 5)
	magazine_type = /obj/item/ammo_magazine/m45uzi
	allowed_magazines = list(/obj/item/ammo_magazine/m45uzi)

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, burst_delay=1, fire_delay=4, move_delay=4, burst_accuracy = list(0,-15,-15,-30,-30), dispersion = list(0.6, 1.0, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/mini_uzi/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mini-uzi"
	else
		icon_state = "mini-uzi-empty"

/obj/item/weapon/gun/projectile/automatic/p90
	name = "P90K PDW"
	desc = "The FAC P90K is a compact, large capacity submachine gun produced by Frontier Armament Company. Despite its fierce reputation, it still manages to feel like a toy. Uses 9mm rounds."
	icon_state = "p90smg"
	item_state = "p90"
	w_class = ITEMSIZE_NORMAL
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT // ToDo: Belt sprite.
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m9mmp90
	allowed_magazines = list(/obj/item/ammo_magazine/m9mmp90, /obj/item/ammo_magazine/m9mmt) // ToDo: New sprite for the different mag.

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/p90/update_icon()
	icon_state = "p90smg-[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 6) : "empty"]"

/obj/item/weapon/gun/projectile/automatic/tommygun
	name = "\improper Tommygun"
	desc = "This weapon was made famous by gangsters in the 20th century. Olympia Foundry is currently reproducing these for a target market of historic gun collectors and classy criminals. Uses .45 rounds."
	icon_state = "tommygun"
	w_class = ITEMSIZE_NORMAL
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 5)
	slot_flags = SLOT_BELT // ToDo: Belt sprite.
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m45tommy
	allowed_magazines = list(/obj/item/ammo_magazine/m45tommy, /obj/item/ammo_magazine/m45tommydrum)

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/tommygun/update_icon()
	..()
	icon_state = (ammo_magazine)? "tommygun" : "tommygun-empty"
//	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/c31a // Admin abuse assault rifle. ToDo: Make this less shit. Maybe remove its autofire, and make it spawn with only 10 rounds at start.
	name = "C-31A"
	desc = "The Seburo Arms C-31A is a lightweight, sturdy and hard-hitting bullpup assault rifle. It is the standard issue firearm of the SSA Armed Forces and can be found in use by Frontier Federation forces as well. Uses 7.62mm rounds."
	icon_state = "bullpup-small"
	item_state = "bullpup"
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "7.62mm"
	fire_sound = 'sound/weapons/c31a.ogg'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m762
	allowed_magazines = list(/obj/item/ammo_magazine/m762, /obj/item/ammo_magazine/m762m)
	projectile_type = /obj/item/projectile/bullet/rifle/a762

//	one_handed_penalty = 45

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-15), dispersion=list(0.0, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/c31a/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/m762))
		icon_state = "bullpup-small"
	else if(istype(ammo_magazine,/obj/item/ammo_magazine/m762m))
		icon_state = "bullpup"
	else
		item_state = "bullpup-empty"
	if(!ignore_inhands)
		update_held_icon()

/obj/item/weapon/gun/projectile/automatic/pcx12 // Admin abuse assault rifle. ToDo: Make this less shit. Maybe remove its autofire, and make it spawn with only 10 rounds at start.
	name = "PC-X12 'Bulldog' automatic shotgun"
	desc = "The PyroCorp Experimental 12 gauge automatic shotgun is the soon to be successor to it's successful AS-24. The bullpup design allows for compact firepower and controlled recoil. \
	Frontier Marine Marauders are reported to be exclusively using this shotgun in it's boarding parties. If you're seeing this, you should be in fear of your life."
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "12g"
	fire_sound = 'sound/weapons/bulldog.ogg'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m12ga
	allowed_magazines = list(/obj/item/ammo_magazine/m12ga, /obj/item/ammo_magazine/m12gdrum)
	projectile_type = /obj/item/projectile/bullet/shotgun
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

//	one_handed_penalty = 45

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="4-round bursts", burst=4, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-15), dispersion=list(0.0, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/pcx12/update_icon(var/ignore_inhands)
	..()
	if(ammo_magazine)
		icon_state = "bulldog"
	else
		icon_state = "bulldog-empty"

	if(!ignore_inhands) update_held_icon()
	return
