if(!global.loadGame) {
	global.cards = array_create(0)
	global.vessels = 0;
	global.idols = 0;
	global.coinmax = 3;
	global.handmax = 3;
	global.playermaxhealth = 6;
	global.playerhealth = 6;
}
if(room==rmTutorial) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 1;
	addcard.type = 0;
	array_push(global.cards,addcard)
	
	addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 1;
	addcard.type = 0;
	array_push(global.cards,addcard)
	
	addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 1;
	addcard.type = 2;
	array_push(global.cards,addcard)
	
	addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 1;
	addcard.type = 3;
	array_push(global.cards,addcard)
	
	addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 1;
	addcard.type = 1;
	array_push(global.cards,addcard)
	
} else {
	if(!global.loadGame) {
		for(var i = 0; i < 9; i++) {
			var addcard = instance_create_layer(0,0,"Cards",oCard)
			addcard.index = irandom_range(1,2);
			addcard.type = irandom_range(0,3);
			array_push(global.cards,addcard)
		}
	} else {
		global.loadGame = false;
	}
}