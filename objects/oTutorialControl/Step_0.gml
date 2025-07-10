//if(global.curtext == noone) {
if(!global.paused) {
	var trigger = false;
	
	switch(array_length(global.achievements)) {
		case 1: {
			if(global.chooseenemystate)
				trigger = true;
			break;
		}
		
		case 2: {
			if(oCardGameControlTutorial.selectedattack!=noone)
				trigger = true;
			break;
		}
		
		case 3: {
			if(array_length(oCardGameControlTutorial.enemyturnsequence)==3)
				trigger = true;
			break;
		}
		
		case 4: {
			if(oCardGameControlTutorial.actionpause&&array_length(oCardGameControlTutorial.enemyturnsequence)==2)
				trigger = true;
			break;
		}
		
		case 5: {
			if(!global.enemyturn)
				trigger = true;
			break;
		}
		case 7: {
			if(oCardGameControlTutorial.performedaction==2)
				trigger = true;
			break;
		}
		case 8: {
			if(oCardGameControlTutorial.performedaction==3)
				trigger = true;
			break;
		}
		case 10: {
			if(array_length(oCardGameControlTutorial.enemyturnsequence)==3)
				trigger = true;
			break;
		}
		case 11: {
			if(oCardGameControlTutorial.actionpause&&array_length(oCardGameControlTutorial.enemyturnsequence)==2)
				trigger = true;
			break;
		}
		case 12: {
			if(!global.enemyturn)
				trigger = true;
			break;
		}
		case 13: {
			if(!global.enemyturn&&oCardGameControlTutorial.redrewcards)
				trigger = true;
			break;
		}
		case 14: {
			if(global.won==1)
				trigger = true;
			break;
		}
		case 15: {
			if(global.mousedown) {
				oCardGameControlTutorial.canwingame = true;
				global.mousedown = false;
			}
			break;
		}
		
		default : {
			if(global.mousedown) {
				trigger = true;
				global.mousedown = false;
			}
			break;
		}
	}
	
	if(trigger) {
		if(array_length(global.achievements)!=1) {
			resetAllCardsAndCoins();
			global.hoverid=noone;
			oCardGameControlTutorial.curoptionselect = noone;
		}
		global.curtext.destroyText();
		setText(array_length(global.achievements));
	}
}
//}