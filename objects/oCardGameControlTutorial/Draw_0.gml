if(global.startCardGame) {
	global.startCardGame = false;
    deck = array_shuffle(oCardControl.cards);
	for(var i = 0; i < oCardControl.handmax; i++) {
		drawCard(array_get(deck,0), hand, deck);
	}
	
	drawCoin(oCardControl.coinmax);
}
depth = global.depthcount-100;

var anyshaderyes = false;

if(global.chooseenemystate&&!global.enemyturn&&global.canTakeAction&&!global.paused) {
	if(global.mousedown) {
		var enemychoose = collision_point(mouse_x,mouse_y,oEnemy,false,true)
		if(enemychoose!=noone&&enemychoose.attacker==noone) {
			enemychoose.attacker = curoptionselect;
			
			var cost = getOptionCost(1);
			var selected = getSelected(oCard, oCoin);
			var check = checkOption(1, cost, selected);
			
			selectCardAttack(curoptionselect, enemychoose)
		
			optionPay(cost,selected);
					
			selectedattack = curoptionselect;
			resetAllCardsAndCoins();
		}
		
		global.mousedown = false;
		global.chooseenemystate = false;
	}
	
}

if(curoptionselect!=noone) {
	var originx = curoptionselect.x+20;
	var originy = curoptionselect.y-4;
	var options = getCardOptions(curoptionselect.index,curoptionselect.type);
	
	var col = false;
	var cost = noone;
	
	for(var i = array_length(options)-1; i >= 0; i--) {
		if(!global.chooseenemystate&&!global.enemyturn) {
			cost = getOptionCost(array_get(options,i));
			var selected = getSelected(oCard, oCoin);
			var check = checkOption(array_get(options,i), cost, selected);
			
			col = point_in_rectangle(mouse_x,mouse_y,originx,originy+i*10,originx+30,originy+i*10+9);
			
			if(global.canTakeAction&&!global.paused) {
				if(col) {//&&global.hoverid == noone
					if(check) {
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
					} else {
						draw_set_alpha(0.5);
					}
				} else if(!check) {
					draw_set_alpha(0.5);
				}
			}
		} else {
			draw_set_alpha(0.5);
		}
		
		draw_sprite(sOption,array_get(options,i),originx,originy+i*10);
		
		draw_set_alpha(1.0);
		shader_reset();
		
		if(col) {
			shader_set(shWhiteOutline)
			var texelW = texture_get_texel_width(sprite_get_texture(sOption,array_get(options,i)))
			var texelH = texture_get_texel_height(sprite_get_texture(sOption,array_get(options,i)))
			shader_set_uniform_f(pixelDims,texelW,texelH)
			
			if(originx<=112) {
				if(cost[0]==0&&cost[1]!=0) {
					draw_sprite(sCoinCost,cost[1],originx+29,originy+i*10+1);
				} else {
					draw_sprite(sCardCost,cost[0],originx+29,originy+i*10+1);
					draw_sprite(sCoinCost,cost[1],originx+40,originy+i*10+1);
				}
			} else {
				if(cost[0]==0&&cost[1]!=0) {
					draw_sprite(sCoinCost,cost[1],originx-13,originy+i*10+1);
				} else {
					draw_sprite(sCardCost,cost[0],originx-13,originy+i*10+1);
					draw_sprite(sCoinCost,cost[1],originx-25,originy+i*10+1);
				}
			}
			
			shader_reset();
		}
	}
}

if(array_length(enemyturnsequence)>0) {
	global.enemyturn = true;
	
	enemycounter-=delta_time/1000000;
	if(enemycounter<=0) {
		array_delete(enemyturnsequence,0,1);
		if(array_length(enemyturnsequence)==2) {
			var dmg = array_get(enemyarray, 0).dmg;
			
			if(selectedshield!=noone) {
				dmg -= getCardDmgInfo(selectedshield.index)[0];
				
				if((array_get(enemyarray, 0).dmgtype==1&&selectedshield.type==0)||
					(array_get(enemyarray, 0).dmgtype==2&&selectedshield.type==1)||
					(array_get(enemyarray, 0).dmgtype==3&&selectedshield.type==2)||
					(array_get(enemyarray, 0).dmgtype==0&&selectedshield.type==3)) {
					dmg++;
				} else if(((array_get(enemyarray, 0).dmgtype==0&&selectedshield.type==1)||
					(array_get(enemyarray, 0).dmgtype==1&&selectedshield.type==2)||
					(array_get(enemyarray, 0).dmgtype==2&&selectedshield.type==3)||
					(array_get(enemyarray, 0).dmgtype==3&&selectedshield.type==0))) {
					dmg--;
				}
				
	
				discardCard(selectedshield,selectedshield,discard);
				selectedshield = noone;
			}
			
			global.playerhealth -= max(dmg,0);
			
			if(global.playerhealth<=0) {//LOSE CONDITION ================================
				moveDiscardToDeck(deck,discard);
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
	if(point_in_rectangle(mouse_x,mouse_y,51-16-4,105-32-3,51-16+4,105-32+3)&&global.canTakeAction&&!global.paused) {
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

draw_sprite(sStone,0,51-16,105-32);
draw_set_alpha(1.0);
shader_reset();

draw_sprite(sHeart,global.playerhealth,24-16,95-32);

if(!anyshaderyes&&global.hoverid == self) {
	global.hoverid = noone;
}

for(var i = 0; i < oCardControl.idols; i++) {
	draw_sprite(sVesselIdol,1,12+i*12,137)
}

for(var i = 0; i < oCardControl.vessels; i++) {
	draw_sprite(sVesselIdol,0,12+i*12,137+14)
}