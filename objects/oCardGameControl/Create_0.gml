centerx = 192/2
centery = 192/2

deck = array_create(0);
hand = array_create(0);
discard = array_create(0);

coins = array_create(0);

global.chooseenemystate = false;
curoptionselect = noone;
selectedattack = noone;

pixelDims = shader_get_uniform(shWhiteOutline,"texture_Pixel")

enemy = instance_create_layer(87,40,"Cards",oEnemy)
enemy.type = 1;
var enemystats = getEnemyStat(enemy.type);
enemy.hp = enemystats[0];
enemy.curhp = enemystats[0];
enemy.hptype = enemystats[1];
enemy.dmg = enemystats[2];
enemy.dmgtype = enemystats[3];

global.playerturn = true;
enemyturnsequence = [];
enemycounter = 0;

global.won = false;
global.startGame = true;
global.mousedown = false;
global.mouserightdown = false;
global.depthcount = -1;
global.hoverid = noone;
global.lastdiscardangle = random_range(0,359)