if(room==rmOverworld) {
	var timemax = pinetime;
	repeat(floor(timemax)) {
		spawnPine(
			camera_get_view_x(view_camera[0])-64,
			camera_get_view_x(view_camera[0])+global.CamW+64,
			-8,8
		);
		pinetime--;
	}
}

pinetime += 12*delta_time/1000000;