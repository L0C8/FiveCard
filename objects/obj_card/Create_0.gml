/// @description !

/// variables
image_speed = 0;
_card_index = -1;

_hide = function(){
	obj_game._set_card_hidden(_card_index);
}

_debug_draw = function(){
	obj_game._draw_card(_card_index);
	obj_game._set_card_objects();
}