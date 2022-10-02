if (room == rm_scenes) {
	audio_sound_gain(snd_theme, 0, 200)
	audio_sound_gain(snd_softtheme, 1, 200)
	next_line()
} else if (room == rm_game) {
	audio_sound_gain(snd_theme, 1, 200)
	audio_sound_gain(snd_softtheme, 0, 200)
	if (g.chapter == 1) {
		create_object(spr_stoplight)
		create_object(spr_apple)
		create_object(spr_chameleon)
		create_object(spr_mowerlight)
		create_object(spr_golfball)
		create_herring(spr_skateboard)
		create_herring(spr_cloud)
		create_herring(spr_rope)
		create_herring(spr_boat)
		create_herring(spr_pinecone)
		create_herring(spr_penny)
		create_herring(spr_jewel)
		create_herring(spr_nail)
		create_herring(spr_metalball)
		create_herring(spr_pebble)
		g.req = 5
	} else if (g.chapter == 2) {
		create_herring(spr_stoplight)
		create_herring(spr_apple)
		create_herring(spr_chameleon)
		create_herring(spr_mowerlight)
		create_herring(spr_golfball)
		create_object(spr_skateboard)
		create_object(spr_cloud)
		create_object(spr_rope)
		create_object(spr_boat)
		create_object(spr_pinecone)
		create_herring(spr_penny)
		create_herring(spr_jewel)
		create_herring(spr_nail)
		create_herring(spr_metalball)
		create_herring(spr_pebble)
		g.req = 5
	} else if (g.chapter == 3) {
		create_herring(spr_stoplight)
		create_herring(spr_apple)
		create_herring(spr_chameleon)
		create_herring(spr_mowerlight)
		create_herring(spr_golfball)
		create_herring(spr_skateboard)
		create_herring(spr_cloud)
		create_herring(spr_rope)
		create_herring(spr_boat)
		create_herring(spr_pinecone)
		create_object(spr_penny)
		create_object(spr_jewel)
		create_object(spr_nail)
		create_object(spr_metalball)
		create_object(spr_pebble)
		g.req = 5
	} else {
		g.req = 0
	}
}