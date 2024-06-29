event_inherited()
if global.debug {
	var h = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left))/2
	x+=h
	var v = (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up))/2
	y+=v
}