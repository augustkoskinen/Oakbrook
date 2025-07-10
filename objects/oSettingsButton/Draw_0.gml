depth = -100;

draw_sprite_ext(sButtons,4,x,y,4,4,0,c_white,1.0);

if(!global.playopen&&!global.settingsopen&&point_in_rectangle(mouse_x,mouse_y,
	x-18*4,y-5*4,
	x+17*4,y+4*4
)) {
	shader_set(shWhiteOutline)
	var texelW = texture_get_texel_width(sprite_get_texture(sButtons,0))
	var texelH = texture_get_texel_height(sprite_get_texture(sButtons,0))
	shader_set_uniform_f(pixelDims,texelW,texelH)
					
	if(global.mousedown) {
		global.settingsopen = true;
		global.trigger = true;
		global.mousedown = false;
	}
}
draw_sprite_ext(sButtons,4,x,y,4,4,0,c_white,1.0);

shader_reset();