CamW = camera_get_view_width(view_camera[0]);
CamH = camera_get_view_height(view_camera[0]);

if(global.immediatecamswitch) {
	if(room == rmCardMat) {
		camera_set_view_pos(view_camera[0],
			0,0
		);
		
		global.camx = CamW/2;
		global.camy = CamH/2;
	} else if (room ==rmOverworld) {
		camera_set_view_pos(view_camera[0],
			oGameControl.startx - (CamW / 2),
			oGameControl.starty-96*global.level - (CamH / 2)
		);
		
		global.camx = oGameControl.startx;
		global.camy = oGameControl.starty-96*global.level;
	}
	
	global.immediatecamswitch = false;
} else {
	if(room == rmCardMat) {
		global.camx = CamW/2;
		global.camy = CamH/2;
	} else if (room ==rmOverworld) {
		global.camx = oGameControl.startx;
		global.camy = oGameControl.starty-96*global.level;
	}
}

camera_set_view_pos(
	view_camera[0],
	lerp(camera_get_view_x(view_camera[0]), global.camx - (CamW / 2), .05),
	lerp(camera_get_view_y(view_camera[0]), global.camy - (CamH / 2), .05)
);