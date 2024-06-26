function GetTileIndex(tileset, xPos, yPos){
	var lay_id = layer_get_id(tileset);
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xPos, yPos);
	var py = tilemap_get_cell_y_at_pixel(map_id, xPos, yPos);
	var data = tilemap_get(map_id, px, py);
	//show_debug_message(data)
	
	return data
}