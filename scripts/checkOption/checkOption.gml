function checkOption(index, cost, selected){
	var cardneed = cost[0];
	var coinneed = cost[1];
	
	var cardhave = array_length(selected[0]);
	var coinhave = array_length(selected[1]);
	
	var resourcereqs = (cardhave>=cardneed&&coinhave>=coinneed);
	
	var arenocardsindeck = (array_length(oCardGameControl.deck)<=0&&(index==3||index==7))
	var boost = !(oCardGameControl.attackboosted&&index==6);
	
	return !arenocardsindeck&&boost&&resourcereqs;
}

function performOption(index, card, hand, deck) {
	var cost = getOptionCost(index);
	var selected = getSelected(oCard, oCoin);
			
	switch(index) {
		case 1: {
			global.chooseenemystate = true;
			
			break;
		}
		
		case 2: {
			selectCardShield(card);
			resetAllCardsAndCoins();
			
			break;
		}
		
		case 3: {
			drawCard(array_get(deck,0),hand,deck);
			drawCoin(1);
			
			break;
		}
		
		case 4: {
			oCardGameControl.playerhealth+=1;
			break;
		}
		
		case 5: {
			drawCoin(1);
			
			break;
		}
		
		case 6: {
			oCardGameControl.attackboosted=true;
			
			break;
		}
		case 7: {
			drawCard(array_get(deck,0),hand,deck);
			
			break;
		}
		case 8: {
			drawCoin(1);
			
			break;
		}
	}
	
	if(index!=1&&index!=2) {
		optionPay(cost,selected);
		discardCard(card,hand,oCardGameControl.discard);
		resetAllCardsAndCoins();
	}
}