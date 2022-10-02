randomize()
create_macros()
create_globals()
set_data()

set_fullscreen(true)
audio_master_gain(0.75)

reset_scene()

fading = false
fadeframe = 0

progress = 0
txtspd = 0.75

exception_unhandled_handler(error)

audio_sound_gain(snd_theme, 0, 0)
audio_sound_gain(snd_softtheme, 1, 0)

audio_play_sound(snd_theme, 1, true)
audio_play_sound(snd_softtheme, 1, true)

room_goto(rm_scenes)