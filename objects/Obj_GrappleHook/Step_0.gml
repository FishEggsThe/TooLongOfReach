x += directions[1]*projSpeed
y += directions[0]*projSpeed
maxDistance -= (x-xprevious) + (y-yprevious)

if (GetTileIndex("Tiles", x, y) == 2 || maxDistance < 0) {
	instance_destroy()
}