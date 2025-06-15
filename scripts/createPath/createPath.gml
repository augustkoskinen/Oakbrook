function createPath(curspot,nextspot){
	var path = instance_create_layer(0,0,"LinePath",oPath);
	
	path.sourcex = curspot.x;
	path.sourcey = curspot.y;
	path.targetx = nextspot.x;
	path.targety = nextspot.y;
	
	var colinst = ds_list_create();
	collision_line_list(curspot.x, curspot.y, nextspot.x, nextspot.y,oEnvironmentPar,false,true,colinst,false);
	while(ds_list_size(colinst)>0) {
		instance_destroy(colinst[| 0]);
		ds_list_delete(colinst,0);
	}
	
	collision_circle_list(curspot.x,curspot.y,20,oEnvironmentPar,false,true,colinst,false);
	while(ds_list_size(colinst)>0) {
		instance_destroy(colinst[| 0]);
		ds_list_delete(colinst,0);
	}
	
	collision_circle_list(nextspot.x,nextspot.y,20,oEnvironmentPar,false,true,colinst,false);
	while(ds_list_size(colinst)>0) {
		instance_destroy(colinst[| 0]);
		ds_list_delete(colinst,0);
	}
}