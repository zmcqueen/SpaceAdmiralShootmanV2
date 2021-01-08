if (hp <= 0)
{
	state = "DIE";
	oPlayer.kills += 1;
	
	randomize();
	var drop_range = irandom_range(0,99);
	if (drop_range <= 14)
	{
		instance_create_layer(x,y,"Chest",oHealthPickup);
	}
	if (drop_range == 99)
	{
		var chest = choose(oChestSmall,oChestRare);
		instance_create_layer(x,y,"Chest",chest);
		audio_play_sound(sfxUIOne,3,false);
	}
}