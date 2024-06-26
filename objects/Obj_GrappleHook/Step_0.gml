x += directions[0]*projSpeed
y += directions[1]*projSpeed
maxDistance -= abs((x-xprevious) + (y-yprevious))

if (GetTileIndex("Tiles", x, y) == 2 || maxDistance < 0) {
	creator.canMove = true
	instance_destroy()
}