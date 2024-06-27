if instance_exists(playerAbility) {
	draw_sprite_ext(ropeSprite, 0, x+16, y+16, point_distance(x+16, y+16, playerAbility.x, playerAbility.y)/64, 
					1, point_direction(x, y, x+lastDirection[0], y+lastDirection[1]), c_white, 1)
}

var spriteDirection = point_direction(x, y, x+lastDirection[0], y+lastDirection[1])/90
if (global.together || image_speed > 0) {
	spriteDirection = image_index
	image_speed = 1	
}
draw_sprite_ext(sprite_index, spriteDirection, x, y, 
				image_xscale, image_yscale, 0, c_white, alive)