if((room==rmStartScreen)&&time == timemax+1&&global.playmenutrigger) {
	time = timemax;
	if(global.playopen) {
		returning = false;
	} else 
		returning = true;
	global.playmenutrigger = false;
}
//show_debug_message(returning)

var yoffset = 0;
if(time<=0) {
	time = timemax+1
} else if(time<=timemax) {
	time -= delta_time/1000000;
	
	if(!returning) {
		yoffset = (640.5)/(1+power(2.71828182846,10*(time-timemax/2-0.375)))-640
		
		if(abs(yoffset)<=0.125)
			time = timemax+1
	} else {
		yoffset = -640/(1+power(2.71828182846,10*(time-timemax/2+0.0625)))
		
		if(abs(yoffset)>=630) {
			global.playopen = false;
			time = timemax+1
		}
	}
	
}


depth = -10000;
if(global.playopen||time <= timemax) {
	draw_sprite_ext(sprite_index,0,0,yoffset,8,8,0,c_white,1.0)

	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		46,38+yoffset/4,116,38+18+yoffset/4
	)) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,1)),
			texture_get_texel_height(sprite_get_texture(sprite_index,1))
		)
		if(global.mousedown) {
			global.startGame = true;
			/*
			instance_destroy(oCam);
			instance_destroy(oPath);
			instance_destroy(oSpot);
			instance_destroy(oEnvironmentPar);
			instance_destroy(oOverworldControl);
			instance_destroy(oCardControl);
			instance_destroy(oCard);
			instance_destroy(oCoin);
			
			global.targetroom = rmStartScreen;
			global.playopen = false;
			global.canTakeAction = true;
			global.restartGame = true;
			time = timemax+1
			*/
			
		}
	}
	draw_sprite_ext(sprite_index,1,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
	
	if(!savedGameExists()) {
		draw_sprite_ext(sprite_index,2,0,yoffset,8,8,0,c_white,0.5)
	} else {
		if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
			46,64+yoffset/4,116,64+18+yoffset/4
		)) {
			shader_set(shWhiteOutline)
			shader_set_uniform_f(pixelDims,
				texture_get_texel_width(sprite_get_texture(sprite_index,2)),
				texture_get_texel_height(sprite_get_texture(sprite_index,2))
			)
		
			if(global.mousedown) {
				global.startGame = true;
				global.loadGame = true;
			}
		}
		draw_sprite_ext(sprite_index,2,0,yoffset,8,8,0,c_white,1.0)
		shader_reset();
	}
	
	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		46,90+yoffset/4,116,90+18+yoffset/4
	)) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,2)),
			texture_get_texel_height(sprite_get_texture(sprite_index,2))
		)
		
		if(global.mousedown) {
			global.startTutorial = true;
		}
	}
	draw_sprite_ext(sprite_index,3,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
	
	if(point_in_rectangle(device_mouse_x_to_gui(0)/4,device_mouse_y_to_gui(0)/4,
		46,116+yoffset/4,116,116+18+yoffset/4
	)) {
		shader_set(shWhiteOutline)
		shader_set_uniform_f(pixelDims,
			texture_get_texel_width(sprite_get_texture(sprite_index,2)),
			texture_get_texel_height(sprite_get_texture(sprite_index,2))
		)
		
		if(global.mousedown) {
			time = timemax;
			
			global.mousedown = false;
			returning = true;
		}
	}
	draw_sprite_ext(sprite_index,4,0,yoffset,8,8,0,c_white,1.0)
	shader_reset();
}