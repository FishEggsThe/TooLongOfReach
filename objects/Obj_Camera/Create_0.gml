if instance_number(Obj_Camera) > 1 {
	instance_destroy()
}

x = 0
y = 0

view_width = room_width
view_height = room_height
view_scale = 3

window_set_size(view_width*view_scale, view_height*view_scale)
alarm[0] = 1