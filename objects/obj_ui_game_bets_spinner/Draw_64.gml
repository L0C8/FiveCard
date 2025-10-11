/// @description !
var _spinner_left = x;
var _spinner_top = y;
var _spinner_right = _spinner_left + _spinner_width;
var _spinner_bottom = _spinner_top + _spinner_length;
var _spinner_middle = _spinner_top + _spinner_button_height;

// draw spinner body
var _textfield_left = _spinner_right + _spinner_textspace;
var _textfield_top = _spinner_top;
var _textfield_right = _textfield_left + _spinner_textfield_width;
var _textfield_bottom = _textfield_top + _spinner_textfield_height;

var _arrow_padding = 6;

var _arrow_up_x1 = _spinner_left + _spinner_width * 0.5;
var _arrow_up_y1 = _spinner_top + _arrow_padding;
var _arrow_up_x2 = _spinner_right - _arrow_padding;
var _arrow_up_y2 = _spinner_middle - _arrow_padding;
var _arrow_up_x3 = _spinner_left + _arrow_padding;
var _arrow_up_y3 = _spinner_middle - _arrow_padding;

var _arrow_down_x1 = _spinner_left + _arrow_padding;
var _arrow_down_y1 = _spinner_middle + _arrow_padding;
var _arrow_down_x2 = _spinner_right - _arrow_padding;
var _arrow_down_y2 = _spinner_bottom - _arrow_padding;
var _arrow_down_x3 = _spinner_left + _spinner_width * 0.5;
var _arrow_down_y3 = _spinner_bottom - _arrow_padding;

draw_set_color(_button_color);
draw_rectangle(_spinner_left, _spinner_top, _spinner_right, _spinner_bottom, false);
draw_rectangle(_textfield_left, _textfield_top, _textfield_right, _textfield_bottom, false);

draw_set_color(_button_outline_color);
draw_rectangle(_spinner_left, _spinner_top, _spinner_right, _spinner_bottom, true);
draw_rectangle(_textfield_left, _textfield_top, _textfield_right, _textfield_bottom, true);
draw_line(_spinner_left, _spinner_middle, _spinner_right, _spinner_middle);

draw_set_color(_button_fontcolor);
draw_triangle(_arrow_up_x1, _arrow_up_y1, _arrow_up_x2, _arrow_up_y2, _arrow_up_x3, _arrow_up_y3, true);
draw_triangle(_arrow_down_x1, _arrow_down_y1, _arrow_down_x2, _arrow_down_y2, _arrow_down_x3, _arrow_down_y3, true);

var _bet_string = "$"+string((_value*0.25));
var _text_x = _textfield_left + _spinner_text_padding;
var _text_y = _textfield_top + (_spinner_textfield_height * 0.5) - (string_height(_bet_string) * 0.5);

draw_text(_text_x, _text_y, _bet_string);

draw_set_color(c_white);
