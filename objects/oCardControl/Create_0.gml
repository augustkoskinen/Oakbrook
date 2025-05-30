cards = array_create(0)
coinmax = 3;
handmax = 3;

for(var i = 0; i < 9; i++) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = irandom_range(1,2);
	addcard.type = irandom_range(0,3);
	array_push(cards,addcard)
}