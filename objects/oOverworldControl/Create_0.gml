spotlist = array_create(0);

var spacedis = 96;
var spotsepdis = 96;
var treesepdis = 32;

var endx = 0;
var endy = 0;

var curx = oGameControl.startx;
var cury = oGameControl.starty-spacedis;

var spot = instance_create_depth(curx,cury+spacedis,0,oSpot);
spot.level = 1;
global.curspot = spot;

array_push(spotlist,array_create(1,spot));

for(var curlevel = 2; curlevel < floor(room_height/spacedis)-1; curlevel++) {
	var rep = irandom_range(1,3);
	
	if(curlevel==floor(room_height/spacedis)-2)
		rep = 1;
	var curspots = array_create(0);
	
	for(var i = 0; i < rep; i++) {
		spot = instance_create_layer(irandom_range(-16,16)+curx+spotsepdis*min(rep-1,1)-(6-rep)*(i/rep)*spotsepdis,cury,"Path",oSpot);
		spot.level = curlevel;
		
		var swap = irandom_range(0,5)==0
		
		if((curlevel-1<3||curlevel mod 3 == 0)) {
			if(swap)
				spot.type = 1;
			else
				spot.type = 2;
		} else {
			if(swap)
				spot.type = 2;
			else
				spot.type = 1;
		}
		
		array_push(curspots,spot);
	}
	
	array_push(spotlist,curspots);
	
	
	cury-=spacedis;
}
array_push(spotlist,array_create(1,spot));

//tree spawning
var step = 32;
for(var _x = 0; _x < room_width; _x+=step) {
	for(var _y = 0; _y < room_height; _y+=step) {
		instance_create_depth(_x+random_range(-12,12),_y+random_range(-12,12),0,oTree);
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
collision_rectangle_list(curx-20,0,curx+20,cury+spacedis,oTree,false,true,colinst,false);
while(ds_list_size(colinst)>0) {
	instance_destroy(colinst[| 0]);
	ds_list_delete(colinst,0);
}

/*
rep = irandom_range(5,15);
for(var i = 0; i < rep; i++) {
		
	var choosex = 0;
	var choosey = random_range(cury-spacedis/2,cury+spacedis/2)
		
	var repeatbool = true;
	var repeatcount = 100;
	while(repeatbool&&repeatcount>0) {
		choosex = random_range(curx-spotsepdis-64,curx+spotsepdis+64);
			
		repeatbool = false;
		for(var j = 0; j < array_length(curspots);j++) {
			if(abs(array_get(curspots,j).x-choosex)<treesepdis)
				repeatbool = true;
		}
		repeatcount--;
	}
		
	instance_create_depth(choosex,choosey,0,oTree);
}
*/
