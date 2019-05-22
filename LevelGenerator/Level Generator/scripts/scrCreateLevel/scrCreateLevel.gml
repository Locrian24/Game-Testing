/// scrCreateLevel();

// Initialisations
sections = [];

// Generate room layout
generateSectionLayout();

// Load section templates into memory
if (file_exists("simple.json")) {
	var _wrapper = readJsonFile("simple.json");
	//load simple templates
	var _simple = _wrapper[? "simple"];
	var _simple_templates = _simple[? "templates"];
	
	//load store templates
	var _store = _wrapper[? "store"];
	var _store_templates = _store[? "templates"];
	
	//load puzzle templates
	var _puzzle = _wrapper[? "puzzle"];
	var _puzzle_templates = _puzzle[? "templates"];
	
	var current_section;
	var section_tile_string;
	var is_wide;
	
	// Draw each section
	for (var _y = 0; _y < (MAX_ROOMS div 2); _y++) {
		for (var _x = 0; _x < 2; _x++) {
			current_section = sections[_x, _y];
			
			//skip "0" elements (means there was a 2x1 section)
			if (current_section == "0") continue;
			
			// Get the encoded section string and draw it
			switch(current_section) {
				case "1":
					section_tile_string = getRandomElement(_simple_templates);
					is_wide = false;
					break;
				case "S":
					section_tile_string = getRandomElement(_store_templates);
					is_wide = false;
					break;
				case "P":
					section_tile_string = getRandomElement(_puzzle_templates);
					is_wide = true;
					break;
				default:
					break;
			}

			// Draw Section Script (section_x, section_y, encoded_tiles, wide section (2x1) or not (1x1))
			drawSection(_x, _y, section_tile_string, is_wide);
			
		}
	}
	
	ds_map_destroy(_wrapper); // Destroy to prevent memory overflow
	
	for (var _i = 0; _i < room_width; _i++) {
		instance_create_layer(_i, 0, "Instances", oWall);
		instance_create_layer(_i, room_height - CELL_SIZE, "Instances", oWall);
	}
	
	for (var _i = 0; _i < room_height; _i++) {
		instance_create_layer(0, _i, "Instances", oWall);
		instance_create_layer(room_width - CELL_SIZE, _i, "Instances", oWall);
	}
}