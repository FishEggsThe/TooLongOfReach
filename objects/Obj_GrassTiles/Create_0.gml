for(var i = 0; i < room_width; i+=32) {
	for(var j = 0; j < room_height; j+=32) {
		var lay_id = layer_get_id("Tiles_Grass");
		var map_id = layer_tilemap_get_id(lay_id);
		var mx = tilemap_get_cell_x_at_pixel(map_id, i, j);
		var my = tilemap_get_cell_y_at_pixel(map_id,  i, j);
		var data = tilemap_get(map_id, mx, my);
		if data > 0
			data = tile_set_index(data, irandom_range(1, 5));
		tilemap_set(map_id, data, mx, my);
	}
	show_debug_message(i)
}