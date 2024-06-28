// this is a fucking mess I am so sorry I was trying to figure out why it wasn't working
function PushOrPullBlock(tileset, xPos, yPos, xAdd, yAdd, blockA, blockB){
	var pos = GetTileIndex(tileset, xPos+xAdd, yPos+yAdd)
	var posWater = GetTileIndex("Tiles_Water", xPos+xAdd, yPos+yAdd)
	var p0x = instance_find(Obj_Player, 0).x
	var p0y = instance_find(Obj_Player, 0).y
	var p1x = instance_find(Obj_Player, 1).x
	var p1y = instance_find(Obj_Player, 1).y
	var checkPlayer0 = !(p0x == xPos+xAdd && p0y == yPos+yAdd)
	var checkPlayer1 = !(p1x == xPos+xAdd && p1y == yPos+yAdd)
	var checkPlayerPositions = (checkPlayer0 && checkPlayer1)
	var finalBool = (pos == 0 && checkPlayerPositions)//((pos == 0 || pos == 12) && checkPlayerPositions)
	
	show_debug_message("Player0 XY: " + string(p0x) + ", " + string(p0y))
	show_debug_message("Player1 XY: " + string(p1x) + ", " + string(p1y))
	show_debug_message("Old Pos XY: " + string(xPos) + ", " + string(yPos))
	show_debug_message("New Pos XY: " + string(xPos+xAdd) + ", " + string(yPos+yAdd))
	show_debug_message(string((pos == 0 || pos == 12 || posWater >= 3)) + " + " + string(checkPlayer0) + " " + string(checkPlayer1) + " = " + string(finalBool))
	show_debug_message("")
		
	if (finalBool)  {
		SetTileIndex(tileset, xPos, yPos, blockA)
		SetTileIndex(tileset, xPos+xAdd, yPos+yAdd, blockB)
		return true
	} else
		return false
}

function CheckIfSubmerge(xPos, yPos){
	var waterInWay = GetTileIndex("Tiles_Water",  xPos,  yPos)
	if (waterInWay == 1 || waterInWay == 2){
		SetTileIndex("Tiles",  xPos,  yPos, 0)
		SetTileIndex("Tiles_Water", xPos, yPos, 0)
		SetTileIndex("Tiles_BoxInWater", xPos, yPos, 48)
	}
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

function ToggleDummyPillars(isBlue){
	with Obj_TileStuff {
		dummyColor = isBlue
		var down = 12+(7*isBlue)
		var up = down+1
		show_debug_message(down)
		show_debug_message(up)
		
		//var lay_id = layer_get_id("Tiles");
		//var map_id = layer_tilemap_get_id(lay_id);
		var p0x = instance_find(Obj_Player, 0).x; var p0y = instance_find(Obj_Player, 0).y
		var p1x = instance_find(Obj_Player, 1).x; var p1y = instance_find(Obj_Player, 1).y
		var temp = array_create(array_length(dummyPillars))
		
		for(var i = 0; i < array_length(dummyPillars); i++) {
			
			var checkPlayer0 = !(p0x == dummyPillars[i][1] && p0y == dummyPillars[i][2])
			var checkPlayer1 = !(p1x == dummyPillars[i][1] && p1y == dummyPillars[i][2])
			var checkPlayerPositions = (checkPlayer0 && checkPlayer1)
			
			//show_debug_message("Player0 XY: " + string(p0x) + ", " + string(p0y))
			//show_debug_message("Player1 XY: " + string(p1x) + ", " + string(p1y))
			//show_debug_message("Old Pos XY: " + string(dummyPillars[i][1]) + ", " + string(dummyPillars[i][2]))
			//show_debug_message(string(checkPlayer0) + ", " + string(checkPlayer1))
			
			if !checkPlayerPositions
				return
			//var mx = tilemap_get_cell_x_at_pixel(map_id, dummyPillars[i][1], dummyPillars[i][2]);
			//var my = tilemap_get_cell_y_at_pixel(map_id, dummyPillars[i][1], dummyPillars[i][2]);
			var data = GetTileIndex("Tiles", dummyPillars[i][1], dummyPillars[i][2]);
			show_debug_message("data = " + string(data))
			
			if dummyPillars[i][3] == isBlue {
				if data == down {
					temp[i] = up
					show_debug_message(up)
				}
				else if data == up {
					temp[i] = down
					show_debug_message(down)
				} 
			} else {
				temp[i] = dummyPillars[i][0]
				show_debug_message("didn't do")
			}
		}
		show_debug_message(temp)
		for(var i = 0; i < array_length(dummyPillars); i++) {
			dummyPillars[i][0] = temp[i]
			SetTileIndex("Tiles", dummyPillars[i][1], dummyPillars[i][2], dummyPillars[i][0])
		}
	}
}