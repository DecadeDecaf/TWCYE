if (image_index == 5) {
	with (obj_control) {
		if (!fading && room != rm_game) {
			with (o) {
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 1)
			}
		}
	}
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 1)
}