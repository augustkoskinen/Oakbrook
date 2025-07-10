if((room==rmTutorial||room==rmCardMat||room==rmOverworld)&&time == timemax+1&&keyboard_check_pressed(vk_escape)&&!global.settingsopen) {
	time = timemax;
	if(!global.paused) {
		global.paused = true;
		returning = false;
	} else 
		returning = true;
}

var yoffset = 0;
if(time<=0) {
	time = timemax+1
} else if(time<=timemax) {
	time -= delta_time/1000000;
	
	if(!returning) {
		yoffset = (481.5)/(1+power(2.71828182846,10*(time-timemax/2-0.375)))-480
		
		if(abs(yoffset)<=0.125)
			time = timemax+1
	} else {
		yoffset = -500/(1+power(2.71828182846,10*(time-timemax/2+0.0625)))
		
		if(abs(yoffset)>=480-0.125) {
			global.paused = false;
			time = timemax+1
		}
	}
	
}

depth = -10000;
if(global.paused||time <= timemax) {
	draw_sprite_ext(sprite_index,0,0,yoffset,8,8,0,c_white,1.0)

	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		52,66+yoffset/4,108,84+yoffset/4
	)&&!global.settingsopen) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,1)),
			texture_get_texel_height(sprite_get_texture(sprite_index,1))
		)
		
		if(global.mousedown) {
			if(room!=rmTutorial)
				saveGame();
			
			instance_destroy(oCam);
			instance_destroy(oPath);
			instance_destroy(oSpot);
			instance_destroy(oEnvironmentPar);
			instance_destroy(oOverworldControl);
			instance_destroy(oCardControl);
			instance_destroy(oCard);
			instance_destroy(oCoin);
			
			global.targetroom = rmStartScreen;
			global.paused = false;
			global.canTakeAction = true;
			global.restartGame = true;
			time = timemax+1
			
		}
	}
	draw_sprite_ext(sprite_index,1,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
	
	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		52,96+yoffset/4,108,114+yoffset/4
	)&&!global.settingsopen) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,2)),
			texture_get_texel_height(sprite_get_texture(sprite_index,2))
		)
		if(global.mousedown) {
			global.settingsopen = true;
			global.trigger = true;
			global.mousedown = false;
		}
	}
	draw_sprite_ext(sprite_index,2,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
	
	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		52,126+yoffset/4,108,144+yoffset/4
	)&&!global.settingsopen) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,2)),
			texture_get_texel_height(sprite_get_texture(sprite_index,2))
		)
		if(global.mousedown) {
			time = timemax;
			returning = true;
			global.mousedown = false;
		}
	}
	draw_sprite_ext(sprite_index,3,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
}