function getOptionCost(type){
	var retarray = [0,0] // card, coin
	switch(type) {
		case 0 : {
			
			break;
		}
		case 1 : {
			retarray[1] = 1;
			break;
		}
		case 2 : {
			retarray[1] = 1;
			break;
		}
		case 3 : {
			retarray[1] = 2;
			break;
		}
		case 4 : {
			retarray[0] = 2;
			break;
		}
		case 5 : {
			retarray[0] = 1;
			break;
		}
		case 6 : {
			retarray[0] = 1;
			retarray[1] = 1;
			break;
		}
		case 7 : {
			break;
		}
		case 8 : {
			break;
		}
	}
	
	return retarray;
}