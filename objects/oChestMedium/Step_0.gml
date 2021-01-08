if (!instance_exists(oPlayer)) exit;

var player_range = point_distance(x,y,oPlayer.x,oPlayer.y);

if (open == false)
{
	if (player_range < sprite_width * 1.2)
	{
		image_index = 2;
		if (oPlayer.key_interact)
		{
			open = true;
		}
	}
	else image_index = 0;
}

if (open == true)
{
	image_index = 1;
}