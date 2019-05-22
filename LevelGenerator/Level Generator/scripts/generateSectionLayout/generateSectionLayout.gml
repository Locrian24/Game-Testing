/// generateSectionLayout();

var room_num = 0;

randomize();
var roll = irandom_range(0, 100);
var has_store = (roll < STORE_CHANCE);

roll = irandom_range(0, 100);

while (room_num < MAX_ROOMS) {
	if (roll < SIMPLE_CHANCE) { //SIMPLE SECTION
		sections[room_num mod 2, room_num div 2] = "1";

	} else if (has_store) { //STORE SECTION
		sections[room_num mod 2, room_num div 2] = "S";
			
		has_store = false;
	} else {
		if (room_num > 2 and room_num mod 2 == 0) { //PUZZLE SECTION
			sections[0, room_num div 2] = "P";
			sections[1, room_num div 2] = "0";
			room_num++; //count as 2 rooms
				
		} else {
			//No suitable room was chosen
			room_num--;
		}
	}
		
	room_num++;
	roll = irandom_range(0, 100); //re-roll
}