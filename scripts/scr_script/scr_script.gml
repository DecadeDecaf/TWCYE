function open_script(chapter, scene) {
	var filename = "script/chapter" + string(chapter) + "/scene" + string(scene) + ".txt"
	var file = file_text_open_read(filename)
	return file
}

function close_script(file) {
	file_text_close(file)
}

function next_line() {
	var file = open_script(g.chapter, g.scene)
	var linetxt = ""
	var linelen = 0
	var amt = 0
	repeat (line) {
		file_text_readln(file)
	}
	var comma = 1
	var found = false
	var skip = false
	while (!found) {
		linetxt = file_text_read_string(file)
		linelen = string_length(linetxt)
		amt = linelen
		comma = string_pos(",", linetxt)
		if (comma != 0) {
			amt = comma
		} else {
			amt = linelen + 1
		}
		if (string_char_at(linetxt, 1) == "~") {
			var cmd = string_copy(linetxt, 2, amt - 2)
			var arg = string_copy(linetxt, amt + 2, 20)
			if (cmd == "bg") {
				var lay = layer_get_id("Background")
				var bglay = layer_background_get_id(lay)
				var bgname = variable_struct_get(data.bgs, arg)
				var bg = asset_get_index(bgname)
				layer_background_sprite(bglay, bg)
			} else if (cmd == "sfx") {
				var sndname = variable_struct_get(data.sfx, arg)
				var snd = asset_get_index(sndname)
				audio_play_sound(snd, 1, false)
			} else if (cmd == "char") {
				char = arg
			} else if (cmd == "pose") {
				chari = real(arg)
			} else if (cmd == "next") {
				reset_scene()
				found = true
			}
			file_text_readln(file)
			line++
		} else if (string_char_at(linetxt, 1) == "/" || linetxt == "") {
			if (file_text_eof(file)) {
				body = ""
				found = true
				if (g.scene < 2) {
					g.scene++
					skip = true
				} else {
					if (g.chapter == 4) {
						game_end()
					} else {
						room_goto(rm_game)
					}
				}
			} else {
				file_text_readln(file)
				line++
			}
		} else {
			body = wrap(linetxt)
			found = true
		}
	}
	close_script(file)
	if (skip) {
		fading = true
	}
}

function handle_script(space) {
	var prog = string_length(body)
	if (progress < prog) {
		progress += txtspd
		if (space) {
			progress = prog
		}
	} else {
		if (space) {
			progress = 0
			line++
			next_line()
		}
	}
}

function draw_script() {
	var header = ""
	if (char != "") {
		var character = variable_struct_get(data.chars, char)
		var header = character.names.def
	}
	var txt = body
	var prog = floor(progress)
	var ogx = 320
	var ogy = 792
	var padding = 96
	var txtpadding = 192
	var xx = ogx + txtpadding
	var yy = ogy - 120
	draw_sprite(spr_box, 0, ogx, ogy)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_set_font(fnt_regular)
	draw_set_color($1E1413)
	if (header != "") {
		draw_text_transformed(xx, yy, header, 0.75, 0.75, 0)
		yy += 60
	} else {
		txtpadding = 96
		xx = ogx + txtpadding
	}
	for (var i = 0; i < prog; i++) {
		var symb = string_char_at(txt, i + 1)
		var next = []
		for (var ii = 2; ii < 5; ii++) {
			array_push(next, string_char_at(txt, i + ii))
		}
		if (symb == "@") {
			if (next[@ 0] == "F") {
				if (next[@ 1] == "R") {
					draw_set_font(fnt_regular)
				} else if (next[@ 1] == "B") {
					draw_set_font(fnt_bold)
				} else {
					draw_set_font(fnt_regular)
				}
			} else if (next[@ 0] == "C") {
				if (next[@ 1] == "W") {
					draw_set_color($FFFFFF)
				} else if (next[@ 1] == "B") {
					draw_set_color($1E1413)
				} else {
					draw_set_color($1E1413)
				}
			}
			i += 2
		} else if (symb == "↵") {
			xx = ogx + txtpadding
			yy += 40
		} else {
			draw_text_transformed(xx, yy, symb, 0.5, 0.5, 0)
			var ww = ceil(string_width(symb) / 2)
			xx += ww
		}
	}
	draw_set_font(fnt_regular)
	draw_text_transformed(ogx + 880, ogy + 140, "(press the spacebar to continue)", 0.4, 0.4, 0)
	draw_set_color($FFFFFF)
	if (char != "") {
		var character = variable_struct_get(data.chars, char)
		var spr = asset_get_index(character.poses.def)
		var img = chari
		draw_sprite_ext(spr, img, ogx + padding, ogy, 0.9, 0.9, 0, -1, 1)
	}
}

function reset_scene() {
	line = 0
	body = ""
	char = ""
	chari = 0
	chars = {}
}

function wrap(str) {
	var n = 1
	var ats = 0
	var atw = string_width("WW")
	for (var i = 1; i <= string_length(str); i++) {
		var char = string_char_at(str, i)
		if (char == "@") {
			ats += 1
		}
		if (string_width(string_copy(str, n, i - (n - 1))) > 1920 + (ats * atw)) {
			while (string_char_at(str, i) != " " && i > 0) {
				i -= 1
			}
			if (i > 1) {
				str = string_delete(str, i, 1)
				str = string_insert("↵", str, i)
				n = i
				ats = 0
			} else {
				break
			}
		}
	}
	return str
}