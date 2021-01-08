if (oPlayer.has_gun == false) and (oPlayer.key_interact)
{
	oPlayer.has_gun = true;
	instance_create_layer(oPlayer.x,oPlayer.y,"Gun",gun);
	instance_destroy();
}