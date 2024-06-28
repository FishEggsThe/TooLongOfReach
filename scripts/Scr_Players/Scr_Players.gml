function MovePlayer(left, right, down, up){
	if (canMove && keyboard_check_pressed(vk_anykey)) {
		var xDirection = keyboard_check_pressed(right)-keyboard_check_pressed(left)
		var yDirection = keyboard_check_pressed(down)-keyboard_check_pressed(up)
		
		TileCollision(xDirection, yDirection)
		
		CheckIfTogether()
	}
}

function TileCollision(xDir, yDir){
	SetLastDirection(xDir, yDir)
	var addX = 32*xDir
	var addY = 32*yDir
	var newX = x+addX
	var newY = y+addY
	var tileInWay = GetTileIndex("Tiles", newX, newY)
	if (tileInWay != 9 && tileInWay != 13 && tileInWay != 20 && tileInWay != (11-playerIndex)) { // waterInWay == 0 && 
		if tileInWay == 1 {
			PushOrPullBlock("Tiles", x+32*xDir, y+32*yDir, 
							32*xDir, 32*yDir, 0, 1)
			CheckIfSubmerge( x+64*xDir,  y+64*yDir)
								
		} else {
			if xDir != 0 {
				x = newX
			} else if yDir != 0 {
				y = newY
			}
			var waterInWay = GetTileIndex("Tiles_Water", x, y)
			var checkForBox = GetTileIndex("Tiles_Cliffs", x, y)
			if waterInWay > 0 {
				canMove = false
				//alive = false
				sprite_index = Spr_WaterSplash
				image_speed = 1
			}
		}
	}
	x = clamp(x, 0, room_width-1)
	y = clamp(y, 0, room_height-1)
}

function SetLastDirection(xDir, yDir){
	if (xDir == 0 && yDir ==0)
		return
	else if xDir != 0
		lastDirection = [xDir, 0]
	else
		lastDirection = [0, yDir]
	//show_debug_message(string(playerIndex) + ": " + string(lastDirection))
}

function UseAbility(input, player) {
	var ability = (playerIndex == 0 ? Obj_GrappleHook : Obj_BoxingGlove)
	
	if !instance_exists(ability)
		with instance_create_layer(x, y, "Instances", ability) {
			creator = player
			x = creator.x+16;
			y = creator.y+16;
			depth = creator.depth-1
			directions = player.lastDirection
			direction = point_direction(0, 0, directions[0], directions[1])
			//show_debug_message(string(directions) + " " + string(direction))
		}
	canMove = false
}

function CheckIfTogether() {
	with instance_find(Obj_Player, 0) {
		var distanceBetween = point_distance(x, y, Obj_Player2.x, Obj_Player2.y)
		//show_debug_message(distanceBetween)
		if (sprite_index != Spr_WaterSplash && 
			Obj_Player2.sprite_index != Spr_WaterSplash && 
			distanceBetween < 33)
			global.together = true;
	}
}