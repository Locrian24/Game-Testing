/// drawSection(section_x, section_y, encoded_section, is_wide)

var _x = argument0;
var _y = argument1;
var _data = argument2;
var _is_wide = argument3;

var _x_offset = _x * CELL_SIZE * SECTION_GRID_WIDTH;
var _y_offset = _y * CELL_SIZE * SECTION_GRID_HEIGHT;

var _string_wrap = _is_wide ? (SECTION_GRID_WIDTH * 2) : SECTION_GRID_WIDTH;

var _x_position;
var _y_position;

var decoded_data = decodeSectionString(_data);

for (var i = 1; i <= string_length(decoded_data); i++) {
	
	_x_position = _x_offset + (((i-1) mod _string_wrap) * CELL_SIZE);
	_y_position = _y_offset + (((i-1) div _string_wrap) * CELL_SIZE);
	
	switch(string_char_at(decoded_data, i)) {
		case "0": //empty
			break;
		case "1": //oWall
			instance_create_layer(_x_position, _y_position, "Instances", oWall);
			break;
		case "A": //oAlter
			instance_create_layer(_x_position, _y_position, "Instances", oAlter);
			break;
		case "@": //oSpecial
			instance_create_layer(_x_position, _y_position, "Instances", oSpecial);
			break;
		case "D": //oDoor
			instance_create_layer(_x_position, _y_position, "Instances", oDoor);
			break;
		case "N": //oNPC
			instance_create_layer(_x_position, _y_position, "Instances", oNPC);
			break;
		default:
			instance_create_layer(_x_position, _y_position, "Instances", oError);
			break;
	}
}