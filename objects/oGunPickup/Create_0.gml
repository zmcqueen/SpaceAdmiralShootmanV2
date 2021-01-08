randomize();

var rand_gun = choose("SHOTGUN","LASERGUN","CARBINE","ARCTHROWER","SNIPER","CANNON");

switch (rand_gun)
{
	case "SHOTGUN":
		sprite_index = sShotgun;
		image_index = 0;
		image_speed = 0;
		gun = oShotgun;
		break;
		
	case "LASERGUN":
		sprite_index = sLaserGun;
		image_index = 0;
		image_speed = 0;
		gun = oLaserGun;
		break;
		
	case "CARBINE":
		sprite_index = sCarbine;
		image_index = 0;
		image_speed = 0;
		gun = oCarbine;
		break;
		
	case "ARCTHROWER":
		sprite_index = sArcThrower;
		image_index = 0;
		image_speed = 0;
		gun = oArcThrower;
		break;
		
	case "SNIPER":
		sprite_index = sSniper;
		image_index = 0;
		image_speed = 0;
		gun = oSniper;
		break;
		
	case "CANNON":
		sprite_index = sCannon;
		image_index = 0;
		image_speed = 0;
		gun = oCannon;
		break;
}