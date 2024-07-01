system = part_system_create_layer("Instances", 0);

type = part_type_create();

part_type_sprite(type, spr_dustParticle, true, false, false);

part_type_life(type, 24, 24);

part_type_direction(type, 50, 130, 0, 0);

part_type_gravity(type, 0.05, -90);

part_type_speed(type, 1, 2, 0, 0);

part_particles_create(system, x, y, type, 1);

alarm[0] = 60