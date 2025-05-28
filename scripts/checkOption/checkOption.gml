function checkOption(cost, selected){
	var cardneed = cost[0];
	var coinneed = cost[1];
	
	var cardhave = array_length(selected[0]);
	var coinhave = array_length(selected[1]);
	
	return (cardhave>=cardneed&&coinhave>=coinneed);
}