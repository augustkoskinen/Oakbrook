if(global.mousedown||global.mouserightdown) {
	if(room==rmCardMat)
		resetAllCardsAndCoins();
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

if(global.actiontake!=-1) {
	switch(global.actiontake) {
		case 1 : { //attack
			global.hoverid = noone;
			global.startGame = true;
			room_goto(rmCardMat)
			
			with(oTree)
				visible = false;
			with(oPath)
				visible = false;
			with(oSpot)
				visible = false;

			global.immediatecamswitch = true;
			break;
		}
		case 2 : { //hp up
			global.overworldaction = 4;
			break;
		}
		case 3: { //choose card
			global.overworldaction = 1;
			break;
		}
		case 4: { //choose object
			global.overworldaction = 2;
			break;
		}
		case 5: { //swap card
			global.overworldaction = 3;
			break;
		}
		case 6: { //combine object
			global.overworldaction = 5;
			break;
		}
		case 7: { //max hp up
			global.overworldaction = 6;
			break;
		}
	}
		
	global.actiontake = -1;
}

if(global.won!=0) {
	switch(global.won) {
		case -1 : {
			room_goto(rmOverworld)
			
			global.immediatecamswitch = true;
			break;
		}
		case 1 : {
			room_goto(rmOverworld)
			
			global.immediatecamswitch = true;
			break;
		}
	}
	
	with(oTree)
		visible = true;
	with(oPath)
		visible = true;
	with(oSpot)
		visible = true;
		
	global.won = 0;
}