function set_data() {
	data = {
		chars: {},
		bgs: {
			bathroom: "bg_bathroom",
			foyer: "bg_foyer",
			artroom: "bg_artroom",
			backyard: "bg_backyard",
			school: "bg_school",
			garage: "bg_garage",
			study: "bg_study",
			park: "bg_park",
			none: "bg_none"
		},
		sfx: {}
	}
	
	var narratordata = {
		names: {
			def: ""
		},
		poses: {
			def: "spr_narrator"
		}
	}
	
	var noadata = {
		names: {
			def: "Noa"
		},
		poses: {
			def: "spr_noa"
		}
	}
	
	var gabbydata = {
		names: {
			def: "Gabby"
		},
		poses: {
			def: "spr_gabby"
		}
	}
	
	var joannedata = {
		names: {
			def: "Jo Anne"
		},
		poses: {
			def: "spr_joanne"
		}
	}
	
	character_data("narrator", narratordata)
	character_data("noa", noadata)
	character_data("gabby", gabbydata)
	character_data("joanne", joannedata)
}

function character_data(name, char) {
	var defchar = new default_character()
	var newchar = struct_merge(defchar, char)
	variable_struct_set(data.chars, name, newchar)
}

function default_character() constructor {
	names = {}
	poses = {}
}