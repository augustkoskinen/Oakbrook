repeat((oOverworldControl.starty-96*global.level+global.CamH/2)/4) {
	spawnPine(
		oOverworldControl.startx-global.CamW/2-64,
		oOverworldControl.startx+global.CamW/2+64,
		0,
		oOverworldControl.starty-96*global.level+global.CamH/2
	)
}

pinetime = 0;