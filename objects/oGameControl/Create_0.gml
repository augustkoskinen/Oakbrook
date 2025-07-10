application_surface_draw_enable(false);
lightSurface = surface_create(window_get_width(),window_get_height())

global.trigger = false;
global.paused = false;
global.canTakeAction = true;
global.targetroom = rmStartScreen;
global.startGame = false;
global.loadGame = false;
global.startCardGame = true;
global.startTutorial = false;
global.restartGame = false;

global.mousedown = false;
global.mouserightdown = false;

global.seed = -1;
global.level = 1;
global.maxlevel = 2;
global.actiontake = -1;
global.won = 0;
global.overworldaction = -1;

global.immediatecamswitch = false;
global.hoverid = noone;
global.curspotid = noone;

global.CamOverworldW = 320;
global.CamOverworldH = 320;
global.CamW = 320;
global.CamH = 320;
global.camx = 0;
global.camy = 0;
global.curspot = -1;
global.prevspot = -1;

screentime = 0;

room_goto(rmStartScreen);

global.gameData = {
	level : global.level,
	seed : global.seed,
	cards : [],
	vessels : -1,
	idols : -1,
	coinmax : -1,
	handmax : -1,
	playermaxhealth : -1,
	playerhealth : -1,
	roomdata : {}
}