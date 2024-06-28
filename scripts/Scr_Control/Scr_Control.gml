function ShowWinText(){
	if global.together {
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		spin = clamp(spin+2, 0, spinMax)
		var xScale = 2*spin/spinMax
		var yScale = 2*spin/spinMax
		draw_text_transformed(room_width/2, room_height/2, "Together at last!!", xScale, yScale, sin(spin)*180/pi)
	}
}