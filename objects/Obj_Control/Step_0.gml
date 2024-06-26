if mouse_check_button_pressed(mb_left) {
	GetTileIndex("Tiles", mouse_x, mouse_y)
}

if global.together {
	//show_debug_message(":3")
}

if keyboard_check_pressed(ord("I")) {
	global.debug = !global.debug
	show_debug_message("It's debug time")
}

if global.debug {
	if mouse_check_button_pressed(mb_left) {
		debugMouseX = mouse_x
		debugMouseY = mouse_y
		var tileI = GetTileIndex("Tiles", debugMouseX, debugMouseY)
		if (tileI == 3 || tileI == 14) {
			SetTileIndex("Tiles", debugMouseX, debugMouseY, 3)
			alarm[0] = setAlarm
		}
	}
	
	if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X"))){
		var increment = keyboard_check_pressed(ord("X")) - keyboard_check_pressed(ord("Z"))
		setAlarm += increment
		show_debug_message(setAlarm)
	}
}
