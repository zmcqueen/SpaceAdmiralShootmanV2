with (other)
{
	hp = hp - other.bullet_damage;
	audio_play_sound(sfxDamageTwo,4,false);
}

instance_destroy();