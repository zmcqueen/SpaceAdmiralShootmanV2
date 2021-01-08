function enemy_move_and_collide(argument0, argument1) {
	var x_move = argument0;
	var y_move = argument1;

	if (place_meeting(x+x_move,y,pCollide))
	{
		while (!place_meeting(x+sign(x_move),y,pCollide))
		{
			x += sign(x_move);
		}
		x_move = 0;
	}
	x += x_move;

	if (place_meeting(x,y+y_move,pCollide))
	{
		while (!place_meeting(x,y+sign(y_move),pCollide))
		{
			y += sign(y_move);
		}
		y_move = 0;
	}
	y += y_move;


}
