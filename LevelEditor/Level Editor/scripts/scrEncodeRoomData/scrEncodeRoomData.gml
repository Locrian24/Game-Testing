/// scrEncodeRoomData()

var width = room_width / CELL_SIZE;
var height = room_height / CELL_SIZE;

var levelData = "";
var encodedData = "";

for (_y = 0; _y < height; _y++) {
	for (_x = 0; _x < width; _x++) {
		inst = instance_position(_x * CELL_SIZE, _y * CELL_SIZE, all);
		
		if (inst != noone)
			inst = inst.object_index;
			
		switch (inst) {
			case noone:
				levelData += "0";
				break;
			case oWall:
				levelData += "1";
				break;
			case oTorch:
				levelData += "T";
				break;
			case oAlter:
				levelData += "A";
				break;
			case oSpecial:
				levelData += "@";
				break;
			case oDoor:
				levelData += "D";
				break;
			case oNPC:
				levelData += "N";
				break;
		}
	}
}

var count;

//run length encode the string
var length = string_length(levelData);
for (var i = 1; i <= length; i++) {
	count = 1;
	
	while (i < length && string_char_at(levelData, i) == string_char_at(levelData, i+1)) {
		count++;
		i++;
	}
	
	encodedData += string_char_at(levelData, i);
	encodedData += string(count)+".";
}

//show_debug_message(encodedData);

//DECODER TEST
//decoderTestScript(encodedData);

var saveDir = get_save_filename("*.txt", room_get_name(room) + ".txt");
var file = file_text_open_write(saveDir);
file_text_write_string(file, encodedData);
file_text_close(file);