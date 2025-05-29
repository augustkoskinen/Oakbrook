if(global.mousedown||global.mouserightdown) {
	resetAllCardsAndCoins()
}

if(mouse_check_button_pressed(mb_left)) {
	global.mousedown = true;
} else {
	global.mousedown = false;
}


if(mouse_check_button_pressed(mb_right)) {
	global.mouserightdown = true;
} else {
	global.mouserightdown = false;
}

if(global.startGame) {
	global.startGame = false;
	
	//array_copy(deck, 0, oCardControl.cards, 0, array_length(oCardControl.cards));
    deck = array_shuffle(oCardControl.cards);
	array_push(hand,array_get(deck,0),array_get(deck,1),array_get(deck,2));
	array_delete(deck,0,3);
	
	for(var i = 0; i < array_length(hand); i++) {
		makeCardAvailable(array_get(hand,i));
		var card = array_get(hand,i);
		card.x = 68+i*19;
		card.y = 116;
	}
	
	var angle = random_range(0,359);
	for(var i = 0; i < oCardControl.coinmax; i++) {
		var centerx = 96;
		var centery = 157;
		var len = random_range(2,6);
		
		instance_create_layer(
			centerx+floor(lengthdir_x(len,angle)),
			centery+floor(lengthdir_y(len,angle)),"Cards",
		oCoin);
		angle += random_range(100,140);
	}
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
			var check = checkOption(cost, selected);
			
			selectCardAttack(curoptionselect, enemychoose)
		
			optionPay(cost,selected);
					
			if(enemy.curhp<=0) {
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
	var options = getCardPowers(curoptionselect.index);
	for(var i = 0; i < array_length(options); i++) {
		if(!global.chooseenemystate&&!global.enemyturn) {
			var cost = getOptionCost(array_get(options,i));
			var selected = getSelected(oCard, oCoin);
			var check = checkOption(cost, selected);
			
			var col = point_in_rectangle(mouse_x,mouse_y,originx,originy+i*10,originx+30,originy+i*10+9);
			
			if(check) {
				if(col) {//&&global.hoverid == noone
					if(global.mousedown) {
						if(array_get(options,i)==1) {
							global.chooseenemystate = true;
						}
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
			playerhealth -= oEnemy.dmg;
			if(playerhealth<=0) {
				global.won = -1;
			}
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
				enemyturnsequence = getEnemySequence(enemyturnsequence);
				enemycounter = array_get(enemyturnsequence,0);
				
				if(selectedattack!=noone) {
					var dmginfo = getCardDmgInfo(selectedattack.index);
					enemy.curhp -= dmginfo[0];
			
					discardCard(selectedattack);
					selectedattack = noone;
				}
				
				enemy.attacker = noone;
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