//Gun Float
y = (ystart-8) + sin(get_timer()/500000) * 5;

//Highlight Object when near
if (!instance_exists(oPlayer)) exit;

var player_range = point_distance(x,y,oPlayer.x,oPlayer.y);

if (player_range < sprite_width * 1.2)
{
	image_index = 2;
}
else image_index = 0;