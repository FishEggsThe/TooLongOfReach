if instance_number(Obj_Control) > 1 {
	instance_destroy()
} else {
	global.debug = false
	global.together = false
	
	spin = 0
	spinMax = 120
}