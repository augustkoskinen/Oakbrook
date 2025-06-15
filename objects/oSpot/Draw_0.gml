depth = -y;

if(global.curspot==self.id)
	image_index = 0;
else {
	var cancome = false;
	
	for(var i = 0; i < array_length(spotfrom); i++) {
		if(array_get(spotfrom,i)==global.curspot)
			cancome = true;
	}
	
	if(cancome&&level==global.level+1) {
		if(collision_point(mouse_x,mouse_y,self,false,false)&&global.overworldaction==-1) {
			depth = -y-1000;
			image_index = 1;
			if(global.mousedown) {
				global.level++;
				global.camy -= 96;
				global.curspot = self.id;
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

if(global.curspot==self.id)
	draw_sprite(sPlayer,0,x,y);