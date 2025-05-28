image_speed = 0;

adjustposx = 0;
adjustposy = 0;

pixelDims = shader_get_uniform(shWhiteOutline,"texture_Pixel")
state = coinstates.available;

enum coinstates {
	available,
	selected,
	discarded
}