if(!surface_exists(self.lightSurface)) {
	lightSurface = surface_create(window_get_width(),window_get_height())
}

surface_set_target(self.lightSurface);
draw_clear(c_black);

if(instance_exists(oCam)) {
	gpu_set_blendmode(bm_subtract)
	camera_apply(view_camera[0])
	draw_sprite(sLighting,0,camera_get_view_x(view_camera[0])+global.CamW/2,camera_get_view_y(view_camera[0])+48+global.CamH/2)
	gpu_set_blendmode(bm_normal)
	
}
surface_reset_target()