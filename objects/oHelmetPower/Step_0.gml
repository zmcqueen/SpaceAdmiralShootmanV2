if (oPlayer.hp <= 0) instance_destroy();
if (hp <= 0)
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
y = oPlayer.y - 3;

image_xscale = oPlayer.image_xscale;

if (oPlayer.hsp != 0)
{
	image_index = 1;
}
else image_index = 0;