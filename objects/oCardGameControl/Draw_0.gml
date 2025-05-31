if(global.startGame) {
	global.startGame = false;
	
	//array_copy(deck, 0, oCardControl.cards, 0, array_length(oCardControl.cards));
    deck = array_shuffle(oCardControl.cards);
	for(var i = 0; i < oCardControl.handmax; i++) {
		drawCard(array_get(deck,0), hand, deck);
	}
	
	drawCoin(oCardControl.coinmax);
}
depth = global.depthcount-100;

var anyshaderyes = false;

if(global.chooseenemystate&&!global.enemyturn) {
	if(global.mousedown) {
		var enemychoose = collision_point(mouse_x,mouse_y,oEnemy,false,true)
		if(enemychoose!=noone&&enemychoose.attacker==noone) {
			enemychoose.attacker = curoptionselect;
			
			var cost = getOptionCost(1);
			var selected = getSelected(oCard, oCoin);
			var check = checkOption(1, cost, selected);
			
			selectCardAttack(curoptionselect, enemychoose)
		
			optionPay(cost,selected);
					
			if(array_get(enemyarray, 0).curhp<=0) {
				global.won = 1;
			}
					
			selectedattack = curoptionselect;
			resetAllCardsAndCoins();
		} else {
			
		}
		
		global.mousedown = false;
		global.chooseenemystate = false;
	}
	
}

if(curoptionselect!=noone) {
	var originx = curoptionselect.x+20;
	var originy = curoptionselect.y-4;
	var options = getCardOptions(curoptionselect.index,curoptionselect.type);
	for(var i = 0; i < array_length(options); i++) {
		if(!global.chooseenemystate&&!global.enemyturn) {
			var cost = getOptionCost(array_get(options,i));
			var selected = getSelected(oCard, oCoin);
			var check = checkOption(array_get(options,i), cost, selected);
			
			var col = point_in_rectangle(mouse_x,mouse_y,originx,originy+i*10,originx+30,originy+i*10+9);
			
			if(check) {
				if(col) {//&&global.hoverid == noone
					if(global.mousedown) {
						performOption(array_get(options,i), curoptionselect, hand, deck);
						
						global.mousedown = false;
					}
			
					shader_set(shWhiteOutline)
					var texelW = texture_get_texel_width(sprite_get_texture(sOption,array_get(options,i)))
					var texelH = texture_get_texel_height(sprite_get_texture(sOption,array_get(options,i)))
					shader_set_uniform_f(pixelDims,texelW,texelH)
				
					global.hoverid = self;
					anyshaderyes = true;
				}
			} else {
				draw_set_alpha(0.5);
			}
		} else {
			draw_set_alpha(0.5);
		}
		
		draw_sprite(sOption,array_get(options,i),originx,originy+i*10);
		
		draw_set_alpha(1.0);
		shader_reset();
	}
}

if(array_length(enemyturnsequence)>0) {
	global.enemyturn = true;
	
	enemycounter-=delta_time/1000000;
	if(enemycounter<=0) {
		array_delete(enemyturnsequence,0,1);
		if(array_length(enemyturnsequence)==2) {
			var dmg = array_get(enemyarray, 0).dmg+1*(attackboosted == true);
			
			//show_debug_message(selectedshield)
			if(selectedshield!=noone) {
				dmg -= getCardDmgInfo(selectedshield.index)[0];
				
				if((array_get(enemyarray, 0).hptype==1&&selectedshield.type==0)||
					(array_get(enemyarray, 0).hptype==2&&selectedshield.type==1)||
					(array_get(enemyarray, 0).hptype==3&&selectedshield.type==2)||
					(array_get(enemyarray, 0).hptype==0&&selectedshield.type==3)) {
					dmg++;
				} else if(((array_get(enemyarray, 0).type==0&&selectedshield.type==1)||
					(array_get(enemyarray, 0).hptype==1&&selectedshield.type==2)||
					(array_get(enemyarray, 0).hptype==2&&selectedshield.type==3)||
					(array_get(enemyarray, 0).hptype==3&&selectedshield.type==0))) {
					dmg--;
				}
			}
			
			playerhealth -= max(dmg,0);
			
			if(playerhealth<=0) {
				global.won = -1;
			}
			attackboosted = false;
		} else if(array_length(enemyturnsequence)==1) {
			for(var i = 0; i < oCardControl.handmax; i++) {
				if(array_length(deck)>0)
					drawCard(array_get(deck,0), hand, deck);
			}
			
			resetCoins(oCardControl.coinmax);
		}
		
		if(array_length(enemyturnsequence)>0) {
			enemycounter = array_get(enemyturnsequence,0)
		}
	}
} else {
	global.enemyturn = false;
}

if(!global.chooseenemystate&&!global.enemyturn) {
	if(point_in_rectangle(mouse_x,mouse_y,51-4,105-3,51+4,105+3)) {
		//if(global.hoverid == noone) {
			shader_set(shWhiteOutline)
			var texelW = texture_get_texel_width(sprite_get_texture(sStone,0))
			var texelH = texture_get_texel_height(sprite_get_texture(sStone,0))
			shader_set_uniform_f(pixelDims,texelW,texelH)
			global.hoverid = self;
			
			if(global.mousedown) {
				discardAll(true)
				global.mousedown = false;
			}
			
			anyshaderyes = true;
		//}
	}
} else {
	draw_set_alpha(0.5);
}

draw_sprite(sStone,0,51,105);
draw_set_alpha(1.0);
shader_reset();

draw_sprite(sHeart,playerhealth,24,95);

if(!anyshaderyes&&global.hoverid == self) {
	global.hoverid = noone;
}