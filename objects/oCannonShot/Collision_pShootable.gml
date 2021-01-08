with (other)
{
	hp = hp - other.bullet_damage;
	flash = 1;
}
with (instance_create_layer(x,y,"Projectiles",oExplosion))
{
	image_speed = 1;
	audio_play_sound(sfxExplosionOne,2,false);
}

instance_destroy();