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
			//global.camx = oCam.CamW/2;
			//global.camy = oCam.CamH/2;
			//global.startGame = true;
			//room_goto(rmCardMat)
			break;
		}
		case 2 : {
			
			break;
		}
	}
}
show_debug_message("here")