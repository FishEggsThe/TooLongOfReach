/// @DnDAction : YoYo Games.Particles.Part_Syst_Create
/// @DnDVersion : 1.2
/// @DnDHash : 7900A79D
system = part_system_create_layer("Instances", 0);

/// @DnDAction : YoYo Games.Particles.Part_Type_Create
/// @DnDVersion : 1.1
/// @DnDHash : 61F5B431
type = part_type_create();
// no blending

/// @DnDAction : YoYo Games.Particles.Part_Type_Sprite
/// @DnDVersion : 1
/// @DnDHash : 48680105
/// @DnDArgument : "sprite" "aa"
/// @DnDSaveInfo : "sprite" "aa"
part_type_sprite(type, aa, true, false, false);

/// @DnDAction : YoYo Games.Particles.Part_Type_Life
/// @DnDVersion : 1
/// @DnDHash : 151CB3AE
/// @DnDArgument : "minlife" "40"
/// @DnDArgument : "maxlife" "40"
part_type_life(type, 40, 40);

/// @DnDAction : YoYo Games.Particles.Part_Type_Direction
/// @DnDVersion : 1
/// @DnDHash : 73C59420
/// @DnDArgument : "mindir" "50"
/// @DnDArgument : "maxdir" "130"
part_type_direction(type, 50, 130, 0, 0);

/// @DnDAction : YoYo Games.Particles.Part_Type_Gravity
/// @DnDVersion : 1
/// @DnDHash : 72C16888
/// @DnDArgument : "amount" "0.05"
/// @DnDArgument : "direction" "-90"
part_type_gravity(type, 0.05, -90);

/// @DnDAction : YoYo Games.Particles.Part_Type_Speed
/// @DnDVersion : 1
/// @DnDHash : 04415B58
part_type_speed(type, 1, 2, 0, 0);