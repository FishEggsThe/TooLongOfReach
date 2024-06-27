system = part_system_create_layer("Instances", 0);

type = part_type_create();
// no blending

part_type_life(type, 40, 40);

part_type_direction(type, 80, 100, 0, 0);

part_type_speed(type, 2, 3, 0, 0);

part_type_sprite(type, a, true, false, false);

alarm_set(0, 5);

alarm[1] = 60*3