/// getRandomElement(ds_list);

var _list = argument0;

var _rand_index = irandom_range(0, ds_list_size(_list) - 1);
return _list[| _rand_index];

