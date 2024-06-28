if global.together {
	//show_debug_message(":3")
	with Obj_Player
		canMove = false
}

if room >= 3
	GameChangeRoomCheck()

if keyboard_check_pressed(ord("I")) {
	global.debug = !global.debug
	if global.debug {show_debug_message(string(global.debug) + " It's debug time")}
}

if global.debug {
	for(var i = 0; i < 6; i++) {
		if keyboard_check_pressed(ord(string(i)))
			room_goto(i)
	}
	
	if mouse_check_button_pressed(mb_left)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Smoke)
	if mouse_check_button_pressed(mb_right)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Fire)
		
}
