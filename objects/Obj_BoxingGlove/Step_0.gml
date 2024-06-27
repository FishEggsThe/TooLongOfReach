var oX = creator.x + 16
var oY = creator.y + 16

if extend {
	if !punched {
		for(var i = 32; i <= maxDistance; i += 32) {
			x = oX+i*directions[0]
			y = oY+i*directions[1]
			var pos = GetTileIndex("Tiles", x, y)
			if pos == 1 {
				//while (false){
				//	PushOrPullBlock("Tiles", x, y, directions[0]*32, directions[1]*32, 0, 1)
				//}
				punched = true
				break;
			}
			else if (pos == 14 || pos == 7) {
				if pos == 14 {
					SetTileIndex("Tiles", x, y, 3)
					Obj_TileStuff.alarm[0] = 6
					Obj_TileStuff.gloveX = x
					Obj_TileStuff.gloveY = y
				} else if pos == 7 {
					SetTileIndex("Tiles", x, y, 8)
				}
				ToggleDummyPillars()
				punched = true
				break;
			}
		}
	}
} else {
	x = oX + directions[0]*maxDistance/8
	y = oY + directions[1]*maxDistance/8
}