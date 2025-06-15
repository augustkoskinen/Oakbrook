if(room==rmOverworld)
	shader_set(shGreyFilter);
draw_surface(application_surface,0,0)
shader_reset();

if(room==rmOverworld){
	draw_set_alpha(0.375);
	draw_surface_stretched(self.lightSurface,0,0,window_get_width(),window_get_height())
}

draw_set_alpha(1.0);