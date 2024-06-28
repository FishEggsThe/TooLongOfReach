function ShowWinText(){
	if global.together {
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		spin = clamp(spin+2, 0, spinMax)
		var xScale = spin/spinMax
		var yScale = spin/spinMax
		draw_sprite_ext(Spr_WinText, textIndex, room_width/2, room_height/2, xScale, yScale, sin(spin)*180/pi, c_white, 1)
	}
}

function ShowLoseText(){
	var playerNum = instance_number(Obj_Player)
	if playerNum == 0
		return
	
	for(var i = 0; i < playerNum; i++) {
		var player = instance_find(Obj_Player, i)
		if player.alive
			return
	}
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	sulk = clamp(sulk+2, 0, sulkMax)
	var yPos = sulk
	draw_sprite(Spr_LoseText, textIndex, room_width/2, yPos)
}