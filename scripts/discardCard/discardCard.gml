function discardAll(doDamage) {
	oCardGameControl.enemyturnsequence = getEnemySequence(oCardGameControl.enemyturnsequence);
	oCardGameControl.enemycounter = array_get(oCardGameControl.enemyturnsequence,0);
	
	if(doDamage&&oCardGameControl.selectedattack!=noone) {
		var dmginfo = getCardDmgInfo(oCardGameControl.selectedattack.index);
		array_get(oCardGameControl.enemyarray, 0).curhp -= dmginfo[0];
		if((array_get(oCardGameControl.enemyarray, 0).hptype==0&&oCardGameControl.selectedattack.type==1)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==1&&oCardGameControl.selectedattack.type==2)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==2&&oCardGameControl.selectedattack.type==3)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==3&&oCardGameControl.selectedattack.type==0)) {
			array_get(oCardGameControl.enemyarray, 0).curhp--;
		} else if(dmginfo[0]>0&&((array_get(oCardGameControl.enemyarray, 0).type==1&&oCardGameControl.selectedattack.type==0)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==2&&oCardGameControl.selectedattack.type==1)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==3&&oCardGameControl.selectedattack.type==2)||
			(array_get(oCardGameControl.enemyarray, 0).hptype==0&&oCardGameControl.selectedattack.type==3))) {
			array_get(oCardGameControl.enemyarray, 0).curhp++;
		}
					
		discardCard(oCardGameControl.selectedattack.id,oCardGameControl.selectedattack,oCardGameControl.discard)
		oCardGameControl.selectedattack = noone;
	}

	while(0 != array_length(oCardGameControl.hand)) {
		var card = array_get(oCardGameControl.hand,0);
		discardCard(array_get(oCardGameControl.hand,0).id,oCardGameControl.hand,oCardGameControl.discard);
		//show_debug_message(card.state)
	}
				
	with(oCoin) {
		discardCoin(self);
	}
				
	resetAllCardsAndCoins();
	array_get(oCardGameControl.enemyarray, 0).attacker = noone;
}

function discardCard(card, hand, discard){
	array_push(discard,card);
	
	if(is_array(hand)) {
		array_delete(hand,array_get_index(hand,card.id),1);
	} else {
		hand = noone;
	}

	card.state = cardstates.discarded;
}

function moveDiscardToDeck(deck, discard) {
	while(array_length(discard)!=0) {
		array_push(deck, array_get(discard,0));
		array_get(discard,0).state = cardstates.indeck
		array_delete(discard,0,1)
	}
	
	array_shuffle(deck);
}

function resetAllCardsAndCoins() {
	show_debug_message("=======")
	show_debug_message(state)
	with(oCard) {
		if(state!=cardstates.discarded
			&&state!=cardstates.indeck
			&&state!=cardstates.selectedattack
			&&state!=cardstates.selectedshield) {
			makeCardAvailable(self);
			show_debug_message(state)
		}
		if(state!=cardstates.indeck)
			show_debug_message(state)
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
	array_delete(oCardGameControl.hand,array_get_index(oCardGameControl.hand,card.id),1);
	
	card.holdx = enemychoose.x;
	card.state = cardstates.selectedattack;
}

function selectCardShield(card){
	if(oCardGameControl.selectedshield!=noone) {
		discardCard(oCardGameControl.selectedshield,oCardGameControl.selectedshield,oCardGameControl.discard);
	}
	
	array_delete(oCardGameControl.hand,array_get_index(oCardGameControl.hand,card.id),1);
	
	oCardGameControl.selectedshield = card;
	card.state = cardstates.selectedshield;	
}

function drawCard(card, hand, deck){
	if(array_length(deck)>0) {
		array_push(hand,card);
		array_delete(deck,0,1);
		
		makeCardAvailable(card);
		card.holdx = 68+(array_length(hand)-1)*19;
	}
}