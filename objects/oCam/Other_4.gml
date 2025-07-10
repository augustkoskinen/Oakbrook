if(room==rmTutorial) {
	persistent = false;
	
	camera_set_view_pos(
		view_camera[0],
		0,0
	);
} else {
	persistent = true;

	global.CamW = camera_get_view_width(view_camera[0]);
	global.CamH = camera_get_view_height(view_camera[0]);

	camera_set_view_pos(
		view_camera[0],
		global.camx - (global.CamW / 2),
		global.camy - (global.CamH / 2)-96*(global.level-1)
	);
	
	//camera_set_view_size(view_camera[0],global.CamOverworldH,global.CamOverworldH);
}