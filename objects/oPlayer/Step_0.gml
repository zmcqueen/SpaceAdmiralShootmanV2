#region//Get Input
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button(mb_left);
key_interact = keyboard_check_pressed(ord("E"));
key_ability = keyboard_check_pressed(vk_shift);
#endregion

switch (state)
{
	case "MOVE":
	
		#region//Calculate Movement and Collision
		var move = key_right - key_left;
		if (instance_exists(oHelmetMountie))
		{
			movespd = 3;
		}
		else movespd = 2;
		hsp = move* movespd;
		vsp = vsp + grv;

		if (grounded == 10) and (key_jump)
		{
			vsp = jump_height;
			grounded = 0;
		}
		
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
		
		#region//Animation
		if (!place_meeting(x,y+1,pCollide))
		{
			sprite_index = sPlayerJump;
			image_speed = 0;
			grounded = 0;
		}
		else
		{
			grounded = 10;
			image_speed = 1;
			if (hsp == 0)
			{
				sprite_index = sPlayerIdle;
			}
			else
			{
				sprite_index = sPlayerWalk;
			}
		}
		if (hsp != 0) image_xscale = sign(hsp);
		#endregion
		
		#region//Machine Gun Default
		if (has_gun == false)
		{
			instance_activate_object(oMachineGun);
		}
		else
		{
			instance_deactivate_object(oMachineGun);
		}
		#endregion
		break;
		
	case "DIE":
		#region
		sprite_index = sPlayerDie;
		image_speed = 1;
		
		if (image_index >= image_number - 1)
		{
			image_index = image_number - 1;
			image_speed = 0;
			if (image_alpha > 0)
			{
				image_alpha -= 0.05;
			}
			else
			{
				global.kills = kills;
				audio_play_sound(sfxDeathOne,5,false);
				instance_destroy();
				room_goto(room_gameover);
			}
		}
		#endregion
		break;
}