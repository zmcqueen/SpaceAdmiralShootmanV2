#region //Game Over
if (room == room_gameover)
{
	var text = "You had " + string(global.kills) + " kills.";
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 100;
	var start_y = 128;
	draw_text_transformed(start_x,start_y,text,0.9,0.9,0);
	var restart = "Press 'R' to Restart";
	var restart_w = string_width(restart);
	var restart_h = string_height(restart);
	var restart_x = 142;
	var restart_y = 156;
	draw_text_transformed(restart_x,restart_y,restart,0.5,0.5,0);
	var exit_text = "Press 'Esc' to Return to Menu";
	var exit_w = string_width(exit_text);
	var exit_h = string_height(exit_text);
	var exit_x = 126;
	var exit_y = 170;
	draw_text_transformed(exit_x,exit_y,exit_text,0.4,0.4,0);
}
#endregion

if (!instance_exists(oPlayer)) exit;

#region //Draw Player Life to Screen
var i = 1;
while (i <= oPlayer.hp)
{
	draw_sprite_ext(sPlayerLife,0,x+(i*18),y+16,1,1,0,c_white,1);
	i += 1;
}
var j = 1;
while (j <= oPlayer.max_hp)
{
	draw_sprite_ext(sPlayerLife,1,x+(j*18),y+16,1,1,0,c_white,1);
	j += 1;
}
#endregion

#region //Draw Kills to Screen
if (!instance_exists(oPlayer)) exit;
var text = "KILLS: " + string(oPlayer.kills);
var text_width = string_width(text);
var text_height = string_height(text);
var start_x = 10;
var start_y = 28;
draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
#endregion

#region //Draw Ammo to Screen
if (instance_exists(oMachineGun))
{
	var text = "AMMO: 0";
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oLaserGun))
{
	var text = "AMMO: " + string(oLaserGun.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oShotgun))
{
	var text = "AMMO: " + string(oShotgun.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oCarbine))
{
	var text = "AMMO: " + string(oCarbine.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oArcThrower))
{
	var text = "AMMO: " + string(oArcThrower.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oSniper))
{
	var text = "AMMO: " + string(oSniper.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
if (instance_exists(oCannon))
{
	var text = "AMMO: " + string(oCannon.ammo);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 90;
	var start_y = 28;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
#endregion

#region //Draw Helmet to Screen
if (instance_exists(oHelmetPower))
{
	var i = 1;
	while (i <= oHelmetPower.hp)
	{
		draw_sprite_ext(sHelmetPower,2,x+(i*18),y+51,1.2,1.2,0,c_white,1);
		i += 1;
	}
}

if (instance_exists(oHelmetBandana))
{
	var i = 1;
	while (i <= oHelmetBandana.uses)
	{
		draw_sprite_ext(sHelmetBandana,2,x+(i*18),y+48,1.2,1.2,0,c_white,1);
		i += 1;
	}
}

if (instance_exists(oHelmetCap))
{
	var i = 1;
	while (i <= oHelmetCap.uses)
	{
		draw_sprite_ext(sHelmetCap,2,x+(i*18),y+51,1.2,1.2,0,c_white,1);
		i += 1;
	}
}

if (instance_exists(oHelmetMilitary))
{
	draw_sprite_ext(sHelmetMilitary,2,x+19,y+50,1.2,1.2,0,c_white,1);
	var text = string(oHelmetMilitary.duration/60);
	var text_height = string_height(text);
	var text_width = string_width(text);
	var start_x = 30;
	var start_y = 46;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}

if (instance_exists(oHelmetMountie))
{
	draw_sprite_ext(sHelmetMountie,2,x+19,y+53,1.2,1.2,0,c_white,1);
	var text = string(oHelmetMountie.duration/60);
	var text_height = string_height(text);
	var text_width = string_width(text);
	var start_x = 32;
	var start_y = 46;
	draw_text_transformed(start_x,start_y,text,0.5,0.5,0);
}
#endregion