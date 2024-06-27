if instance_exists(Obj_BoxingGlove) {
	draw_sprite_ext(Spr_BoxingSpring, 0, x+16, y+16, point_distance(x+16, y+16, Obj_BoxingGlove.x, Obj_BoxingGlove.y)/64, 
					1, point_direction(x, y, x+lastDirection[0], y+lastDirection[1]), c_white, 1)
	//show_debug_message(string())
	//draw_sprite_ext(chives, 0, x+16, y+16, image_xscale, image_yscale, 
	//				point_direction(x, y, lastDirection[0], lastDirection[1]), c_white, 1)
}

event_inherited()