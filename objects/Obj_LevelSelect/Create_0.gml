i = 3
while(room_exists(i)) {
	var spacing = 64
	xPos = 48 + spacing*(i%3)
	yPos = 0 + spacing*floor(i/3)
	with instance_create_layer(xPos, yPos, "Instances", Obj_ButtonLevel) {
		roomID = Obj_LevelSelect.i
	}
	i++
}