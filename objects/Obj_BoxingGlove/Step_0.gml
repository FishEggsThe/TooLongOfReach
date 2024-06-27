var oX = creator.x + 16
var oY = creator.y + 16

if extend {
	x = oX + directions[0]*maxDistance
	y = oY + directions[1]*maxDistance
	if !punched {
		var pos = GetTileIndex("Tiles", x, y)
		if pos == 1 {
			
			punched = true
		}
		else if pos == 14 {
			SetTileIndex("Tiles", x, y, 3)
			Obj_TileStuff.alarm[0] = 6
			Obj_TileStuff.gloveX = x
			Obj_TileStuff.gloveY = y
			ToggleDummyPillars()
			punched = true
		}
	}
} else {
	x = oX + directions[0]*maxDistance/4
	y = oY + directions[1]*maxDistance/4
}