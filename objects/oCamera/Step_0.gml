cursor_sprite = sReticle;

if (!instance_exists(oPlayer)) exit;

xTo = follow.x;
yTo = follow.y;
if (follow.object_index == oPlayerDead)
{
	x = xTo;
	y = yTo;
}

x += (xTo - x) / 10;
y += (yTo - y) / 10;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

camera_set_view_pos(cam,x-view_w_half,y-(view_h_half + 6));