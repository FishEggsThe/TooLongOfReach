function SpawnParticle(xPos, yPos, partSys, timer = 1){
	with instance_create_layer(xPos, yPos, "Instances", partSys) {
		alarm[0] = timer
	}
}