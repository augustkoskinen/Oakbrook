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
		case 0 : {
			break;
		}
		case 1 : {
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
		case 2 : {
			
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