global.together = false;
spin = 0
sulk = 0
textIndex = irandom(5)

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, #0098DB)

if room == room_last
	audio_stop_sound(radicalfishing)
else if !audio_is_playing(radicalfishing)
	audio_play_sound(radicalfishing, 10, true)