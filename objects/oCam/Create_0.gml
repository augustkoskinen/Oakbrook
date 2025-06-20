if(room==rmTutorial) {
	persistent = false;
	
	camera_set_view_pos(
		view_camera[0],
		0,0
	);
} else {
	persistent = true;

	camera_set_view_pos(
		view_camera[0],
		oOverworldControl.startx - (global.CamW / 2),
		oOverworldControl.starty - (global.CamH / 2)
	);

	camera_set_view_size(view_camera[0],global.CamOverworldH,global.CamOverworldH);
}