var enemy_count = instance_number(pShootable);

if (instance_exists(oPlayer)) and (enemy_count < oPlayer.kills/5)
{
	if (enemy_count > 5) or (instance_exists(oBossGround))
	{
		exit;
	}
	var enemy = choose(oEnemyAir,oEnemyExplosive,oEnemyGround);
	var boss = choose(oBossGround);
	var new_x = random_range(buff,room_width-buff);
	var new_y = random_range(buff,room_height-buff);
	while (point_distance(new_x,new_y,oPlayer.x,oPlayer.y) < too_close)
	{
		new_x = random_range(buff,room_width-buff);
		new_y = random_range(buff,room_height-buff);
	}
	instance_create_layer(new_x,new_y,"Enemy",enemy);
	
	if (oPlayer.kills mod 15 == 0)
	{
		var room_x_mid = room_width * 0.5;
		var room_y_mid = room_height * 0.5;
		instance_create_layer(room_x_mid,room_y_mid,"Boss",boss);
		audio_play_sound(sfxMiscOne,4,false);
	}
}