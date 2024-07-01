if fadeIn < 4
	fadeIn += 1/60

if (fadeIn >= 4 && keyboard_check_pressed(vk_space))
	room_goto(0)