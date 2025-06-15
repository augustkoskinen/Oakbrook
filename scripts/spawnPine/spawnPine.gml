// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnPine(xmin, xmax, ymin, ymax){
	instance_create_depth(
		irandom_range(
			xmin,xmax
		),
		irandom_range(
			ymin,ymax
		)
	,-10000,oPine);
}