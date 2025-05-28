CamW = 192;
CamH = 192;

camera_set_view_pos(
	view_camera[0],
	oCardGameControl.centerx - (CamW / 2),
	oCardGameControl.centery - (CamH / 2)
);

camera_set_view_size(view_camera[0],CamW,CamH);