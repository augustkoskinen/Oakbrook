global.camx = camera_get_view_width(view_camera[0])/2;
global.camy = camera_get_view_height(view_camera[0])/2;

deck = array_create(0);
hand = array_create(0);
discard = array_create(0);

coins = array_create(0);

global.chooseenemystate = false;
global.enemyturn = false;
curoptionselect = noone;
selectedattack = noone;
selectedshield = noone;
attackboosted = false;

pixelDims = shader_get_uniform(shWhiteOutline,"texture_Pixel")

global.playerturn = true;
enemyturnsequence = array_create(0);
enemycounter = 0;

global.depthcount = -1;
global.lastdiscardangle = random_range(0,359)

enemyarray = array_create(0);

var enemy =  instance_create_layer(87-16,40-24,"Cards",oEnemy)

if(room!=rmTutorial) {
	enemy.type = 1;
	var enemystats = getEnemyStat(global.level);
	enemy.hp = enemystats[0];
	enemy.curhp = enemystats[0];
	enemy.hptype = enemystats[1];
	enemy.dmg = enemystats[2];
	enemy.dmgtype = enemystats[3];
} else {
	enemy.type = 1;
	enemy.hp = 3;
	enemy.curhp = 3;
	enemy.hptype = 1;
	enemy.dmg = 1;
	enemy.dmgtype = 0;
}

array_push(enemyarray, enemy)