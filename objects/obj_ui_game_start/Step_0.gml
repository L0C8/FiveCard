/// @description Handle start button interaction
var _mouse_x = device_mouse_x(0);
var _mouse_y = device_mouse_y(0);

var _button_left = x;
var _button_top = y;
var _button_right = _button_left + _button_width;
var _button_bottom = _button_top + _button_height;

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mouse_x, _mouse_y, _button_left, _button_top, _button_right, _button_bottom)) {
        show_debug_message("Start button pressed");
    }
}
