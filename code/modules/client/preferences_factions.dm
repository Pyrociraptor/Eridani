var/global/list/seen_citizenships = list()
var/global/list/seen_systems = list()
var/global/list/seen_factions = list()
var/global/list/seen_antag_factions = list()
var/global/list/seen_religions = list()

//Commenting this out for now until I work the lists it into the event generator/journalist/chaplain.
/proc/UpdateFactionList(mob/living/carbon/human/M)
	/*if(M && M.client && M.client.prefs)
		seen_citizenships |= M.client.prefs.citizenship
		seen_systems      |= M.client.prefs.home_system
		seen_factions     |= M.client.prefs.faction
		seen_religions    |= M.client.prefs.religion*/
	return

var/global/list/citizenship_choices = list(
	"Solar Systems Alliance",
	"Eridani Trade Federation",
	"Frontier Federation",
	"United Sythetics of Orion",
	"Valem Democratic People's Republic",
	"Government of Viir�quiwq",
	"Naj'dii Empire",
	"Worker's State of Zhadhj'a",
	"Lescatian",
	"Patriarchy of Sintha"
	)

var/global/list/home_system_choices = list(
	"Sol",
	"Vir",
	"Nyx",
	"Tau Ceti",
	"Qerr'valis",
	"Epsilon Ursae Minoris",
	"Rarkajar"
	)

var/global/list/faction_choices = list(
	"Pending"
	)

var/global/list/antag_faction_choices = list()	//Should be populated after brainstorming. Leaving as blank in case brainstorming does not occur.

var/global/list/antag_visiblity_choices = list(
	"Hidden",
	"Shared",
	"Known"
	)

var/global/list/religion_choices = list(
	"Unitarianism",
	"Hinduism",
	"Buddhist",
	"Islam",
	"Christianity",
	"Agnosticism",
	"Deism",
	"Ssrazhiit"
	)