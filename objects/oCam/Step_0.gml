global.CamW = camera_get_view_width(view_camera[0]);
global.CamH = camera_get_view_height(view_camera[0]);

if(global.immediatecamswitch) {
	if(room == rmCardMat||room == rmTutorial) {
		camera_set_view_pos(view_camera[0],
			0,0
		);
		
		global.camx = global.CamW/2;
		global.camy = global.CamH/2;
	} else if (room == rmOverworld) {
		camera_set_view_pos(view_camera[0],
			oOverworldControl.startx - (global.CamW / 2),
			oOverworldControl.starty-96*global.level - (global.CamH / 2)
		);
		
		global.camx = oOverworldControl.startx;
		global.camy = oOverworldControl.starty-96*global.level;
	}
	
	global.immediatecamswitch = false;
} else {
	if(room == rmCardMat||room == rmTutorial) {
		global.camx = global.CamW/2;
		global.camy = global.CamH/2;
	} else if (room ==rmOverworld) {
		global.camx = oOverworldControl.startx;
		global.camy = oOverworldControl.starty-96*global.level;
	}
}

if(!global.paused)
	camera_set_view_pos(
		view_camera[0],
		lerp(camera_get_view_x(view_camera[0]), global.camx - (global.CamW / 2), .05),
		lerp(camera_get_view_y(view_camera[0]), global.camy - (global.CamH / 2), .05)
	);