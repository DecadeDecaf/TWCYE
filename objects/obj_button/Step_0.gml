var xx = mouse_x
var yy = mouse_y

if (room == rm_game) {
	xx = mouse_x - (obj_camera.x - 960)
	yy = mouse_y - (obj_camera.y - 540)
}

print(point_distance(x, y, xx, yy))

if (point_distance(x, y, xx, yy) < 40) {
	if (image_xscale < 1) {
		image_xscale += 0.02
		image_yscale += 0.02
	}
	if (mouse_check_button_pressed(mb_left)) {
		if (image_index == 0) {
			game_end()
		} else if (image_index == 1) {
			switch_fullscreen()
		} else if (image_index == 2) {
			g.mute = true
			image_index = 3
			audio_master_gain(0)
		} else if (image_index == 3) {
			g.mute = false
			image_index = 2
			audio_master_gain(0.75)
		} else if (image_index == 4) {
			game_restart()
		} else if (image_index == 5) {
			if (room != rm_game) {
				with (obj_control) {
					if (g.scene < 2) {
						g.scene++
						fading = true
					} else {
						if (g.chapter == 4) {
							game_end()
						} else {
							room_goto(rm_game)
						}
					}
				}
			}
		}
	}
} else {
	if (image_xscale > 0.9) {
		image_xscale -= 0.02
		image_yscale -= 0.02
	}
}
