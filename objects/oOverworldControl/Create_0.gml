//setup
spotlist = array_create(0);

startx = room_width/2;
starty = room_height-192; //1920

global.camx = startx;
global.camy = starty-96;

var spacedis = 96;
var spotsepdis = 96;
var treesepdis = 24;

var endx = 0;
var endy = 0;

var curx = startx;
var cury = starty-spacedis;

var spot = instance_create_depth(curx,cury+spacedis,0,oSpot);
spot.level = 1;
global.curspot = spot;

array_push(spotlist,array_create(1,spot));

global.maxlevel = floor(room_height/spacedis)-2

for(var curlevel = 2; curlevel < floor(room_height/spacedis)-1; curlevel++) {
	var rep = irandom_range(1,3);
	
	if(curlevel==floor(room_height/spacedis)-2)
		rep = 1;
	var curspots = array_create(0);
	
	for(var i = 0; i < rep; i++) {
		spot = instance_create_layer(irandom_range(-16,16)+curx+spotsepdis*min(rep-1,1)-(6-rep)*(i/rep)*spotsepdis,cury,"Path",oSpot);
		spot.level = curlevel;
		
		var swap = irandom_range(0,5)==0
		var specialtype = irandom_range(2,7)
		
		if(curlevel==global.maxlevel) {
			spot.type = 0;
		} else
			if((curlevel-1<3||curlevel mod 3 == 0)) {
				if(swap)
					spot.type = 1;
				else
					spot.type = specialtype;
			} else {
				if(swap)
					spot.type = specialtype;
				else
					spot.type = 1;
			}
		
		array_push(curspots,spot);
	}
	
	array_push(spotlist,curspots);
	
	
	cury-=spacedis;
}
array_push(spotlist,array_create(1,spot));

//environment spawning
var step = 32;
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		var __x = _x+random_range(-12,12)
		var __y = _y+random_range(-12,12)
		var tree = instance_create_layer(__x,__y,"Path",oTree);
		instance_create_layer(__x,__y,"TreeFloor",oTreeFloor);
		tree.image_index = irandom_range(0,3)==0 ? 1 : 0;
	}
}

var numw = 3;
step = room_width/numw
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		var __x = _x+random_range(-(step/2-16),step/2-16)
		var __y = _y+random_range(-(step/2-16),step/2-16)
		var rock = instance_create_layer(__x,__y,"Tree",oRock);
		rock.image_index = irandom_range(0,1);
	}
}

numw = 4;
step = room_width/numw
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		var __x = _x+random_range(-(step/2-16),step/2-16)
		var __y = _y+random_range(-(step/2-16),step/2-16)
		var rock = instance_create_layer(__x,__y,"Tree",oTrunk);
		rock.image_index = irandom_range(0,1);
	}
}

numw = 5;
step = room_width/numw
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		if(irandom_range(0,3)!=0) {
			var __x = _x+random_range(-(step/2),step/2)
			var __y = _y+random_range(-(step/2),step/2)
			var rock = instance_create_layer(__x,__y,"TreeFloor",oGrass);
			rock.image_index = irandom_range(0,1);
		}
	}
}

numw = 30;
step = room_width/numw
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		if(irandom_range(0,3)!=0) {
			var __x = _x+random_range(-(step/2),step/2)
			var __y = _y+random_range(-(step/2),step/2)
			var rock = instance_create_layer(__x,__y,"Tree",oFlora);
			rock.image_index = irandom_range(0,3);
		}
	}
}

for(var i = 0; i < array_length(spotlist)-1; i++) {
	var coveredspots = array_create(array_length(array_get(spotlist,i+1)),false);
	//array_copy(coveredspots,0,array_get(spotlist,i+1),0,array_length(array_get(spotlist,i+1)))
	
	for(var j = 0; j < array_length(array_get(spotlist,i));j++) {
		var curspot = array_get(array_get(spotlist,i),j);
		var reps = irandom_range(1,2)
		repeat(reps) {
			var index = irandom_range(0,array_length(coveredspots)-1);
			
			var nextspot = array_get(array_get(spotlist,i+1),index)
			
			array_push(nextspot.spotfrom,curspot)
			array_push(curspot.spotto,nextspot)
			
			createPath(curspot,nextspot)
			
			array_set(coveredspots,index,true);
		}
		
		while(j==array_length(array_get(spotlist,i))-1&&array_contains(coveredspots,false)) {
			var index = array_get_index(coveredspots,false);
			
			var nextspot = array_get(array_get(spotlist,i+1),index)
			
			array_push(nextspot.spotfrom,curspot)
			array_push(curspot.spotto,nextspot)
			
			createPath(curspot,nextspot)
			
			array_set(coveredspots,index,true);
		}
	}
}

var colinst = ds_list_create();
collision_rectangle_list(curx-20,-128,curx+20,cury+spacedis,oTree,false,true,colinst,false);
while(ds_list_size(colinst)>0) {
	instance_destroy(colinst[| 0]);
	ds_list_delete(colinst,0);
}

collision_rectangle_list(curx-20,-128,curx+20,cury+spacedis,oTreeFloor,false,true,colinst,false);
while(ds_list_size(colinst)>0) {
	instance_destroy(colinst[| 0]);
	ds_list_delete(colinst,0);
}


//vars
choosecards = array_create(0);
selectcards = array_create(0);
trashselect = array_create(0);
startaction = true;

pixelDims = shader_get_uniform(shWhiteOutline,"texture_Pixel")