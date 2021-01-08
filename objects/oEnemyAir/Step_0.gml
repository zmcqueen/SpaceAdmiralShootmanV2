if (!instance_exists(oPlayer)) exit;

#region //Animation
if (hsp != 0)
{
	image_xscale = sign(hsp);
}
if (hsp == 0) image_xscale = 1;
#endregion

switch (state)
{
	case "PATROL":
		#region
		target = noone;
		var distance_to_player = point_distance(x,y,oPlayer.x,oPlayer.y);
		var no_line_of_sight = collision_line(x,y,oPlayer.x,oPlayer.y,pCollide,false,false);
		var half_move = movespd*0.5;
		enemy_move_and_collide(hsp,vsp);
		if (y < room_height * 0.7)
		{
			hsp = create_direction*half_move;
			vsp = half_move;
		}
		else
		{
			hsp = create_direction*half_move;
			vsp = 0;
		}
		if ((distance_to_player < aggro_range) or (hp < max_hp)) and (!no_line_of_sight)
		{
			state = "ATTACK";
		}
		aggro_timer -= 1;
		if (aggro_timer == 0) state = "ATTACK";
		#endregion
		break;
	
	case "ATTACK":
		#region //Movement and Collision
		target = oPlayer;
		var no_line_of_sight = collision_line(x,y,target.x,target.y,pCollide,false,false);
		
		//Chase Player
		image_xscale = sign(target.x - x);
		if (image_xscale == 0) image_xscale = 1;
		var direction_facing = image_xscale;
		var player_distance = point_distance(x,y,target.x,target.y);
		var player_direction = point_direction(x,y,target.x,target.y);
		enemy_move_and_collide(hsp,vsp);
		
		if (player_distance > swoop_range)
		{
			hsp = direction_facing*movespd;
			vsp = movespd;
		}
		
		if (player_distance < escape_range)
		{
			state = "ESCAPE";
		}
		#endregion
		
		#region //Fire Weapon
		if (oPlayer.hp == 0) exit;
		fire_rate -= 1;
		if (!no_line_of_sight)
			{
			var distance_to_player = point_distance(x,y,target.x,target.y);
			if (distance_to_player < aggro_range) and (fire_rate < 0)
			{
				var aim = point_direction(x,y,target.x,target.y);
				fire_rate = 90;
				with (instance_create_layer(x,y,"Projectiles",oPurpleBullet))
				{
					speed = 4;
					direction = aim + random_range(-5,5);
					image_angle = direction;
				}
			}
		}
		
		#endregion
		break;
	
	case "ESCAPE":
		#region
		target = oPlayer;
		var direction_facing = image_xscale;
		var player_distance = point_distance(x,y,target.x,target.y);
		hsp = direction_facing * swoopspd;
		vsp = -swoopspd;
		enemy_move_and_collide(hsp,vsp);
		if (player_distance > aggro_range)
		{
			state = "ATTACK";
		}
		#endregion
		break;
	
	case "STUN":
		target = noone;
		hsp = 0;
		vsp = 0;
		stun_duration -= 1;
		if (stun_duration == 0) state = "ATTACK";
		break;
	
	case "DIE":
		instance_destroy();
		with (instance_create_layer(x,y,"Enemy",oExplosion))
		{
			image_speed = 1;
			audio_play_sound(sfxExplosionOne,2,false);
		}
		break;
	
}