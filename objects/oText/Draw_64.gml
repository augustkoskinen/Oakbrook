depth = -1000;

width = 128;
height = string_height_ext(text,10,width);
var curheight = (height*2+textoffsety+44-76)/(1+power(2.71828182846,-15*time+12))+76

draw_sprite_stretched(
	sText,floor(time*3),x,y,
	(width+textoffsetx)*2+12,
	curheight
);

surface = surface_create(width*4,curheight-35);
surface_set_target(surface);

draw_set_font(fnText);
draw_set_colour(c_black);
draw_text_ext_transformed(
	textoffsetx,
	textoffsety,
	text,10,width,2,2,0
);

surface_reset_target();
draw_surface(surface,x,y)

if(!global.paused)
	time+=delta_time/1000000;