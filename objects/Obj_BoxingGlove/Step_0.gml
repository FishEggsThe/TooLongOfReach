var oX = creator.x + 16
var oY = creator.y + 16

if extend {
	if !punched {
		for(var i = 32; i <= maxDistance; i += 32) {
			x = oX+i*directions[0]
			y = oY+i*directions[1]
			var pos = GetTileIndex("Tiles", x, y)
			var posColumn = GetTileIndex("Tiles_BoxInWater", x, y)
			show_debug_message(string(pos != 0) + string(posColumn != 1) + string(posColumn != 3) + string(pos != (10+creator.playerIndex)))
			if pos == 1 {
				var dist = 0
				var distDirX = 0
				var distDirY = 0
				var going = true
				while (going){
					distDirX = dist*directions[0]
					distDirY = dist*directions[1]

					going = PushOrPullBlock("Tiles", x+distDirX-16, y+distDirY-16,
											directions[0]*32, directions[1]*32, 0, 1)
					dist += 32
					if going {SpawnParticle(x+distDirX,  y+distDirY, Ps_Fire, 30*(dist/32))}
				}
				CheckIfSubmerge(x+distDirX-16, y+distDirY-16)
				punched = true
				break;
			} else if (pos == 14 || pos == 21) {
				var dummyColor = (pos == 14 ? 0 : 1)
				ToggleDummyPillars(dummyColor)
				var dummyIndex = (dummyColor ? 8 : 4)
				SetTileIndex("Tiles", x, y, dummyIndex)
				Obj_TileStuff.alarm[0] = 6
				Obj_TileStuff.gloveX = x
				Obj_TileStuff.gloveY = y
				
				punched = true
				break;
			} else if pos == 9 {
				PushOrPullBlock("Tiles", x-16, y-16, directions[0]*32, directions[1]*32, 0, 9)
				CheckIfSubmerge((x-16)+directions[0]*32, (y-16)+directions[1]*32)
				punched = true
				break;
			} else if ((posColumn == 2 || posColumn == 4)) {
				punched = true
				break;
			} else if (pos != 0 && pos != (10+creator.playerIndex)) {
				punched = true
				break;
			}
		}
		show_debug_message("")
	}
} else {
	x = oX + directions[0]*maxDistance/8
	y = oY + directions[1]*maxDistance/8
}