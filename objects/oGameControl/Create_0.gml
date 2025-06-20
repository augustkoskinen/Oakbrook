randomize();

application_surface_draw_enable(false);
lightSurface = surface_create(window_get_width(),window_get_height())

global.paused = false;
global.canTakeAction = true;
global.achievements = array_create(0);
global.targetroom = rmStartScreen;
global.startGame = false;
global.startCardGame = true;
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

global.CamOverworldW = 320;
global.CamOverworldH = 320;
global.CamW = 320;
global.CamH = 320;
global.camx = 0;
global.camy = 0;

screentime = 0;

room_goto(rmStartScreen);