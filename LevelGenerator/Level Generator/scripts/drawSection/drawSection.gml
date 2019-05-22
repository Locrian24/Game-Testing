/// drawSection(section_x, section_y, encoded_section, is_wide)

var _x = argument0;
var _y = argument1;
var _data = argument2;
var _is_wide = argument3;

var _x_offset = _x * CELL_SIZE * SECTION_GRID_WIDTH;
var _y_offset = _y * CELL_SIZE * SECTION_GRID_HEIGHT;

var _string_wrap = _is_wide ? (SECTION_GRID_WIDTH * 2) : SECTION_GRID_WIDTH;

for (var c = 1; c <= string_length(_data); c++) {
	
	var _x_position = _x_offset + (((c-1) mod _string_wrap) * CELL_SIZE);
	var _y_position = _y_offset + (((c-1) div _string_wrap) * CELL_SIZE);
	
	show_debug_message(string(_x_position) + ":" + string(_y_position) + " = " + string_char_at(_data, c));
	
	switch(string_char_at(_data, c)) {
		case "0": //empty
			break;
		case "1": //oWall
			instance_create_layer(_x_position, _y_position, "Instances", oWall);
			break;
		case "T": //oTorch
			instance_create_layer(_x_position, _y_position, "Instances", oTorch);
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
			break;
	}
}