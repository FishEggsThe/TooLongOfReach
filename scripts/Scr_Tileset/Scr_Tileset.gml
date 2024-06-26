function PushOrPullBlock(tileset, xPos, yPos, xAdd, yAdd, blockA, blockB){
	SetTileIndex(tileset, xPos, yPos, blockA)
	SetTileIndex(tileset, xPos+xAdd, yPos+yAdd, blockB)
	
	//SetTileIndex(tileset, x+32*(1*xDir), y+32*(1*yDir), 0)
	//SetTileIndex(tileset, x+64*(1*xDir), y+64*(1*yDir), 1)
	
	//SetTileIndex(tileset, x, y, 0)
	//SetTileIndex(tileset, x+32*(-directions[0]), y+32*(-directions[1]), 1)	
}

function GetTileIndex(tileset, xPos, yPos){
	var lay_id = layer_get_id(tileset);
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xPos, yPos);
	var py = tilemap_get_cell_y_at_pixel(map_id, xPos, yPos);
	var data = tilemap_get(map_id, px, py);
	//show_debug_message(data)
	
	return data
}
function SetTileIndex(tileset, xPos, yPos, tileI){
	var lay_id = layer_get_id(tileset);
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xPos, yPos);
	var py = tilemap_get_cell_y_at_pixel(map_id, xPos, yPos);
	tilemap_set(map_id, tileI, px, py)
	//var data = tilemap_get(map_id, px, py);
	//show_debug_message(data)
}

function GetTilePosition(tileset, xPos, yPos){
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);
	var tx = tilemap_get_x(map_id), ty = tilemap_get_y(map_id), tw = tilemap_get_tile_width(map_id), th = tilemap_get_tile_height(map_id);
	var xx = (x - tx) div tw * tw + tx;
	var yy = (y - ty) div th * th + ty;
	
	return [xx, yy]
}