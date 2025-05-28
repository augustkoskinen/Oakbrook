cards = array_create(0)
coinmax = 3;

for(var i = 0; i < 10; i++) {
	var addcard = instance_create_layer(0,0,"Cards",oCard)
	addcard.index = i+1;
	array_push(cards,addcard)
}