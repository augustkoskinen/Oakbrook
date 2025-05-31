function discardCoin(coin){
	coin.state = coinstates.discarded;
		
	var len = random_range(1,4)*(irandom_range(0,1)==0?1:-1);
		
	coin.x = 31-16+lengthdir_x(len,global.lastdiscardangle);
	coin.y = 156-24+lengthdir_y(len,global.lastdiscardangle);
		
	global.lastdiscardangle += random_range(30,60)
}

function resetCoins(num) {
	instance_destroy(oCoin)
	drawCoin(num);
	/*
	while(instance_number(oCoin)>0) {
		
	}
	
	while(instance_number(oCoin)>num) {
		instance
	}*/
}

function selectCoin(coin){
	coin.state = coinstates.selected;
	
	depth = global.depthcount
	global.depthcount--;
}

function makeCoinAvailable(coin){
	coin.state = coinstates.available;
}

function drawCoin(num) {
	var angle = random_range(0,359);
	for(var i = 0; i < num; i++) {
		var centerx = 96-16;
		var centery = 157-24;
		var len = random_range(2,6);
		
		instance_create_layer(
			centerx+floor(lengthdir_x(len,angle)),
			centery+floor(lengthdir_y(len,angle)),"Cards",
		oCoin);
		
		angle += random_range(100,140);
	}
}