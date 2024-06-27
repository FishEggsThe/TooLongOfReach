function MovePlayer(left, right, down, up){
	if (canMove && keyboard_check_pressed(vk_anykey)) {
		var xDirection = keyboard_check_pressed(right)-keyboard_check_pressed(left)
		var yDirection = keyboard_check_pressed(down)-keyboard_check_pressed(up)
		
		TileCollision(xDirection, yDirection)
		
		CheckIfTogether()
	}
}

function TileCollision(xDir, yDir){
	var addX = 32*xDir
	var addY = 32*yDir
	var newX = x+addX
	var newY = y+addY
	var tileInWay = GetTileIndex("Tiles", newX, newY)
		if (tileInWay != 9 && tileInWay != 13 && tileInWay != (11-playerIndex)) {
			if tileInWay == 1 {
				PushOrPullBlock("Tiles", x+32*(1*xDir), y+32*(1*yDir), 
								32*(1*xDir), 32*(1*yDir), 0, 1)
				//SetTileIndex("Tiles", x+32*(1*xDir), y+32*(1*yDir), 0)
				//SetTileIndex("Tiles", x+64*(1*xDir), y+64*(1*yDir), 1)
			} else {
				if xDir != 0 {
					x = newX
					SetLastDirection(xDir, 0)
				} else if yDir != 0 {
					y = newY
					SetLastDirection(0, yDir)
				}
			}
		}
}

function SetLastDirection(xDir, yDir){
	lastDirection = [xDir, yDir]
	//show_debug_message(string(playerIndex) + ": " + string(lastDirection))
}

function UseAbility(input, player) {
	var ability = (playerIndex == 0 ? Obj_GrappleHook : Obj_BoxingGlove)
	
	if !instance_exists(ability)
		with instance_create_layer(x, y, "Instances", ability) {
			creator = player
			x = creator.x+16;
			y = creator.y+16;
			directions = player.lastDirection
			direction = point_direction(0, 0, directions[0], directions[1])
			//show_debug_message(string(directions) + " " + string(direction))
		}
	canMove = false
}

function CheckIfTogether() {
	if playerIndex == 0 {
		distanceBetween = point_distance(x, y, Obj_Player2.x, Obj_Player2.y)
		//show_debug_message(distanceBetween)
		if distanceBetween < 33
			global.together = true;
	}
}