function MovePlayer(left, right, down, up){
	if canMove {
		var xDirection = keyboard_check_pressed(right)-keyboard_check_pressed(left)
		var yDirection = keyboard_check_pressed(down)-keyboard_check_pressed(up)

		x += 32*xDirection
		y += 32*yDirection
		
		CheckIfTogether()
	}
}

function UseAbility(input) {
	if keyboard_check_pressed(input) && abilityCooldown <= 0 {
		if playerIndex == 0
			UseGrapplingHook()
		else if playerIndex == 1
			UseBoxingGlove()
	}
}

function UseGrapplingHook() {
	abilityCooldown = setAbilityCooldown
	
	GetTileIndex("Tiles", x, y)
	CheckIfTogether()
}

function UseBoxingGlove() {
	
}

function CheckIfTogether() {
	if playerIndex == 0 {
		distanceBetween = point_distance(x, y, Obj_Player2.x, Obj_Player2.y)
		show_debug_message(distanceBetween)
		if distanceBetween < 33
			global.together = true;
	}
}