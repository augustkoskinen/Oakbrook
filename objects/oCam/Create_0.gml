persistent = true;

camera_set_view_pos(
	view_camera[0],
	global.camx - (global.CamW / 2),
	global.camy - (global.CamH / 2)
);

camera_set_view_size(view_camera[0],global.CamW,global.CamH);