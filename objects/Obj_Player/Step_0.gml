if abilityCooldown > 0
	abilityCooldown--

if keyboard_check_pressed(inputKey)
	UseAbility(inputKey, id)
else
	MovePlayer(moveKeys[0], moveKeys[1], moveKeys[2], moveKeys[3])

if sprite_index == Spr_WaterSplash {
	if image_index > image_number-1
		alive = false
}