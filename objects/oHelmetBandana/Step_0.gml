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
y = oPlayer.y - 2;

image_xscale = oPlayer.image_xscale;

if (oPlayer.hsp != 0)
{
	image_index = 1;
}
else image_index = 0;


//Teleport
var teleport = oPlayer.image_xscale * port_distance;
var buff = oPlayer.image_xscale * 5;
var top = oPlayer.y - (sprite_height * 0.5);
var bottom = oPlayer.y + (sprite_height * 0.5) - 1;
var collision_top = collision_line(oPlayer.x,top,oPlayer.x+teleport+buff,top,pCollide,false,false);
var collision_bottom = collision_line(oPlayer.x,bottom,oPlayer.x+teleport+buff,bottom,pCollide,false,false);

if (collision_top) or (collision_bottom)
{
	port = false;
}
else port = true;

if (port == true) and (oPlayer.key_ability)
{
	instance_create_layer(oPlayer.x,oPlayer.y,"Projectiles",oSmoke);
	oPlayer.x += teleport;
	oPlayer.y -= 1;
	uses -= 1;
}