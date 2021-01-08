draw_self();

if (fire_rate > 0)
{
	var start_x = oPlayer.x - 7;
	var start_y = oPlayer.y - 12;
	var end_x = oPlayer.x + 6;
	var end_y = oPlayer.y - 12;
	//draw_line_width(start_x,start_y,end_x,end_y,1);
	draw_healthbar(start_x,start_y,end_x,end_y,fire_rate,c_black,c_white,c_white,1,false,false);
}