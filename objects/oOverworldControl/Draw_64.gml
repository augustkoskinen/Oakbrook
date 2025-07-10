if(global.overworldaction != -1&&startaction) {
	switch(global.overworldaction) {
		case 1: {
			for(var i = 0; i < array_length(global.curspotid.holdcard); i++) {
				var card = instance_create_layer(0,0,"Cards",oCard);
				card.index = array_get(global.curspotid.holdcard,i).index;
				card.type = array_get(global.curspotid.holdcard,i).type;
				array_push(choosecards,card);
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
			var num = array_length(global.cards);
			var middle = display_get_gui_width()/2;
			
			for(var i = 0; i < num; i++) {
				var card = array_get(global.cards,i);
				card.holdx = middle-2*(num/2-i-0.5)*space;
				card.holdy = display_get_gui_height()/2;
			}
			
			for(var i = 0; i < array_length(global.curspotid.holdcard); i++) {
				var card = instance_create_layer(0,0,"Cards",oCard);
				card.index = array_get(global.curspotid.holdcard,i).index;
				card.type = array_get(global.curspotid.holdcard,i).type;
				array_push(choosecards,card);
			}
			
			break;
		}
		case 5: {
			var space = 18;
			var rownum = 10;
			var num = 0;
			var index = 0;
			var middle = display_get_gui_width()/2;
			
			for(var i = 0; i < array_length(global.cards); i++)
				if(array_get(global.cards,i).index==16||array_get(global.cards,i).index==17)
					num++;
			
			for(var i = 0; i < array_length(global.cards); i++) {
				var card = array_get(global.cards,i);
				if(card.index==16||card.index==17) {
					card.holdx = middle-2*(num/2-index-0.5)*space;
					card.holdy = display_get_gui_height()/2;
					array_push(selectcards,card)
					index++;
				}
			}
			break;
		}
		
	}
	
	startaction = false;
}

if(global.overworldaction != -1) {
	var scale = 4;
	
	var _x = display_get_gui_width()/2+192;
	var _y = display_get_gui_width()/2+192;
	
	if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
		_x-8*scale,_y-8*scale,
		_x+8*scale,_y+8*scale
	)&&!global.paused) {
		shader_set(shWhiteOutline)
		var texelW = texture_get_texel_width(sprite_get_texture(sCancel,0))
		var texelH = texture_get_texel_height(sprite_get_texture(sCancel,0))
		shader_set_uniform_f(pixelDims,texelW,texelH)
					
		if(global.mousedown) {
			global.mousedown = false;
			global.overworldaction = -1
			startaction = true;
		}
	}
				
	draw_sprite_ext(sCancel,0,_x,_y,scale,scale,0,c_white,1.0);
	shader_reset();
	
	if(global.overworldaction != -1) {
		switch(global.overworldaction) {
			case 1: {
				for(var i = 0; i < array_length(choosecards); i++) {
					if((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-14*scale,
						display_get_gui_width()/2+128*(1-i)+9*scale,display_get_gui_height()/2+14*scale)
					)&&!global.paused) {
						shader_set(shWhiteOutline)
						var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
						var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
						shader_set_uniform_f(pixelDims,texelW,texelH)
					
						if(global.mousedown) {
							var card = array_get(choosecards,i).id
							array_push(global.cards,card);
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
					if((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						display_get_gui_width()/2-64+128*i-9*scale,display_get_gui_height()/2-14*scale,
						display_get_gui_width()/2-64+128*i+9*scale,display_get_gui_height()/2+14*scale)
					)&&!global.paused) {
						shader_set(shWhiteOutline)
						var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
						var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
						shader_set_uniform_f(pixelDims,texelW,texelH)
					
						if(global.mousedown) {
							var card = array_get(choosecards,i).id
							array_push(global.cards,card);
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
				
					if((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						display_get_gui_width()/2+128*(1-i)-9*scale,display_get_gui_height()/2-128-14*scale,
						display_get_gui_width()/2+128*(1-i)+9*scale,display_get_gui_height()/2-128+14*scale)
					&&canchoose)&&!global.paused) {
						shader_set(shWhiteOutline)
						var texelW = texture_get_texel_width(sprite_get_texture(sCard,array_get(choosecards,i).index))
						var texelH = texture_get_texel_height(sprite_get_texture(sCard,array_get(choosecards,i).index))
						shader_set_uniform_f(pixelDims,texelW,texelH)
					
						if(global.mousedown) {
							while(array_length(trashselect)>0) {
								array_delete(global.cards, array_get_index(global.cards,array_get(trashselect,0)),1);
								array_delete(trashselect, 0,1);
							}
						
							var card = array_get(choosecards,i).id
							array_push(global.cards,card);
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
				for(var i = array_length(global.cards) - 1; i >= 0; i--) {
					var card = array_get(global.cards,i);
					if((point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						card.holdx-9*scale, card.holdy-14*scale,
						card.holdx+9*scale, card.holdy+14*scale
					)&&!global.paused)) {
						hoverid = card.id
					}
				}
			
				for(var i = array_length(global.cards) - 1; i >= 0; i--) {
					var card = array_get(global.cards,i);
					var selected = array_contains(trashselect,card.id);
				
					if((hoverid==card.id||selected)&&!global.paused) {
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
					} else if((global.mousedown&&hoverid==noone)&&!global.paused) {
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
				_x = display_get_gui_width()/2;
				_y = display_get_gui_height()/2;
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					_x-10*scale,_y-10*scale,
					_x+10*scale,_y+10*scale
				)&&!global.paused) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCancel,0))
					var texelH = texture_get_texel_height(sprite_get_texture(sCancel,0))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					
					if(global.mousedown) {
						global.playerhealth = min(global.playermaxhealth, 2+global.playerhealth);
						global.overworldaction = -1
						startaction = true;
					}
				}
				
				draw_sprite_ext(sHPUp,0,_x,_y,scale*2,scale*2,0,c_white,1.0);
				shader_reset();
				break;
			}
			case 5: {
				for(var i = 0; i < 2; i++) {
					var canchoose = (check_selected_type(trashselect,16+i)>=4);
					
					if(i==0&&global.vessels>=3) canchoose = false;
					if(i==1&&global.idols>=3) canchoose = false;
				
					var alpha = 1.0;
					_x = display_get_gui_width()/2+64-128*(1-i)
					_y = display_get_gui_height()/2-128
				
				
					if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						_x-scale*6,_y-scale*8,
						_x+scale*6,_y+scale*8)
					&&canchoose&&!global.paused) {
						shader_set(shWhiteOutline)
						var texelW = texture_get_texel_width(sprite_get_texture(sVesselIdol,i))
						var texelH = texture_get_texel_height(sprite_get_texture(sVesselIdol,i))
						shader_set_uniform_f(pixelDims,texelW,texelH)
					
						if(global.mousedown) {
							while(array_length(trashselect)>0) {
								array_delete(global.cards, array_get_index(global.cards,array_get(trashselect,0)),1);
								array_delete(trashselect, 0,1);
							}
						
							if(i==0) {
								global.vessels++;
								global.handmax++;
							} else if(i==1) {
								global.idols++;
								global.coinmax++;
							}
						
							selectcards = array_create(0);
							global.mousedown = false;
							global.overworldaction = -1;
						}
					} else if(!canchoose) {
						alpha = 0.5;
					}
				
					draw_sprite_ext(sVesselIdol,i,_x,_y,scale,scale,0,c_white,alpha);
				
					shader_reset();
				}
			
				var hoverid = noone;
				for(var i = array_length(selectcards) - 1; i >= 0; i--) {
					var card = array_get(selectcards,i);
					if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
						card.holdx-9*scale, card.holdy-14*scale,
						card.holdx+9*scale, card.holdy+14*scale
					)&&!global.paused) {
						hoverid = card.id
					}
				}
			
				for(var i = array_length(selectcards) - 1; i >= 0; i--) {
					var card = array_get(selectcards,i);
					var selected = array_contains(trashselect,card.id);
				
					if(global.mousedown&&hoverid==noone) {
						trashselect = array_create(0);
						global.mousedown = false;
					} else if((hoverid==card.id||selected)&&!global.paused) {
						shader_set(shWhiteOutline)
						var texelW = texture_get_texel_width(sprite_get_texture(sCard,card.index))
						var texelH = texture_get_texel_height(sprite_get_texture(sCard,card.index))
						shader_set_uniform_f(pixelDims,texelW,texelH)
					
						if(global.mousedown) {
							if(!selected) {
								if(array_length(trashselect)>=4) {
									array_delete(trashselect,0,1);
								}
							
								array_push(trashselect,card);
								global.mousedown = false;
							} else if(hoverid==card.id) {
								array_delete(trashselect,array_get_index(trashselect,card.id),1);
								global.mousedown = false;
							}
						}
					}
				
				
					draw_sprite_ext(sCard,card.index+45,card.holdx-9*scale,card.holdy-32*selected-14*scale,scale,scale,0,c_white,1.0);
				
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
			case 6: {
				_x = display_get_gui_width()/2;
				_y = display_get_gui_height()/2;
				if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
					_x-10*scale,_y-20*scale,
					_x+10*scale,_y+20*scale
				)&&!global.paused) {
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sCancel,0))
					var texelH = texture_get_texel_height(sprite_get_texture(sCancel,0))
					shader_set_uniform_f(pixelDims,texelW,texelH)
					if(global.mousedown) {
						global.playermaxhealth++;
						global.playerhealth++;
						global.overworldaction = -1
						startaction = true;
					}
				}
				
				draw_sprite_ext(sHPUp,1,_x,_y,scale*2,scale*2,0,c_white,1.0);
				shader_reset();
				break;
			}
		}
	}
}