var hovering = false;

switch state {
	case cardstates.available : {
		targetx = holdx;
		targety = 116-24;
		break;
	}
	case cardstates.selected : {
		
		break;
	}
	case cardstates.selectedoption : {
		
		break;
	}
	case cardstates.selectedattack : {
		targetx = holdx;
		targety = 75-24;
		break;
	}
	case cardstates.selectedshield : {
		targetx = 21-16;
		targety = 109-24;
		break;
	}
	case cardstates.discarded : {
		targetx = 42-16;
		targety = 138-24;
		break;
	}
}

if(global.won==0) {
	if(state == cardstates.available||
		state == cardstates.selected||
		state == cardstates.selectedoption) {
	
		if(!global.chooseenemystate&&!global.enemyturn) {
			x = targetx+adjustposx;
			y = targety+adjustposy;
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

		draw_sprite(sprite_index,index+type*15,targetx+adjustposx,targety+adjustposy);

		draw_set_alpha(1.0);
		shader_reset()
	} else if(state==cardstates.discarded){
		if(!global.chooseenemystate&&!global.enemyturn) {
			x = targetx;
			y = targety;
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
	
		if(global.hoverid == self) {
			shader_set(shWhiteOutline)
			var texelW = texture_get_texel_width(sprite_get_texture(sprite_index,index))
			var texelH = texture_get_texel_height(sprite_get_texture(sprite_index,index))
			shader_set_uniform_f(pixelDims,texelW,texelH)
		
			if(global.mousedown) {
				discardAll(true)
				moveDiscardToDeck(oCardGameControl.deck,oCardGameControl.discard)
				global.hoverid = noone;
				global.mousedown = false;
			}
		}
		
		if(global.won==0)
			depth = -array_get_index(oCardGameControl.discard,id)
	
		draw_sprite(sprite_index,index+type*15,targetx,targety);
	
		shader_reset();
		draw_set_alpha(1.0);
	}	else if (state==cardstates.selectedattack||state==cardstates.selectedshield){
		if(global.chooseenemystate) {
			draw_set_alpha(0.5);
		}
	
		draw_sprite(sprite_index,index+type*15,targetx,targety);
	
		draw_set_alpha(1.0);
	}  else if(state==cardstates.indeck){
	
	}

	if(state == cardstates.selected||state == cardstates.selectedoption) {
		adjustposy = -4;
	} else {
		depth = 0;
		adjustposy = 0;
	}
}