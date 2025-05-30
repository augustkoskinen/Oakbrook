image_speed = 0;

adjustposx = 0;
adjustposy = 0;

holdx = 0;

pixelDims = shader_get_uniform(shWhiteOutline,"texture_Pixel")

state = cardstates.indeck;

enum cardstates {
	available,
	selected,
	selectedoption,
	selectedattack,
	selectedshield,
	discarded,
	indeck
}