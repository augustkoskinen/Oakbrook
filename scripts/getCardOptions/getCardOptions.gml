function getCardOptions(index,type) {
	//0 = 
	//1 = attack
	var retarray = array_create(0);
	
	
	if(index >= 1 &&index <= 15) {
		array_push(retarray,1)
		array_push(retarray,2)
		switch(type) {
			case 0: {
				array_push(retarray,3)
				break;
			}
			case 1: {
				array_push(retarray,4)
				break;
			}
			case 2: {
				array_push(retarray,5)
				break;
			}
			case 3: {
				array_push(retarray,6)
				break;
			}
		}
	}
	
	switch(index) {
		case (61) : {
			break;
		}
	}
	
	return retarray;
}