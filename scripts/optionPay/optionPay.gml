function optionPay(cost, selected){
	var cardneed = cost[0];
	var coinneed = cost[1];
	
	for(var i = 0; i < cardneed; i++) {
		discardCard(array_get(selected[0],i))
	}
	
	for(var i = 0; i < coinneed; i++) {
		discardCoin(array_get(selected[1],i))
	}
}