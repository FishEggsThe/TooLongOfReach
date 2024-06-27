if global.together {
	//show_debug_message(":3")
	with Obj_Player
		canMove = false
}

if keyboard_check_pressed(ord("I")) {
	global.debug = !global.debug
	if global.debug {show_debug_message(string(global.debug) + " It's debug time")}
}

if global.debug {
	if keyboard_check_pressed(vk_f1) {
		room_goto(0)
	} else if keyboard_check_pressed(vk_f2) {
		room_goto(1)
	} else if keyboard_check_pressed(vk_f3) {
		room_goto(2)
	} else if keyboard_check_pressed(vk_f4) {
		room_goto(3)
	}
	
	if mouse_check_button_pressed(mb_left)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Smoke)
	if mouse_check_button_pressed(mb_right)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Fire)
		
}
