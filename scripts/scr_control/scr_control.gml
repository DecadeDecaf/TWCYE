function create_macros() {
	#macro g global
	#macro o other
}

function create_globals() {
	g.Data = {}
	g.FrameCount = 0
	#macro data g.Data
	#macro fc g.FrameCount
	
	g.mute = false
	
	g.chapter = 1
	g.scene = 1
	
	g.found = 0
	g.req = 1
}

function handle_fullscreen() {
	var f = keyboard_check_pressed(ord("F"))
	if (f) { switch_fullscreen() }
}

function switch_fullscreen() {
	var full = !window_get_fullscreen()
	set_fullscreen(full)
}

function set_fullscreen(full) {
	window_set_fullscreen(full)
	if (full) {
		window_set_size(1920, 1080)
	} else {
		window_set_size(960, 540)
	}
	display_reset(8, true)
}

function error(struct) {
	show_debug_message("ERROR: " + string(struct))
}