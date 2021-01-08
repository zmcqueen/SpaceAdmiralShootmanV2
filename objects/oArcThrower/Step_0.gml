if (oPlayer.hp <= 0) instance_destroy();
if (!instance_exists(oPlayer))
{
	exit;
}

if (ammo == 0)
{
	instance_destroy();
	oPlayer.has_gun = false;
}

//Follow Player
if (oPlayer.image_xscale == 1)
{
	x = oPlayer.x + 2;
	y = oPlayer.y + 1;
}
else
{
	x = oPlayer.x - 2;
	y = oPlayer.y + 1;
}

//Size
image_xscale = 1;
image_yscale = 1;

//Aim
image_angle = point_direction(x,y,mouse_x,mouse_y);

//Fire Gun
fire_rate -= 1;
recoil = max(0,recoil - 1);

if (fire_rate < 0) and (oPlayer.key_shoot)
{
	ammo -= 1;
	fire_rate = 10;
	recoil = 4;
	with (instance_create_layer(x,y,"Projectiles",oBlueLaser))
	{
		speed = 4;
		direction = other.image_angle + random_range(-3,6);
		image_angle = direction;
		audio_sound_pitch(sfxShotSeven,choose(0.6,0.8,1));
		audio_play_sound(sfxShotSeven,1,false);
	}
}

//Gun Recoil Direction
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

//Reverse Sprite
if (image_angle > 90) and (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;	
}