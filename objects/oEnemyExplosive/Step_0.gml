if (!instance_exists(oPlayer)) exit;

#region //Movement and Collision
vsp = vsp + grv;

if (place_meeting(x+hsp,y,pCollide))
{
	while (!place_meeting(x+sign(hsp),y,pCollide))
	{
		x += sign(hsp);
	}
	hsp = -hsp;
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

//Fear of Heights
var half_sprite = sprite_width * 0.5;
if (fear_of_heights == true)
{
	if (!place_meeting(x+half_sprite,y+1,pCollide))
	{
		hsp = -hsp;
	}
}
#endregion

#region //Animation
if (hsp != 0)
{
	image_xscale = sign(hsp);
}
#endregion

switch (state)
{
	case "PATROL":
		#region
		target = noone;
		var distance_to_player = point_distance(x,y,oPlayer.x,oPlayer.y);
		var no_line_of_sight = collision_line(x,y,oPlayer.x,oPlayer.y,pCollide,false,false);
		if ((distance_to_player < aggro_range) or (hp < max_hp)) and (!no_line_of_sight)
		{
			state = "ATTACK";
		}
		#endregion
		break;
	
	case "ATTACK":
		target = oPlayer;
		fear_of_heights = false;
		#region //Chase Player
		image_xscale = sign(target.x - x);
		if (image_xscale == 0) image_xscale = 1;
		var direction_facing = image_xscale;
		var player_distance = point_distance(x,y,target.x,target.y);
		var explode_distance = point_distance(x,0,target.x,0);
		var y_explode = point_distance(0,y,0,target.y);
		var no_line_of_sight = collision_line(x,y,target.x,target.y,pCollide,false,false);
		image_speed = 1;
		if (no_line_of_sight)
		{
			state = "PATROL";
		}
		if (player_distance > explode_range) and (y_explode < y_buff)
		{
			hsp = direction_facing * (movespd + 2);
		}
		if (explode_distance <= explode_range) and (y_explode < y_buff * 0.75)
		{
			state = "EXPLODE";
		}
		#endregion
		break;
		
	case "EXPLODE":
		image_speed = 0;
		hsp = 0;
		hp = 0;
		break;
		
	case "STUN":
		target = noone;
		hsp = 0;
		vsp = vsp + grv;
		image_speed = 0;
		stun_duration -= 1;
		if (stun_duration == 0) state = "DIE";
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