function getSelected(card, coin){
	var cardarray = array_create(0);
	var coinarray = array_create(0);
	
	with(card) {
		if(state == cardstates.selected) {
			array_push(cardarray, self)
		}
	}
	
	with(coin) {
		if(state == coinstates.selected) {
			array_push(coinarray, self);
		}
	}
	
	return [cardarray,coinarray];
}