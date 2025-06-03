if(global.overworldaction != -1&&startaction) {
	switch(global.overworldaction) {
		case 1: {
			for(var i = 0; i < 3; i++) {
				var card = instance_create_layer(0,0,"Cards",oCard);
				card.index = max(ceil(global.level/2)+irandom_range(1,-1),1);
				card.type = irandom_range(0,3);
				array_push(choosecards,card)
			}
			break;
		}
		
		case 2: {
			for(var i = 0; i < 2; i++) {
				var card = instance_create_layer(0,0,"Cards",oCard);
				card.index = 16+i
				array_push(choosecards,card)
			}
			break;
		}
		
		case 3: {
			var space = 18;
			var rownum = 10;
			var num = array_length(oCardControl.cards);
			var middle = display_get_gui_width()/2;
			for(var i = 0; i < num; i++) {
				var card = array_get(oCardControl.cards,i);
				card.holdx = middle-2*(num/2-i-0.5)*space;
				card.holdy = display_get_gui_height()/2;
			}
			
			for(var i = 0; i < 3; i++) {
				var card = instance_create_layer(0,0,"Cards",oCard);
				card.index = max(ceil(global.level/2)+2+irandom_range(1,-1),1);
				card.type = irandom_range(0,3);
				array_push(choosecards,card)
			}
			break;
		}
	}
	
	startaction = false;
}

if(global.overworldaction != -1) {
	var scale = 4;
	
	switch(global.overworldaction) {
		case 1: {
			for(var i = 0; i < array_length(choosecards); i++) {
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-14*scale,
					display_get_gui_width()/2+128*(1-i)+9*scale,display_get_gui_height()/2+14*scale)
				) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
					var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					
					if(global.mousedown) {
						var card = array_get(choosecards,i).id
						array_push(oCardControl.cards,card);
						array_delete(choosecards,array_get_index(choosecards,card),1);
						global.mousedown = false;
						global.overworldaction = -1
					}
				}
				if(array_length(choosecards)==3)
					draw_sprite_ext(sCard,array_get(choosecards,i).index+array_get(choosecards,i).type*15,display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-14*scale,scale,scale,0,c_white,1.0);
				
				shader_reset();
			}
			
			if(global.overworldaction==-1) {
				for(var i = 0; i < array_length(choosecards); i++) {
					instance_destroy(array_get(choosecards,i))
				}
				choosecards = array_create(0);
				startaction = true;
			}
			
			break;
		}
		case 2: {
			for(var i = 0; i < array_length(choosecards); i++) {
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					display_get_gui_width()/2-64+128*i-9*scale,display_get_gui_height()/2-14*scale,
					display_get_gui_width()/2-64+128*i+9*scale,display_get_gui_height()/2+14*scale)
				) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
					var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					
					if(global.mousedown) {
						var card = array_get(choosecards,i).id
						array_push(oCardControl.cards,card);
						array_delete(choosecards,array_get_index(choosecards,card),1);
						global.mousedown = false;
						global.overworldaction = -1
					}
				}
				if(array_length(choosecards)==2)
					draw_sprite_ext(sCard,array_get(choosecards,i).index+45,display_get_gui_width()/2-64+128*i-9*scale,display_get_gui_height()/2-14*scale,scale,scale,0,c_white,1.0);
				shader_reset();
			}
			
			if(global.overworldaction==-1) {
				for(var i = 0; i < array_length(choosecards); i++) {
					instance_destroy(array_get(choosecards,i))
				}
				choosecards = array_create(0);
				startaction = true;
			}
			break;
		}
		case 3: {
			for(var i = 0; i < array_length(choosecards); i++) {
				var canchoose = array_length(trashselect)==2;
				var alpha = 1.0;
				
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-128-14*scale,
					display_get_gui_width()/2+128*(1-i)+9*scale,display_get_gui_height()/2-128+14*scale)
				&&canchoose) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
					var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					
					if(global.mousedown) {
						while(array_length(trashselect)>0) {
							array_delete(oCardControl.cards, array_get_index(oCardControl.cards,array_get(trashselect,0)),1);
							array_delete(trashselect, 0,1);
						}
						
						var card = array_get(choosecards,i).id
						array_push(oCardControl.cards,card);
						array_delete(choosecards,array_get_index(choosecards,card),1);
						
						global.mousedown = false;
						global.overworldaction = -1;
					}
				} else if(!canchoose) {
					alpha = 0.5;
				}
				
				if(array_length(choosecards)==3)
					draw_sprite_ext(sCard,array_get(choosecards,i).index+array_get(choosecards,i).type*15,display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-128-14*scale,scale,scale,0,c_white,alpha);
				
				shader_reset();
			}
			
			var hoverid = noone;
			for(var i = array_length(oCardControl.cards) - 1; i >= 0; i--) {
				var card = array_get(oCardControl.cards,i);
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					card.holdx-9*scale, card.holdy-14*scale,
					card.holdx+9*scale, card.holdy+14*scale
				)) {
					hoverid = card.id
				}
			}
			
			for(var i = array_length(oCardControl.cards) - 1; i >= 0; i--) {
				var card = array_get(oCardControl.cards,i);
				var selected = array_contains(trashselect,card.id);
				
				if(hoverid==card.id||selected) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCard,card.index))
					var texelH = texture_get_texel_height(sprite_get_texture(sCard,card.index))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					
					if(global.mousedown&&!selected) {
						if(array_length(trashselect)>=2) {
							array_delete(trashselect,0,1);
						}
						array_push(trashselect,card);
						
						global.mousedown = false;
					}
				} else if(global.mousedown&&hoverid==noone) {
					trashselect = array_create(0);
					global.mousedown = false;
				}
				
				if(array_length(choosecards)==3)
					draw_sprite_ext(sCard,card.index+card.type*15,card.holdx-9*scale,card.holdy-32*selected-14*scale,scale,scale,0,c_white,1.0);
				
				shader_reset();
			}
			
			if(global.overworldaction==-1) {
				for(var i = 0; i < array_length(choosecards); i++) {
					instance_destroy(array_get(choosecards,i))
				}
				choosecards = array_create(0);
				startaction = true;
			}
			break;
		}
		case 4: {
			draw_sprite_ext(sHPUp,0,display_get_gui_width()/2,display_get_gui_height()/2,scale*2,scale*2,0,c_white,1.0);
			if(global.mousedown) {
				global.playerhealth = min(oCardControl.playermaxhealth, 2+global.playerhealth);
				global.overworldaction = -1
				startaction = true;
			}
			break;
		}
	}
}