/**
 * Multitool -- A multitool is used for hacking electronic devices.
 * TO-DO -- Using it as a power measurement tool for cables etc. Nannek.
 *
 */

/obj/item/device/multitool
	name = "multitool"
	desc = "Used for pulsing wires to test which to cut. Not recommended by doctors."
	icon_state = "multitool"
	flags = CONDUCT
	force = 5.0
	w_class = ITEMSIZE_SMALL
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3
	desc = "You can use this on airlocks or APCs to try to hack them without cutting wires."

	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)
	var/obj/machinery/telecomms/buffer // simple machine buffer for device linkage
	var/obj/machinery/clonepod/connecting //same for cryopod linkage
	var/obj/machinery/connectable	//Used to connect machinery.
	toolspeed = 1

/obj/item/device/multitool/attack_self(mob/user)
	var/clear = alert("Do you want to clear the buffers on the [src]?",, "Yes", "No",)
	if(clear == "Yes")
		buffer = null
		connecting = null
		connectable = null
	else
		..()

/obj/item/device/multitool/dataknife
	name = "data knife"
	desc = "A data knife often used as an electronic hacking device, or as a fighting utility knife. It is currently in evasive mode and will function similar to a multitool."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "dataknife"
	item_state = "knife"
	flags = CONDUCT
	w_class = ITEMSIZE_SMALL
	force = 17
	throwforce = 10
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	edge = 1
	sharp = 1
	var/obj/item/weapon/card/emag/dataknife/counterpart = null

/obj/item/device/multitool/dataknife/New(newloc, no_counterpart = TRUE)
	..(newloc)
	if(!counterpart && no_counterpart)
		counterpart = new(src, FALSE)
		counterpart.counterpart = src

/obj/item/device/multitool/dataknife/Destroy()
	if(counterpart)
		counterpart.counterpart = null // So it can qdel cleanly.
		qdel_null(counterpart)
	return ..()

/obj/item/device/multitool/dataknife/attack_self(mob/user)
	playsound(get_turf(user),'sound/items/change_drill.ogg',50,1)
	user.drop_item(src)
	counterpart.forceMove(get_turf(src))
	src.forceMove(counterpart)
	user.put_in_active_hand(counterpart)
	to_chat(user, "<span class='notice'>You switch the [src] to invasive mode.</span>")

/obj/item/device/multitool/cyborg
	name = "multitool"
	desc = "Optimised and stripped-down version of a regular multitool."
	toolspeed = 0.5

/obj/item/device/multitool/alien
	name = "alien multitool"
	desc = "An omni-technological interface."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "multitool"
	toolspeed = 0.1
	origin_tech = list(TECH_MAGNET = 5, TECH_ENGINEERING = 5)