if (!herring) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		if (mouse_check_button_pressed(mb_left)) {
			g.found++
			audio_play_sound(snd_ding, 0, false)
			instance_destroy()
		}
	}

	if ((fc + interval) mod 600 == 0) {
		if (sprite_index == spr_skateboard) {
			if (moved) {
				movex = 0
				movey = 0
			} else {
				movex = 30
				movey = 0
			}
			moved = !moved
		} else if (sprite_index == spr_cloud) {
			if (moved) {
				movex = 0
				movey = 0
			} else {
				movex = -20
				movey = -5
			}
			moved = !moved
		} else if (sprite_index == spr_rope) {
			if (moved) {
				movex = 0
				movey = 0
			} else {
				movex = 0
				movey = -35
			}
			moved = !moved
		} else if (sprite_index == spr_pinecone) {
			if (moved) {
				movex = 0
				movey = 0
			} else {
				movex = -15
				movey = -5
			}
			moved = !moved
		} else if (sprite_index == spr_boat) {
			if (moved) {
				movex = 0
				movey = 0
			} else {
				movex = -18
				movey = 2
			}
			moved = !moved
		} else if (sprite_index == spr_penny) {
			instance_create_depth(785, 1147, -1, obj_sparkle)
		} else if (sprite_index == spr_jewel) {
			instance_create_depth(1364, 158, -1, obj_sparkle)
		} else if (sprite_index == spr_nail) {
			instance_create_depth(2400, 1662, -1, obj_sparkle)
		} else if (sprite_index == spr_metalball) {
			instance_create_depth(2190, 832, -1, obj_sparkle)
		} else if (sprite_index == spr_pebble) {
			instance_create_depth(45, 722, -1, obj_sparkle)
		} else {
			image_index++
		}
	}
	var dis = point_distance(x, y, movex, movey)
	var dir = point_direction(x, y, movex, movey)
	if (dis > 1) {
		x += lengthdir_x(dis / 10, dir)
		y += lengthdir_y(dis / 10, dir)
	}
}