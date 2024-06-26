function MovePlayer(left, right, down, up){
	if (canMove && keyboard_check_pressed(vk_anykey)) {
		var xDirection = keyboard_check_pressed(right)-keyboard_check_pressed(left)
		var yDirection = keyboard_check_pressed(down)-keyboard_check_pressed(up)
		
		var newX = x+32*xDirection
		var newY = y+32*yDirection
		var tileInWay = GetTileIndex("Tiles", newX, newY)
		if (tileInWay != 9 && tileInWay != 13) {
			if tileInWay == 1 {
				SetTileIndex("Tiles", x+32*(1*xDirection), y+32*(1*yDirection), 0)
				SetTileIndex("Tiles", x+64*(1*xDirection), y+64*(1*yDirection), 1)

			} else {
				if xDirection != 0 {
					x = newX
					SetLastDirection(xDirection, 0)
				} else if yDirection != 0 {
					y = newY
					SetLastDirection(0, yDirection)
				}
			}
		}
		
		
		CheckIfTogether()
	}
}

function SetLastDirection(xDir, yDir){
	lastDirection = [xDir, yDir]
	show_debug_message(string(playerIndex) + ": " + string(lastDirection))
}

function UseAbility(input) {
	if keyboard_check_pressed(input) {
		if playerIndex == 0
			UseGrapplingHook(id)
		else if playerIndex == 1
			UseBoxingGlove(id)
	}
}

function UseGrapplingHook(player) {
	if !instance_exists(Obj_GrappleHook)
		with instance_create_layer(x, y, "Instances", Obj_GrappleHook) {
			creator = player
			x = creator.x;
			y = creator.y;
			directions = player.lastDirection
			direction = point_direction(0, 0, directions[0], directions[1])
			show_debug_message(string(directions) + " " + string(direction))
		}
	canMove = false
}

function UseBoxingGlove(player) {
	
}

function CheckIfTogether() {
	if playerIndex == 0 {
		distanceBetween = point_distance(x, y, Obj_Player2.x, Obj_Player2.y)
		//show_debug_message(distanceBetween)
		if distanceBetween < 33
			global.together = true;
	}
}