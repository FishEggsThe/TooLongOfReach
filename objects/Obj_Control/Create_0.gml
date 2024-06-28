if instance_number(Obj_Control) > 1 {
	instance_destroy()
} else {
	global.debug = false
	global.together = false
	global.cheeseburger = false
	
	spin = 0
	spinMax = 120
	
	sulk = 0
	sulkMax = 120
	textIndex = irandom(5)
}