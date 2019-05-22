/// decoderTestScript(encodedString);

var encoded_string = argument0;

var current_char;
var tile;
var repeated = "";

var decoded_string = "";

for (var i = 1; i <= string_length(encoded_string); i++) {
	tile = string_char_at(encoded_string, i);
	
	i++;
	repeated = "";
	
	current_char = string_char_at(encoded_string, i);
	
	while (current_char != "" and current_char != ".") {
		repeated += current_char;
		show_debug_message(current_char + " : " + repeated);
		
		i++;
		current_char = string_char_at(encoded_string, i);
	}
	
	show_debug_message("_"+repeated);
	
	for (var j = 0; j < real(repeated); j++) {
		decoded_string += tile;
	}
}

show_debug_message(decoded_string);