function discardCoin(coin){
	array_push(oCardGameControl.discard,coin);
	array_delete(oCardGameControl.hand,array_get_index(oCardGameControl.hand,coin),1);
	
	coin.state = cardstates.discarded;
	coin.x = 42;
	coin.y = 138;
}

function selectCoin(coin){
	coin.state = cardstates.selected;
}

function makeCoinAvailable(coin){
	coin.state = cardstates.available;
}

function drawCoin(coin){
	
}