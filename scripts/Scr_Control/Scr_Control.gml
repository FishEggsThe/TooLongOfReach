function ShowWinText(){
	if global.together {
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		spin = clamp(spin+2, 0, spinMax)
		var xScale = spin/spinMax
		var yScale = spin/spinMax
		draw_sprite_ext(Spr_TextWin, textIndex, room_width/2, room_height/2, xScale, yScale, sin(spin)*180/pi, c_white, 1)
	}
}

function ShowLoseText(){
	var playerNum = instance_number(Obj_Player)
	if playerNum == 0
		return
	
	var player0alive = instance_find(Obj_Player, 0).alive
	var player1alive = instance_find(Obj_Player, 1).alive

	if (player0alive && player1alive)
		return
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	sulk = clamp(sulk+2, 0, sulkMax)
	var yPos = sulk
	draw_sprite(Spr_TextLose, textIndex, room_width/2, yPos)
}

function GameChangeRoomCheck() {
	if (keyboard_check_pressed(vk_space) && global.together)
		room_goto_next()
	if keyboard_check_pressed(ord("R"))
		room_goto(room)
	if keyboard_check_pressed(ord("T"))
		room_goto(1)
}