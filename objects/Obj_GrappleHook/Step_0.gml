x += directions[0]*projSpeed
y += directions[1]*projSpeed
maxDistance -= abs((x-xprevious) + (y-yprevious))

var currBlock = GetTileIndex("Tiles", x, y)
//show_debug_message(string(currBlock != 0) + string(currBlock != 12) + string((currBlock != 0 && currBlock != 12)))
if ((currBlock != 0 && currBlock != 12) || maxDistance < 0) {
	if currBlock == 2 {
		var pos = GetTilePosition("Tiles", x, y)
		creator.x = pos[0]
		creator.y = pos[1]
	} else if currBlock == 1 {
		var pos = GetTilePosition("Tiles", x, y)
		PushOrPullBlock("Tiles", pos[0], pos[1], 32*(-directions[0]), 32*(-directions[1]), 0, 1)
		CheckIfSubmerge(pos[0]+32*(-directions[0]), pos[1]+32*(-directions[1]))
		//SetTileIndex("Tiles", x, y, 0)
		//SetTileIndex("Tiles", x+32*(-directions[0]), y+32*(-directions[1]), 1)
	}
	creator.canMove = true
	instance_destroy()
}