global.filename = "savedgame.txt";

function saveGame() {
	deleteSavedGame();
	
	saveRoom();
	
	global.gameData.seed = global.seed;
	global.gameData.vessels = global.vessels;
	global.gameData.idols = global.idols;
	global.gameData.coinmax = global.coinmax;
	global.gameData.handmax = global.handmax;
	global.gameData.playermaxhealth = global.playermaxhealth;
	global.gameData.playerhealth = global.playerhealth;
	
	global.gameData.cards = array_create(0);
	for(var i = 0; i < array_length(global.cards); i++) {
		array_push(global.gameData.cards, {
			index: array_get(global.cards,i).index,
			type: array_get(global.cards,i).type,
		});
	}
	
	if(room==rmCardMat||global.overworldaction!=-1) {
		global.gameData.level = global.level-1;
		global.gameData.curspot = global.prevspot;
	} else {
		global.gameData.level = global.level;
		global.gameData.curspot = global.curspot;
	}
	
	var file = file_text_open_write(global.filename);
	file_text_write_string(file,json_stringify(global.gameData));
	file_text_close(file);
}

function saveRoom() {
	var array = [];
	
	with(oSpot) {
		
		var spotstruct = {
			obj: object_get_name(object_index),
			x: x,
			y: y,
			depth: depth,
			spotid: spotid,
			type: type,
			level: level,
			enemystat: enemystat,
			holdcard: holdcard,
			spotfrom: spotfrom,
			spotto: spotto,
			spotfromid: spotfromid,
			spottoid: spottoid,
			loaded: true
		}
		
		array_push(array,spotstruct);
	}
	
	struct_set(global.gameData.roomdata, room_get_name(rmOverworld), array);
}

function loadGame() {
	if(file_exists(global.filename)) {
		var file = file_text_open_read(global.filename)
		var json = file_text_read_string(file);
		global.gameData = json_parse(json);
		
		file_text_close(file);
		
		random_set_seed(global.gameData.seed);
		loadRoom();
		
		global.level = global.gameData.level;
		global.curspot = global.gameData.curspot;
		global.vessels = global.gameData.vessels;
		global.idols = global.gameData.idols;
		global.coinmax = global.gameData.coinmax;
		global.handmax = global.gameData.handmax;
		global.playermaxhealth = global.gameData.playermaxhealth;
		global.playerhealth = global.gameData.playerhealth;
		global.cards = array_create(0);
		
		for(var i = 0; i < array_length(global.gameData.cards); i++) {
			var card = instance_create_depth(0,0,0,oCard)
			card.index = array_get(global.gameData.cards,i).index;
			card.type = array_get(global.gameData.cards,i).type;
			array_push(global.cards, card);
		}
	}
}

function loadRoom() {
	room_goto(rmOverworld);
	
	with(oSpot) {
		instance_destroy();
	}
	
	var array = struct_get(global.gameData.roomdata,room_get_name(rmOverworld));
	
	if(array!=undefined) {
		for(var i = 0; i < array_length(array); i++) {
			var struct = array[i]
			var spot = instance_create_depth(struct.x,struct.y,struct.depth,asset_get_index(struct.obj),struct)
			spot.loaded = true;
			spot.spotid = struct.spotid;
			spot.type = struct.type;
			spot.level = struct.level;
			spot.enemystat = struct.enemystat;
			spot.holdcard = struct.holdcard;
			spot.spotfrom = struct.spotfrom;
			spot.spotto = struct.spotto;
			spot.spotfromid = struct.spotfromid;
			spot.spottoid = struct.spottoid;
		}
	}
	
	with(oSpot) {
		spotfrom = array_create(0);
		
		for(var i = 0; i < array_length(spotfromid); i++) {
			var curid = array_get(spotfromid,i);
			with(oSpot) {
				if(spotid==curid) {
					array_push(other.spotfrom,id);
					break;
				}
			}
		}
		
		spotto = array_create(0);
		for(var i = 0; i < array_length(spottoid); i++) {
			var curid = array_get(spottoid,i);
			with(oSpot) {
				if(spotid==curid) {
					array_push(other.spotto,id);
					break;
				}
			}
		}
		
	}
}

function deleteSavedGame() {
	if(file_exists(global.filename)) {
		file_delete(global.filename);
	}
}

function savedGameExists() { 
	return file_exists(global.filename)
}