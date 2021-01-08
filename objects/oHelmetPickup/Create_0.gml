randomize();

var rand_helmet = choose("POWER","MOUNTIE","CAP","BANDANA","MILITARY");

switch (rand_helmet)
{
	case "POWER":
		sprite_index = sHelmetPower;
		image_index = 0;
		image_speed = 0;
		helmet = oHelmetPower;
		break;
		
	case "MOUNTIE":
		sprite_index = sHelmetMountie;
		image_index = 0;
		image_speed = 0;
		helmet = oHelmetMountie;
		break;
		
	case "CAP":
		sprite_index = sHelmetCap;
		image_index = 0;
		image_speed = 0;
		helmet = oHelmetCap;
		break;
		
	case "BANDANA":
		sprite_index = sHelmetBandana;
		image_index = 0;
		image_speed = 0;
		helmet = oHelmetBandana;
		break;
		
	case "MILITARY":
		sprite_index = sHelmetMilitary;
		image_index = 0;
		image_speed = 0;
		helmet = oHelmetMilitary;
		break;
}