var hovering = false;
//show_debug_message(state)
if(state == cardstates.available||
	state == cardstates.selected||
	state == cardstates.selectedoption) {
	
	if(!global.chooseenemystate) {
		if(collision_point(mouse_x,mouse_y,self,false,false)) {
			if(global.hoverid == noone) {
				global.hoverid = self;
			}
		} else if(global.hoverid == self) {
			global.hoverid = noone;
		}
	} else {
		draw_set_alpha(0.5);
	}

	if(global.hoverid==self) {
		if(global.mousedown) {
			if(state == cardstates.selected) {
				makeCardAvailable(self)
			} else if(state == cardstates.selectedoption) {
				makeCardAvailable(self)
				oCardGameControl.curoptionselect = noone;
			} else if(state == cardstates.available) {
				depth = global.depthcount
				global.depthcount--;
				selectCard(self)
			}
			global.mousedown = false;
		}
	
		if(global.mouserightdown) {
			if(state == cardstates.selectedoption) {
				makeCardAvailable(self)
				oCardGameControl.curoptionselect = noone;
			} else {
				selectOptionCard(self)
				global.mouserightdown = false;
			}
		}
	}

	if((global.mouserightdown||oCardGameControl.curoptionselect != self)&&state == cardstates.selectedoption) {
		makeCardAvailable(self)
	}

	if(global.hoverid == self||state == cardstates.selected||state == cardstates.selectedoption) {
		shader_set(shWhiteOutline)
		var texelW = texture_get_texel_width(sprite_get_texture(sprite_index,index))
		var texelH = texture_get_texel_height(sprite_get_texture(sprite_index,index))
		shader_set_uniform_f(pixelDims,texelW,texelH)
	}

	draw_sprite(sprite_index,index,x+adjustposx,y+adjustposy);

	draw_set_alpha(1.0);
	shader_reset()
} else if(state==cardstates.discarded||state==cardstates.selectedattack||state==cardstates.selectedshield){
	if(global.chooseenemystate) {
		draw_set_alpha(0.5);
	}
	
	draw_sprite(sprite_index,index,x,y);
	
	draw_set_alpha(1.0);

}  else if(state==cardstates.indeck){
	
}

if(state == cardstates.selected||state == cardstates.selectedoption) {
	adjustposy = -4;
} else {
	depth = 0;
	adjustposy = 0;
}