//These are bugged for now, please don't spawn them in the game. -S.B.
/obj/item/projectile/bullet/pellet/rubber_ball
	damage = 0.5
	agony = 20
	embed_chance = 0
	sharp = 0
	check_armour = "melee"
	range_step = 2 //projectiles lose a fragment each time they travel this distance. Can be a non-integer.

	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20

	silenced = 1 //embedding messages are still produced so it's kind of weird when enabled.
	no_attack_log = 1
	muzzle_type = null

/obj/item/projectile/bullet/pellet/rubber_ball/strong
	damage = 1
	agony = 35
	embed_chance = 0
	sharp = 0

/obj/item/weapon/grenade/stinger
	name = "stinger grenade"
	desc = "A specialized less than lethal grenade designed to subdue assailants with high velocity rubber balls."
	icon_state = "stingergrenade"
	item_state = "grenade"

	var/fragment_types = list(/obj/item/projectile/bullet/pellet/rubber_ball, /obj/item/projectile/bullet/pellet/rubber_ball, /obj/item/projectile/bullet/pellet/rubber_ball, /obj/item/projectile/bullet/pellet/rubber_ball/strong)
	var/num_fragments = 63  //total number of fragments produced by the grenade
	var/explosion_size = 0   //size of the center explosion

	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7
	loadable = null

/obj/item/weapon/grenade/stinger/prime()
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	if(explosion_size)
		on_explosion(O)
	playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 30)
	src.fragmentate(O, num_fragments, spread_range, fragment_types)
	qdel(src)


/obj/item/weapon/grenade/stinger/proc/on_explosion(var/turf/O)
	if(explosion_size)
		explosion(O, -1, -1, explosion_size, round(explosion_size/2), 0)

/obj/fragmentate(var/fragment_number = 30, var/spreading_range = 5, var/list/fragtypes=list(/obj/item/projectile/bullet/pellet/rubber_ball/))