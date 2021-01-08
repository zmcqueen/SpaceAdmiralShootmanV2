//Sprite Size
image_xscale = 0.6;
image_yscale = 0.6;

//Stats
bullet_damage = 3;
if (instance_exists(oHelmetMilitary))
{
	bullet_damage = bullet_damage * 1.5;
}