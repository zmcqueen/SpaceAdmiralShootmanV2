vsp = vsp + grv;
if (!place_meeting(x,y+vsp,pCollide))
{
	y += vsp;
}
else
{
	vsp = 0;
}