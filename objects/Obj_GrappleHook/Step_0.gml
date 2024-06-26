x += directions[0]*projSpeed
y += directions[1]*projSpeed
maxDistance -= abs((x-xprevious) + (y-yprevious))

var currBlock = GetTileIndex("Tiles", x, y)
if (currBlock == 2 || maxDistance < 0) {
	if currBlock == 2 {
		var pos = GetTilePosition("Tiles", x, y)
		creator.x = pos[0]
		creator.y = pos[1]
	}
	creator.canMove = true
	instance_destroy()
}