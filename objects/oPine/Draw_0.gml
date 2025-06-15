if(lifetime+1>=maxlifetime)
	image_alpha = maxlifetime-lifetime;
else 
	image_alpha = 1;

y+=delta_time/1000000*10;

lifetime+=delta_time/1000000;
if(lifetime>=maxlifetime||room!=rmOverworld) 
	instance_destroy();

addx = dsin(lifetime*120)*6;
addy = -abs(dsin(lifetime*120)*2);

draw_sprite_ext(sprite_index,image_index,x+addx,y+addy,1,1,0,c_white,image_alpha);