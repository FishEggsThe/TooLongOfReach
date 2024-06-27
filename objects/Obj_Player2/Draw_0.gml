event_inherited()

if instance_exists(Obj_BoxingGlove)
	draw_sprite_ext(chives, 0, x+16, y+16, image_xscale, image_yscale, 
					point_direction(x, y, lastDirection[0], lastDirection[1]), c_white, 1)