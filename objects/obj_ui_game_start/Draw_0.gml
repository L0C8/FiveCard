/// @description Draw start button
var _button_left = x;
var _button_top = y;
var _button_right = _button_left + _button_width;
var _button_bottom = _button_top + _button_height;

// draw button background and outline
draw_set_color(_button_color);
draw_rectangle(_button_left, _button_top, _button_right, _button_bottom, false);

draw_set_color(_button_outline_color);
draw_rectangle(_button_left, _button_top, _button_right, _button_bottom, true);

// draw button label
draw_set_font(_button_font);
draw_set_color(_button_fontcolor);

var _text_width = string_width(_button_text);
var _text_height = string_height(_button_text);
var _text_x = _button_left + (_button_width - _text_width) * 0.5;
var _text_y = _button_top + (_button_height - _text_height) * 0.5;

draw_text(_text_x, _text_y, _button_text);

draw_set_color(c_white);
