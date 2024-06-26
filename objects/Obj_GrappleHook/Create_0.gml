function GrappleHook(_x, _y, _creator) constructor
{
    x = _x;
    y = _y;
	maxDistance = 32*3
	projSpeed = 6
	creator = _creator
	

    static DrawRope = function()
    {
		draw_set_color(c_black)
        draw_line_width(x, y, creator.x, creator.y, 4)
    }
}

grappleHook = noone