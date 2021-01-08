//Movement
hsp = 0;
vsp = 0;
grv = 0.5;
movespd = 2;
grounded = 0;
jump_height = -7;

//Traits
state = "MOVE";
has_gun = false;
gun = noone;
helmet = false;

//Stats
max_hp = 10;
hp = max_hp;
kills = 0;

instance_create_layer(x,y,"Gun",oMachineGun);