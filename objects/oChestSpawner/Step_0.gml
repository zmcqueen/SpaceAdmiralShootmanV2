if (instance_exists(oPlayer)) and (global.chest_count == 0)
{
	spawn_rate -= 1;
	if (spawn_rate < 0)
	{
		var chest = choose(oChestRare,oChestSmall);
		var new_x = random_range(buff,room_width-buff);
		var new_y = random_range(buff,room_height-buff);
		while (point_distance(new_x,new_y,oPlayer.x,oPlayer.y) < too_close)
		{
			new_x = random_range(buff,room_width-buff);
			new_y = random_range(buff,room_height-buff);
		}
		instance_create_layer(new_x,new_y,"Chest",chest);
		audio_play_sound(sfxUIOne,3,false);
		spawn_rate = 3600;
	}
}