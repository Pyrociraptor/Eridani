/var/security_level = 0
//0 = code green
//1 = code blue
//2 = code red
//3 = code delta

//config.alert_desc_blue_downto
/var/datum/announcement/priority/security/security_announcement_up = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/notice1.ogg'))
/var/datum/announcement/priority/security/security_announcement_down = new(do_log = 0, do_newscast = 1)

/proc/set_security_level(var/level)
	switch(level)
		if("green")
			level = SEC_LEVEL_GREEN
		if("blue")
			level = SEC_LEVEL_BLUE
		if("red")
			level = SEC_LEVEL_RED
		if("delta")
			level = SEC_LEVEL_DELTA

	//Will not be announced if you try to set to the same level as it already is
	if(level >= SEC_LEVEL_GREEN && level <= SEC_LEVEL_DELTA && level != security_level)
		switch(level)
			if(SEC_LEVEL_GREEN)
				security_announcement_down.Announce("[config.alert_desc_green]", "Attention! Security level lowered to green")
				security_level = SEC_LEVEL_GREEN
			if(SEC_LEVEL_BLUE)
				if(security_level < SEC_LEVEL_BLUE)
					security_announcement_up.Announce("[config.alert_desc_blue_upto]", "Attention! Security level elevated to blue")
				else
					security_announcement_down.Announce("[config.alert_desc_blue_downto]", "Attention! Security level lowered to blue")
				security_level = SEC_LEVEL_BLUE
			if(SEC_LEVEL_RED)
				if(security_level < SEC_LEVEL_RED)
					security_announcement_up.Announce("[config.alert_desc_red_upto]", "Attention! Code red!", new_sound = 'sound/effects/redalert1.ogg')
				else
					security_announcement_down.Announce("[config.alert_desc_red_downto]", "Attention! Code red!", new_sound = 'sound/effects/redalert1.ogg')
				security_level = SEC_LEVEL_RED
				/*	- At the time of commit, setting status displays didn't work properly
				var/obj/machinery/computer/communications/CC = locate(/obj/machinery/computer/communications,world)
				if(CC)
					CC.post_status("alert", "redalert")*/
			if(SEC_LEVEL_DELTA)
				security_announcement_up.Announce("[config.alert_desc_delta]", "Attention! Delta security level reached!", new_sound = 'sound/effects/escape_alarm.ogg')
				security_level = SEC_LEVEL_DELTA

		var/newlevel = get_security_level()
		for(var/obj/machinery/firealarm/FA in machines)
			if(FA.z in using_map.contact_levels)
				FA.set_security_level(newlevel)

		if(level >= SEC_LEVEL_RED)
			atc.reroute_traffic(yes = 1) // Tell them fuck off we're busy.
		else
			atc.reroute_traffic(yes = 0)
		admin_chat_message(message = "Security level is now: [uppertext(get_security_level())]", color = "#CC2222") //VOREStation Add

/proc/get_security_level()
	switch(security_level)
		if(SEC_LEVEL_GREEN)
			return "green"
		if(SEC_LEVEL_BLUE)
			return "blue"
		if(SEC_LEVEL_RED)
			return "red"
		if(SEC_LEVEL_DELTA)
			return "delta"

/proc/num2seclevel(var/num)
	switch(num)
		if(SEC_LEVEL_GREEN)
			return "green"
		if(SEC_LEVEL_BLUE)
			return "blue"
		if(SEC_LEVEL_RED)
			return "red"
		if(SEC_LEVEL_DELTA)
			return "delta"

/proc/seclevel2num(var/seclevel)
	switch( lowertext(seclevel) )
		if("green")
			return SEC_LEVEL_GREEN
		if("blue")
			return SEC_LEVEL_BLUE
		if("red")
			return SEC_LEVEL_RED
		if("delta")
			return SEC_LEVEL_DELTA


/*DEBUG
/mob/verb/set_thing0()
	set_security_level(0)
/mob/verb/set_thing1()
	set_security_level(1)
/mob/verb/set_thing2()
	set_security_level(2)
/mob/verb/set_thing3()
	set_security_level(3)
*/