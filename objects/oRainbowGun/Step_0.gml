if (oPlayer.hp == 0) instance_destroy();
if (!instance_exists(oPlayer))
{
	exit;
}

if (oPlayer.has_gun == false) instance_destroy();

//Aim
image_angle = point_direction(x,y,mouse_x,mouse_y);