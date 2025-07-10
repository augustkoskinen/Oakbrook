time = 0;
textoffsetx = 12;
textoffsety = 32;

draw_set_font(fnText);
width = 128;
height = string_height_ext(text,10,width);

surface = noone;

function destroyText() {
	if(global.curtext==id) {
		global.curtext = noone;
		global.canTakeAction = true;
	}
	
	array_push(global.achievements,achievement);
	instance_destroy(self);
}