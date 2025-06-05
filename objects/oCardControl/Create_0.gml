cards = array_create(0)
vessels = 0;
idols = 0;
coinmax = 3;
handmax = 3;
playermaxhealth = 6;
global.playerhealth = 6;

for(var i = 0; i < 9; i++) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = irandom_range(1,2);
	addcard.type = irandom_range(0,3);
	array_push(cards,addcard)
}

/*
for(var i = 0; i < 4; i++) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 16
	addcard.type = irandom_range(0,3);
	array_push(cards,addcard)
}
for(var i = 0; i < 4; i++) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = 17
	addcard.type = irandom_range(0,3);
	array_push(cards,addcard)
}*/