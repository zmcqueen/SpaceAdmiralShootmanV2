if (!instance_exists(oPlayer)) exit;
image_yscale = size;

#region //Movement and Collision
vsp = vsp + grv;

if (place_meeting(x+hsp,y,pCollide))
{
	while (!place_meeting(x+sign(hsp),y,pCollide))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x,y+vsp,pCollide))
{
	while (!place_meeting(x,y+sign(vsp),pCollide))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
#endregion

if (oPlayer.hp == 0) exit;

switch (state)
{
	case "MOVE":
		#region
		image_speed = 1;
		image_xscale = (sign(oPlayer.x - x) * size);
		fire_rate = 0;
		spawn_rate = 0;
		if (image_xscale == 0) image_xscale = 1 * size;
		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x,y,oPlayer.x,oPlayer.y);
		if (distance_to_player > aggro_range)
		{
			hsp = direction_facing * movespd;
		}
		else
		{
			image_speed = 0;
			hsp = 0;
		}
		
		randomize();
		var state_attack = choose("SHOOT","SPAWN");
		if (instance_number(pShootable) >= 4)
		{
			state_attack = "SHOOT";
		}
		state_attack_timer -= 1;
		if (state_attack_timer < 0)
		{
			state = state_attack;
			state_attack_timer = 90;
		}
		
		break;
		#endregion
		
	case "SHOOT":
		#region
		var aim = point_direction(x,y,oPlayer.x,oPlayer.y - 8);
		fire_rate += 1;
		if (fire_rate mod 10 == 0)
		{
			with (instance_create_layer(x,y,"Projectiles",oPurpleOrb))
			{
				image_xscale = 1;
				image_yscale = 1;
				speed = 4;
				direction = aim + random_range(-0.5,0.5);
				image_angle = direction;
			}
		}
		if (fire_rate == 35) state = "MOVE";
		
		break;
		#endregion
		
	case "SPAWN":
		#region
		var enemy = choose(oEnemyAir,oEnemyExplosive);
		var spawn_buff = sprite_height * 0.25;
		if (enemy == oEnemyAir)
		{
			repeat (2)
			{
				with (instance_create_layer(x+random_range(-spawn_buff,spawn_buff),y-spawn_buff,"Enemy",enemy))
				{
					state = "ATTACK";
				}
			}
		}
		if (enemy == oEnemyExplosive)
		{
			with (instance_create_layer(x,y,"Projectiles",enemy))
				{
					state = "ATTACK";
				}
		}
		state = "MOVE";
		break;
		#endregion
		
	case "STUN":
		target = noone;
		hsp = 0;
		vsp = vsp + grv;
		image_speed = 0;
		stun_duration -= 1;
		if (stun_duration == 0) state = "MOVE";
		break;
	
	case "DIE":
		#region
		instance_destroy();
		with (instance_create_layer(x,y,"Projectiles",oExplosion))
		{
			image_xscale = other.size - 1;
			image_yscale = other.size - 1;
			image_speed = 1;
			audio_play_sound(sfxExplosionOne,2,false);
		}
		oPlayer.hp = oPlayer.max_hp;
		
		break;
		#endregion
}