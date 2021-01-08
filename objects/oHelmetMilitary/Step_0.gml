if (oPlayer.hp <= 0) instance_destroy();
if (duration <= 0)
{
	oPlayer.helmet = false;
	instance_destroy();
}
if (!instance_exists(oPlayer))
{
	exit;
}

//Follow Player
image_xscale = oPlayer.image_xscale;
if (image_xscale == 1)
{
	x = oPlayer.x - 1;
	y = oPlayer.y - 5;
}
else
{
	x = oPlayer.x + 1;
	y = oPlayer.y - 5;
}


if (oPlayer.hsp != 0)
{
	image_index = 1;
}
else image_index = 0;

//Timer
duration -= 1;