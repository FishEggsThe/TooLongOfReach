event_inherited()
var levelNum = string(roomID-3)
var length = string_length(levelNum)+1
var spacing = 11
for(var i = 1; i < length; i++) {
	var num = string_copy(levelNum, i, 1)
	var finalNum = real(num) //48-57
	var numPos = spacing*(i-(length)/2)
	draw_sprite(textSprite, finalNum, x+numPos, y)
	show_debug_message(finalNum)
}

show_debug_message(string(roomID-3) + " -> " + levelNum + " -> " + string_copy(levelNum, 1, 1) + string_copy(levelNum, 2, 1))