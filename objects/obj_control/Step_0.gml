handle_fullscreen()

if (room == rm_scenes) {
	if (!fading) {
		var space = keyboard_check_pressed(vk_space)
		handle_script(space)
	} else {
		fadeframe++
		if (fadeframe == 75) {
			reset_scene()
			next_line()
		} else if (fadeframe == 150) {
			fadeframe = 0
			fading = false
		}
	}
} else if (room == rm_game) {
	if (g.found >= g.req) {
		g.found = 0
		g.chapter++
		g.scene = 1
		reset_scene()
		room_goto(rm_scenes)
	}
}