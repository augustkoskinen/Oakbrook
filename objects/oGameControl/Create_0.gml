randomize();

application_surface_draw_enable(false);
lightSurface = surface_create(window_get_width(),window_get_height())

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

global.CamW = 320;
global.CamH = 320;

screentime = 0;

room_goto(rmStartScreen);