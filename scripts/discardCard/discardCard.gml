function discardCard(card){
	array_push(oCardGameControl.discard,card);
	array_delete(oCardGameControl.hand,array_get_index(oCardGameControl.hand,card),1);
	
	card.state = cardstates.discarded;
	card.x = 42;
	card.y = 138;
}

function resetAllCardsAndCoins() {
	with(oCard) {
		if(state!=cardstates.discarded
			&&state!=cardstates.indeck
			&&state!=cardstates.selectedattack
			&&state!=cardstates.selectedshield) {
			makeCardAvailable(self);
		}
	}
	
	with(oCoin) {
		if(state!=coinstates.discarded) {
			makeCardAvailable(self);
		}
	}
	
	oCardGameControl.curoptionselect = noone;
}

function selectCard(card){
	card.state = cardstates.selected;
	
	depth = global.depthcount
	global.depthcount--;
}

function selectOptionCard(card){
	card.state = cardstates.selectedoption;
	oCardGameControl.curoptionselect = card;
}

function makeCardAvailable(card){
	card.state = cardstates.available;
}

function selectCardAttack(card, enemychoose){
	card.x = enemychoose.x;
	card.y = 75;
	card.state = cardstates.selectedattack;
}

function selectCardShield(card){
	
}

function drawCard(card){
	
}