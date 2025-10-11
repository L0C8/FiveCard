/// @description Handle spinner interaction
var _mouse_x = device_mouse_x(0);
var _mouse_y = device_mouse_y(0);
var _spinner_left = x;
var _spinner_top = y;
var _spinner_right = _spinner_left + _spinner_width;
var _spinner_bottom = _spinner_top + _spinner_length;
var _spinner_middle = _spinner_top + _spinner_button_height;

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mouse_x, _mouse_y, _spinner_left, _spinner_top, _spinner_right, _spinner_middle)) {
        _value = clamp(_value + 1, _spinner_min_value, _spinner_max_value);
    } else if (point_in_rectangle(_mouse_x, _mouse_y, _spinner_left, _spinner_middle, _spinner_right, _spinner_bottom)) {
        _value = max(_spinner_min_value, _value - 1);
    }
}
