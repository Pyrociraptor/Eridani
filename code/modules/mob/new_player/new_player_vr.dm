/mob/new_player/proc/spawn_checks_vr()
	var/pass = TRUE

	//No OOC notes
	if (config.allow_Metadata && client && client.prefs && (isnull(client.prefs.metadata) || length(client.prefs.metadata) < 15))
		to_chat(src,"<span class='warning'>Set OOC notes using the 'OOC Notes' button on the 'General' tab in character setup.</span>")
		pass = FALSE

	//Are they on the VERBOTEN LIST?
	if (prevent_respawns.Find(client.prefs.real_name))
		to_chat(src,"<span class='warning'>You've already quit the round as this character. You can't go back now that you've free'd your job slot. Play another character, or wait for the next round.</span>")
		pass = FALSE

	//Final popup notice
	if (!pass)
		alert(src,"There were problems with spawning your character. Check your message log for details.","Error","OK")
	return pass