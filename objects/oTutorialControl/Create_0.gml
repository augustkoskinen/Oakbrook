global.achievements = array_create(0);

textarray = [
	{
		text: "Welcome to the tutorial for Oakbrook! In this game, you use cards to deal damage or do actions, and you use coins to activate their abilities. Your goal is to beat the enemy of each level and keep your run going until you win.",
		achievement: "welcome"
	},
	{
		text: "First, right click the card drawn, left click a coin, and select the \"attack\" option.",
		achievement: "draw card"
	},
	{
		text: "Now, select the enemy to attack! (Right now there's only one)",
		achievement: "attack card"
	},
	{
		text: "There's no more actions you can do, so click the rock to move onto the next turn.",
		achievement: "reset"
	},
	{
		text: "Because you selected the enemy to attack, it takes damage now. The amount of health it loses is equal to the attacking card's value (for now at least).",
		achievement: "attack"
	},
	{
		text: "It's only fair that the enemy attacks too! You lose health equal to the enemy's damage number. If your health drops to or below 0, you lose your whole run.",
		achievement: "enemy attack"
	},
	{
		text: "Now it's a new round. Every new round, you draw three cards and three coins.",
		achievement: "new round"
	},
	{
		text: "That guy did a lot of damage. To reduce it, you can choose a shield, which reduces damage done to you by the number on its card. Right click the green card, left click a coin, and select the \"shield\" option in order to set it as a shield.",
		achievement: "shield"
	},
	{
		text: "Great! These cards don't look very good, so let's draw a new one. Right click the red card, left click two coins, and select the \"action\" option.",
		achievement: "action"
	},
	{
		text: "Look! You drew a new card and a coin. Each color card has a different ability. The blue cards cost two cards and restore your health by one, the green cards cost a card and give you an extra coin, and the purple cards cost a coin and a card and give you +1 damage on your next attack. All of these abilities are described above the card options if you forget.",
		achievement: "allactions"
	},
	{
		text: "The purple card costs too much to do anything with, so just select the blue card and attack.",
		achievement: "attack card 2"
	},
	{
		text: "The blue card did extra damage against this guy! Each of the colors does either one more or less (but not less than 0) damage against an enemy of the other type. Blue beats red, which beats purple, which beats green, which beats blue. By reversing that order, you get the types that do less damage; for example, red attacking blue does -1 damage.",
		achievement: "extra damage"
	},
	{
		text: "Your shield blocked one damage, but because the enemy attacks with type blue, which is weak to green, you actually blocked two damage, so your health stays the same!",
		achievement: "extra block"
	},
	{
		text: "Uh oh! It looks like you don't have any more cards to draw. Click the discard pile to forfeit your turn and redraw cards into your deck. This basically lets the enemy get a free hit on you, so try not to run out of cards too fast!",
		achievement: "redraw"
	},
	{
		text: "Finish off this enemy with another attack!",
		achievement: "final attack"
	},
	{
		text: "And that's the game! In adventure mode there are other parts that haven't been explained yet, but those have descriptions that come along with them. Happy playing!",
		achievement: ""
	}
]
setText(0);

function setText(textindex) {
	var text = instance_create_depth(16,16,-10000,oText);
	text.text = textarray[textindex].text;
	text.achievement = textarray[textindex].achievement;
	textindex++;

	global.curtext = text;
	//global.canTakeAction = false;
}