if(global.startGame) {
	room_goto(rmOverworld);
	global.targetroom = rmOverworld;
	global.startGame = false;
} else if(global.startTutorial) {
	global.hoverid = noone;
	global.startCardGame = true;
	room_goto(rmTutorial);
	
	global.targetroom = rmTutorial;
	global.immediatecamswitch = true;
	global.startTutorial = false;
	
} else if(global.restartGame) {
	room_goto(rmStartScreen);
	global.targetroom = rmStartScreen;
	
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
	if(room==rmCardMat||room==rmTutorial)
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
			global.targetroom = rmCardMat;
			with(oEnvironmentPar)
				visible = false;
			
			with(oSpot)
				visible = false;
				
			with(oPath)
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
		instance_destroy(oEnvironmentPar);
		instance_destroy(oOverworldControl);
		instance_destroy(oCardControl);
		instance_destroy(oCard);
		instance_destroy(oCoin);
		if(global.won==1) {
			room_goto(rmCredits)
			global.targetroom = rmCredits;
		} else {
			room_goto(rmLost)
			global.targetroom = rmLost;
		}
		
		global.immediatecamswitch = true;
	} else if(global.won==1) {
		if(room == rmTutorial) {
			room_goto(rmStartScreen)
			instance_destroy(oCam);
			instance_destroy(oCardControl);
		
			global.targetroom = rmStartScreen;
			global.immediatecamswitch = true;
		} else {
			oCardGameControl.selectedattack = noone;
			oCardGameControl.selectedshield = noone;
			room_goto(rmOverworld)
			
			global.targetroom = rmOverworld;
			global.immediatecamswitch = true;
		}
	}
	
	with(oEnvironmentPar)
		visible = true;
		
	with(oSpot)
		visible = true;
	
	with(oPath)
		visible = true;
	
	global.won = 0;
}

depth = 0;
switch(room) {
	case rmStartScreen : {
		draw_sprite_ext(sScreenStart,floor(screentime),0,0,4,4,0,c_white,1);
		break;
	}
	case rmLost : {
		draw_sprite_ext(sScreenDied,0,0,0,4,4,0,c_white,1);
		break;
	}
	case rmCredits : {
		draw_sprite_ext(sScreenCredit,floor(screentime),0,0,4,4,0,c_white,1);
		break;
	}
}

screentime += delta_time/1000000;