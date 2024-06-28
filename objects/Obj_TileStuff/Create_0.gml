var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, #0098DB)

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
pillarsI = 0

for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var data = GetTileIndex("Tiles", i, j)
		if (data == 12 || data == 13)
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
			dummyPillars[pillarsI] = [data, i, j]
		}
	}
}
show_debug_message(dummyPillars)
gloveX = 0
gloveY = 0