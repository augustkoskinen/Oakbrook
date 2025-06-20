textarray = [
	{
		text: "Welcome to the tutorial for Oakbrook! In this game, you use cards to deal damage or do actions, and you use coins to activate their abilities.",
		achievement: "welcome"
	},
]
textindex = 0;

var text = instance_create_depth(16,16,-10000,oText);
text.text = textarray[textindex].text;
text.achievement = textarray[textindex].achievement;
textindex++;

global.curtext = text;
global.canTakeAction = false;