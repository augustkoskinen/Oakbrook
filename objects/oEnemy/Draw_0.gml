if(global.chooseenemystate) {
	if(attacker==noone) {
		if(collision_point(mouse_x,mouse_y,self,false,false)) {
			shader_set(shWhiteOutline)
			var texelW = texture_get_texel_width(sprite_get_texture(sprite_index,type))
			var texelH = texture_get_texel_height(sprite_get_texture(sprite_index,type))
			shader_set_uniform_f(pixelDims,texelW,texelH)
			global.hoverid = self;
		} else if(global.hoverid == self) {
			global.hoverid = noone;
		}
	} else {
		draw_set_alpha(0.5);
	}
} else if(global.hoverid == self) {
	global.hoverid = noone;
}

draw_sprite(sprite_index,type,x,y)

shader_reset();

draw_sprite(sEnemyHPType,hptype+1,x,y)
draw_sprite(sEnemyDMGType,dmgtype+1,x,y)

draw_sprite(sEnemyHP,curhp,x,y)
draw_sprite(sEnemyDMG,dmg,x,y)

draw_set_alpha(1.0);