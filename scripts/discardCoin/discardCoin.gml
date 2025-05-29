function discardCoin(coin){
	coin.state = coinstates.discarded;
		
	var len = random_range(1,4)*(irandom_range(0,1)==0?1:-1);
		
	coin.x = 31+lengthdir_x(len,global.lastdiscardangle);
	coin.y = 156+lengthdir_y(len,global.lastdiscardangle);
		
	global.lastdiscardangle += random_range(30,60)
}

function selectCoin(coin){
	coin.state = coinstates.selected;
	
	depth = global.depthcount
	global.depthcount--;
}

function makeCoinAvailable(coin){
	coin.state = coinstates.available;
}

function drawCoin(coin){
	
}