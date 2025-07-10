depth = -y;

if(global.curspot==spotid) {
	image_index = 0;
	global.curspotid = self.id;
} else {
	var cancome = false;
	for(var i = 0; i < array_length(spotfrom); i++) {
		if(array_get(spotfrom,i).spotid==global.curspot)
			cancome = true;
	}
	
	if(cancome&&level==global.level+1) {
		if(collision_point(mouse_x,mouse_y,self,false,false)&&global.overworldaction==-1&&!global.paused) {
			depth = -y-1000;
			image_index = 1;
			if(global.mousedown) {
				global.level++;
				global.camy -= 96;
				global.prevspot = global.curspot;
				global.curspot = spotid;
				global.curspotid = self.id;
				if(type==0)
					global.actiontake = 1;
				else
					global.actiontake = type;
			}
		} else {
			image_index = 0;
		}
	} else {
		image_index = 2;
	}
}

draw_sprite(sMapSpot,image_index,x,y);

if(array_length(spotfrom)>0)
	draw_sprite(sSpotType,type,x,y);

if(global.curspot==spotid)
	draw_sprite(sPlayer,0,x,y);