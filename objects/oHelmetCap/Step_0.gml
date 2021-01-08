if (oPlayer.hp <= 0) instance_destroy();
if (uses == 0)
{
	oPlayer.helmet = false;
	instance_destroy();	
}
if (!instance_exists(oPlayer))
{
	exit;
}

//Follow Player
x = oPlayer.x;
y = oPlayer.y - 4;

image_xscale = oPlayer.image_xscale;

if (oPlayer.hsp != 0)
{
	image_index = 1;
}
else image_index = 0;

//AOE Stun
if (oPlayer.key_ability)
{
	var list = ds_list_create();
	var hit_by = collision_circle_list(oPlayer.x,oPlayer.y,stun_radius,pShootable,false,true,list,false);
	if (hit_by > 0)
	{
		for (var i = 0; i < hit_by; ++i;)
		{
			with (list[| i])
			{
				state = "STUN";
				stun_duration = other.stun_time;
			}
		}
	}
	instance_create_layer(oPlayer.x,oPlayer.y,"Projectiles",oStun);
	uses -= 1;
	ds_list_destroy(list);
}