event_inherited()
var levelNum = string(numberToDraw)
var length = string_length(levelNum)
var spacing = 11
for(var i = 0; i < length; i++) {
	var num = string_copy(levelNum, i, 1)
	var finalNum = ord(num)-48 //48-57
	var numPos = spacing*(i-(length-1)/2)
	draw_sprite(textSprite, finalNum, x+numPos, y)
}