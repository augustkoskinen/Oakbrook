function optionPay(cost, selected){
	var cardneed = cost[0];
	var coinneed = cost[1];
	
	for(var i = 0; i < cardneed; i++) {
		//show_debug_message("here")
		array_get(selected[0],i).state = cardstates.discarded;
		array_get(selected[0],i).x = 42;
		array_get(selected[0],i).y = 138;
	}
	
	for(var i = 0; i < coinneed; i++) {
		array_get(selected[1],i).state = coinstates.discarded;
		
		var len = random_range(1,4)*(irandom_range(0,1)==0?1:-1);
		
		array_get(selected[1],i).x = 31+lengthdir_x(len,global.lastdiscardangle);
		array_get(selected[1],i).y = 156+lengthdir_y(len,global.lastdiscardangle);
		
		global.lastdiscardangle += random_range(30,60)
	}
}