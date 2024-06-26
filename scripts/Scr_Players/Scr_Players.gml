function MovePlayer(left, right, down, up){
	if (canMove && keyboard_check_pressed(vk_anykey)) {
		var xDirection = keyboard_check_pressed(right)-keyboard_check_pressed(left)
		var yDirection = keyboard_check_pressed(down)-keyboard_check_pressed(up)

		x += 32*xDirection
		y += 32*yDirection
		SetLastDirection(xDirection, yDirection)
		
		CheckIfTogether()
	}
}

function SetLastDirection(xDir, yDir){
	lastDirection = [xDir, yDir]
	show_debug_message(string(playerIndex) + ": " + string(lastDirection))
}

function UseAbility(input) {
	if keyboard_check_pressed(input) && abilityCooldown <= 0 {
		if playerIndex == 0
			UseGrapplingHook(id)
		else if playerIndex == 1
			UseBoxingGlove(id)
	}
}

function UseGrapplingHook(player) {
	abilityCooldown = setAbilityCooldown
	with instance_create_layer(x, y, "Instances", Obj_GrappleHook) {
		creator = player
		x = creator.x;
		y = creator.y;
		maxDistance = 32*3
		projSpeed = 6
		directions = player.lastDirection
		direction = radtodeg(arcsin(directions[1]) + arccos(directions[0]))
		show_debug_message(string(directions) + " " + string(direction))
	}
}

function UseBoxingGlove(id) {
	
}

function CheckIfTogether() {
	if playerIndex == 0 {
		distanceBetween = point_distance(x, y, Obj_Player2.x, Obj_Player2.y)
		//show_debug_message(distanceBetween)
		if distanceBetween < 33
			global.together = true;
	}
}