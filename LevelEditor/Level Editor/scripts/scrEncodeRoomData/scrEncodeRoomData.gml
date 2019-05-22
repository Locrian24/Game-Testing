/// scrEncodeRoomData()

var width = room_width / CELL_SIZE;
var height = room_height / CELL_SIZE;

var levelData = "";

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

saveDir = get_save_filename("*.txt", room_get_name(room) + ".txt");
	file = file_text_open_write(saveDir);
	file_text_write_string(file, levelData);
	file_text_close(file);