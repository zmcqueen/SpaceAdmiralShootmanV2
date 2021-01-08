if (!instance_exists(oPlayer)) exit;

var player_range = point_distance(x,y,oPlayer.x,oPlayer.y);

if (open == false)
{
	global.chest_count = 1;
	if (player_range < sprite_width * 1.2)
	{
		image_index = 2;
		if (oPlayer.key_interact)
		{
			open = true;
			instance_create_layer(x,y-10,"Projectiles",oGunPickup);
		}
	}
	else image_index = 0;
}

if (open == true)
{
	global.chest_count = 0;
	image_index = 1;
}

vsp = vsp + grv;
if (place_meeting(x,y+vsp,pCollide))
{
	vsp = 0;
}
y += vsp;