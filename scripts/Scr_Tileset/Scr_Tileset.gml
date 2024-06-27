// this is a fucking mess I am so sorry I was trying to figure out why it wasn't working
function PushOrPullBlock(tileset, xPos, yPos, xAdd, yAdd, blockA, blockB){
	var pos = GetTileIndex(tileset, xPos+xAdd, yPos+yAdd)
	var p0x = instance_id_get(0).x
	var p0y = instance_id_get(0).y
	var p1x = instance_id_get(1).x
	var p1y = instance_id_get(1).y
	var checkPlayer0 = !(p0x == xPos+xAdd && p0y == yPos+yAdd)
	var checkPlayer1 = !(p1x == xPos+xAdd && p1y == yPos+yAdd)
	var checkPlayerPositions = (checkPlayer0 && checkPlayer1)
	var finalBool = (pos == 0 && checkPlayerPositions)//((pos == 0 || pos == 12) && checkPlayerPositions)
	
	show_debug_message("Player0 XY: " + string(p0x) + ", " + string(p0y))
	//show_debug_message("Player1 XY: " + string(p1x) + ", " + string(p1y))
	//show_debug_message("Old Pos XY: " + string(xPos) + ", " + string(yPos))
	show_debug_message("New Pos XY: " + string(xPos+xAdd) + ", " + string(yPos+yAdd))
	show_debug_message(string((pos == 0 || pos == 12)) + " + " + string(checkPlayer0) + " " + string(checkPlayer1) + " = " + string(finalBool))
	if (finalBool)  {
		
		show_debug_message("")

		SetTileIndex(tileset, xPos, yPos, blockA)
		SetTileIndex(tileset, xPos+xAdd, yPos+yAdd, blockB)
		return true
	} else
		return false
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

function ToggleDummyPillars(){
	with Obj_TileStuff {
		var lay_id = layer_get_id("Tiles");
		var map_id = layer_tilemap_get_id(lay_id);
		var p0x = instance_id_get(0).x; var p0y = instance_id_get(0).y
		var p1x = instance_id_get(1).x; var p1y = instance_id_get(1).y
		var temp = array_create(array_length(dummyPillars))
		
		for(var i = 0; i < array_length(dummyPillars); i++) {
			var checkPlayer0 = !(p0x == dummyPillars[i][1] && p0y == dummyPillars[i][2])
			var checkPlayer1 = !(p1x == dummyPillars[i][1] && p1y == dummyPillars[i][2])
			var checkPlayerPositions = (checkPlayer0 && checkPlayer1)
			if !checkPlayerPositions
				return
			var mx = tilemap_get_cell_x_at_pixel(map_id, dummyPillars[i][1], dummyPillars[i][2]);
			var my = tilemap_get_cell_y_at_pixel(map_id, dummyPillars[i][1], dummyPillars[i][2]);
			var data = tilemap_get(map_id, mx, my);
			if data == 12
				temp[i] = 13
			else if data == 13
				temp[i] = 12
		}
		for(var i = 0; i < array_length(dummyPillars); i++) {
			dummyPillars[i][0] = temp[i]
			SetTileIndex("Tiles", dummyPillars[i][1], dummyPillars[i][2], dummyPillars[i][0])
		}
	}
}