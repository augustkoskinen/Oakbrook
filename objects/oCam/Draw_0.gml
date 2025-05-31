CamW = camera_get_view_width(view_camera[0]);
CamH = camera_get_view_height(view_camera[0]);

show_debug_message(camera_get_view_x(view_camera[0]))

camera_set_view_pos(
	view_camera[0],
	lerp(camera_get_view_x(view_camera[0]), global.camx - (CamW / 2), .05),
	lerp(camera_get_view_y(view_camera[0]), global.camy - (CamH / 2), .05)
);