if (oPlayer.helmet == false) and (oPlayer.key_interact)
{
	oPlayer.helmet = true;
	instance_create_layer(oPlayer.x,oPlayer.y,"Helmet",helmet);
	instance_destroy();
}