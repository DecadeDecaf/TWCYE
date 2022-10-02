if (room == rm_scenes) {
	if (!fading) {
		draw_script()
	} else {
		var alph = (fadeframe < 75 ? (fadeframe/75) : (1 - ((fadeframe % 75)/75)))
		draw_set_alpha(alph)
		draw_set_color($1E1413)
		draw_rectangle(0, 0, 1920, 1080, false)
		draw_set_alpha(1)
	}
} else if (room == rm_game) {
	draw_sprite(spr_UI, 0, 0, 0)
	var str = string(g.found) + "/" + string(g.req)
	draw_set_color($1E1413)
	draw_text(1760, 1006, str)
	draw_set_color($FFFFFF)
	draw_text(1758, 1004, str)
}