if (room != room_menu) exit;

draw_set_halign(fa_left);

//Title
var title1 = "SPACE ADMIRAL";

draw_text_transformed_color(buff-1,buff-1,title1,1,1,0,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(buff+1,buff+1,title1,1,1,0,c_red,c_red,c_red,c_red,1);
draw_text_transformed_color(buff,buff,title1,1,1,0,c_black,c_black,c_black,c_black,1);

var title2 = "SHOOTMAN";
draw_text_transformed_color(buff*1.5-1,buff*3-1,title2,1,1,0,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(buff*1.5+1,buff*3+1,title2,1,1,0,c_red,c_red,c_red,c_red,1);
draw_text_transformed_color(buff*1.5,buff*3,title2,1,1,0,c_black,c_black,c_black,c_black,1);

//Enter to start
var start_text = "Press 'Enter' to Start";
draw_text_transformed(buff*1.5,buff*7,start_text,0.5,0.5,0);

//Escape to close
var start_text = "Press 'Escape' to Exit";
draw_text_transformed(buff*1.5,buff*8,start_text,0.3,0.3,0);