randomize();

global.targetroom = rmStartScreen;
global.startGame = false;
global.startTutorial = false;
global.restartGame = false;

global.mousedown = false;
global.mouserightdown = false;

global.level = 1;
global.maxlevel = 2;
global.actiontake = -1;
global.won = 0;
global.overworldaction = -1;

global.immediatecamswitch = false;
global.hoverid = noone;

room_goto(rmStartScreen);