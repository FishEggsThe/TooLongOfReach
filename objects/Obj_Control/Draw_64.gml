if room >= 3 {
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	draw_text_transformed(2, 0, "R to Restart\nT to Level Select", 0.5, 0.5, 0)
}

if global.together {
	draw_set_halign(fa_center)
	draw_set_valign(fa_bottom)
	draw_set_color(c_white)
	draw_text_transformed(room_width/2, room_height, "Press Spacebar to go to the next level", 0.5, 0.5, 0)
}

ShowWinText()
ShowLoseText()