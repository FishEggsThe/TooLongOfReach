// Grass Randomization
for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var grassPos = GetTileIndex("Tiles_Grass", i, j)
		var waterPos = GetTileIndex("Tiles_Water", i, j)
		if grassPos > 0
			SetTileIndex("Tiles_Grass", i, j, irandom_range(1,5))
		else if grassPos <= 0
			SetTileIndex("Tiles_Water", i, j, 1)
	}
	//show_debug_message(i)
}

// Dummy Pillars initialization
lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
pillarsI = 0

for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var mx = tilemap_get_cell_x_at_pixel(map_id, i, j);
		var my = tilemap_get_cell_y_at_pixel(map_id,  i, j);
		var data = tilemap_get(map_id, mx, my);
		if (data == 12 || data == 13)
			pillarsI++
	}
}
show_debug_message(pillarsI)
dummyPillars = array_create(pillarsI)
for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var mx = tilemap_get_cell_x_at_pixel(map_id, i, j);
		var my = tilemap_get_cell_y_at_pixel(map_id,  i, j);
		var data = tilemap_get(map_id, mx, my);
		if (data == 12 || data == 13) {
			pillarsI--
			dummyPillars[pillarsI] = [data, mx*32, my*32]
		}
	}
}
show_debug_message(dummyPillars)
gloveX = 0
gloveY = 0