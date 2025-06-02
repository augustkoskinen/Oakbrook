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

			break;
		}
		case 3: {
		
			break;
		}
	}
	
	startaction = false;
}

if(global.overworldaction != -1) {
	switch(global.overworldaction) {
		case 1: {
			for(var i = 0; i < array_length(choosecards); i++) {
				var scale = 4;
				
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

			break;
		}
		case 3: {
		
			break;
		}
	}
}