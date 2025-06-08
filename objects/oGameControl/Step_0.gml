if(global.startGame) {
	room_goto(rmOverworld);
	global.startGame = false;
} else if(global.restartGame) {
	room_goto(rmStartScreen);
	
	global.startGame = false;
	global.restartGame = false;

	global.mousedown = false;
	global.mouserightdown = false;

	global.level = 1;
	global.maxlevel = 2;
	global.actiontake = -1;
	global.won = 0;
	global.overworldaction = -1;

	global.immediatecamswitch = false;
	global.hoverid = noone;
}

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
			global.startCardGame = true;
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
	var ended = false;
	if(global.won==-1||(global.won==1&&global.level>=global.maxlevel)) {
		ended = true;
		instance_destroy(oCam);
		instance_destroy(oPath);
		instance_destroy(oSpot);
		instance_destroy(oTree);
		instance_destroy(oOverworldControl);
		instance_destroy(oCardControl);
		instance_destroy(oCard);
		instance_destroy(oCoin);
		if(global.won==1)
			room_goto(rmCredits)
		else
			room_goto(rmLost)
		
		global.immediatecamswitch = true;
	} else if(global.won==1) {
		room_goto(rmOverworld)
		
		global.immediatecamswitch = true;
	}
	
	with(oTree)
		visible = true;
	with(oPath)
		visible = true;
	with(oSpot)
		visible = true;
		
	global.won = 0;
}