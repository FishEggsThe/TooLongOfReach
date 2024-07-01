var drawFadeIn = clamp(fadeIn, 0, 1)
draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, c_white, drawFadeIn)

if fadeIn >= 4 {
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_text(room_width/2, 0, "Press Space to return to main menu")
}