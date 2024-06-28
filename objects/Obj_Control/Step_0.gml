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
	if keyboard_check_pressed(ord("1")) {
		room_goto(0)
	} else if keyboard_check_pressed(ord("2")) {
		room_goto(1)
	} else if keyboard_check_pressed(ord("3")) {
		room_goto(2)
	} else if keyboard_check_pressed(ord("4")) {
		room_goto(3)
	} else if keyboard_check_pressed(ord("5")) {
		room_goto(4)
	}
	
	if mouse_check_button_pressed(mb_left)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Smoke)
	if mouse_check_button_pressed(mb_right)
		instance_create_layer(mouse_x, mouse_y, "Instances", Ps_Fire)
		
}
