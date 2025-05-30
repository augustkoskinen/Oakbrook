var hovering = false;
if(state == coinstates.available||state == coinstates.selected) {
	if(!global.chooseenemystate&&!global.enemyturn) {
		x+=adjustposx;
		y+=adjustposy;
		if(collision_point(mouse_x,mouse_y,self,true,false)) {
			if(global.hoverid == noone) {
				global.hoverid = self;
			}
		} else if(global.hoverid == self){
			global.hoverid = noone;
		}
		x-=adjustposx;
		y-=adjustposy;
	} else {
		draw_set_alpha(0.5);
	}
	
	if(global.hoverid==self) {
		if(global.mousedown) {
			if(state == coinstates.selected) {
				makeCoinAvailable(self);
			} else {
				selectCoin(self);
			}
		
			global.mousedown = false;
		}
	}
	if(global.hoverid == self||state == coinstates.selected) {
		shader_set(shWhiteOutline)
		var texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0))
		var texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0))
		shader_set_uniform_f(pixelDims,texelW,texelH)
		adjustposy = -4;
	} 
} else if(state == coinstates.discarded) {
	if(global.chooseenemystate||global.enemyturn) {
		
		draw_set_alpha(0.5);
	}
}

if(state == coinstates.selected) {
	adjustposy = -4;
} else if(state == coinstates.available) {
	depth = 0;
	adjustposy = 0;
}

draw_sprite(sprite_index,0,x+adjustposx,y+adjustposy);

draw_set_alpha(1.0);
shader_reset()