
/datum/gear/accessory/white_drop_pouches
	allowed_roles = list("Paramedic","Chief Medical Officer","Medical Doctor","Chemist")

/datum/gear/accessory/white_vest
	allowed_roles = list("Paramedic","Chief Medical Officer","Medical Doctor","Chemist")

/datum/gear/accessory/flops
    display_name = "drop straps"
    description = "Wearing suspenders over shoulders? That's been so out for centuries and you know better."
    path = /obj/item/clothing/accessory/flops

/datum/gear/accessory/flops/New()
	..()
	gear_tweaks = list(gear_tweak_free_color_choice)