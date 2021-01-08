if (animation_hit_frame(1))
{
	if (instance_exists(oHelmetPower))
	{
		with (oHelmetPower)
		{
			hp = hp - 1;
		}
	}
	else
	{
		with (other)
		{
			hp = hp - 2;
		}
	}
}