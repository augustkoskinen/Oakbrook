CamW = 320;
CamH = 320;

persistent = true;

camera_set_view_pos(
	view_camera[0],
	global.camx - (CamW / 2),
	global.camy - (CamH / 2)
);

camera_set_view_size(view_camera[0],CamW,CamH);