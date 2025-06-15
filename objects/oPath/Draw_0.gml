if(sourcex!=-1) {
	checked = true;
	
	var dist = point_distance(sourcex,sourcey,targetx,targety);
	var dir = point_direction(sourcex,sourcey,targetx,targety);
	
	var seperation = 18;
	
	var curx = sourcex + lengthdir_x(seperation,dir);
	var cury = sourcey + lengthdir_y(seperation,dir);
	
	var step = 5;
	
	//depth = -cury+15;
	for(var i = seperation; i < dist-seperation; i+=step) {
		draw_sprite_ext(sPath,0,curx,cury,1,1,dir,c_white,1.0);
		
		curx += lengthdir_x(step,dir);
		cury += lengthdir_y(step,dir);
	}
}