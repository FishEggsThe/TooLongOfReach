// Grass Randomization
var lay_id = layer_get_id("Tiles_Grass");
var map_id = layer_tilemap_get_id(lay_id);
var w = sprite_get_width(Spr_GrassTiles)/tilemap_get_tile_width(map_id);
var h = sprite_get_height(Spr_GrassTiles)/tilemap_get_tile_height(map_id);
var numOfGrassTiles = w*h
for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var grassPos = GetTileIndex("Tiles_Grass", i, j)
		var waterPos = GetTileIndex("Tiles_Water", i, j)
		if grassPos > 0
			SetTileIndex("Tiles_Grass", i, j, irandom_range(1,numOfGrassTiles))
		else if grassPos <= 0
			SetTileIndex("Tiles_Water", i, j, 1)
	}
	//show_debug_message(i)
}

// Dummy Pillars initialization
var pillarsI = 0
for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var data = GetTileIndex("Tiles", i, j)
		if ((data == 12 || data == 13) || (data == 19 || data == 20))
			pillarsI++
			
	}
}
show_debug_message(pillarsI)
dummyPillars = array_create(pillarsI)
for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var data = GetTileIndex("Tiles", i, j)
		if (data == 12 || data == 13) {
			pillarsI--
			dummyPillars[pillarsI] = [data, i, j, 0]
		} else if (data == 19 || data == 20) {
			pillarsI--
			dummyPillars[pillarsI] = [data, i, j, 1]
		}
	}
}
show_debug_message(dummyPillars)
gloveX = 0
gloveY = 0
dummyColor = 0