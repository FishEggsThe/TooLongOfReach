i = 3
while(room_exists(i)) {
	var spacingX = 64
	var spacingY = 48

	var newI = i-3
	xPos = 64 + spacingX*(newI%4)
	yPos = 48 + spacingY*floor(newI/4)
	with instance_create_layer(xPos, yPos, "Instances", Obj_ButtonLevel) {
		roomID = Obj_LevelSelect.i
	}
	i++
}