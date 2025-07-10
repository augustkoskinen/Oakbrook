draw_sprite_ext(sButtons,2,x,y,4,4,0,c_white,1.0);

if(point_in_rectangle(mouse_x,mouse_y,
	x-14*4,y-4*4,
	x+15*4,y+5*4
)) {
	shader_set(shWhiteOutline)
	var texelW = texture_get_texel_width(sprite_get_texture(sButtons,2))
	var texelH = texture_get_texel_height(sprite_get_texture(sButtons,2))
	shader_set_uniform_f(pixelDims,texelW,texelH)
					
	if(global.mousedown) {
		global.restartGame = true;
		global.mousedown = false;
	}
}
draw_sprite_ext(sButtons,2,x,y,4,4,0,c_white,1.0);

shader_reset();