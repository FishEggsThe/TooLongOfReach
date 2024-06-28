system = part_system_create_layer("Instances", 0);

type = part_type_create();
// no blending

part_type_sprite(type, a, true, false, false);

part_type_life(type, 40, 40);

part_type_direction(type, 50, 130, 0, 0);

part_type_gravity(type, 0.05, -90);

part_type_speed(type, 1, 2, 0, 0);