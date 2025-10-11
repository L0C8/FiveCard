/// @description !
draw_set_color(_spinner_color);
// draw stuff
draw_line(x,y,x+_spinner_width,y);
draw_line(x,y+_spinner_length,x+_spinner_width,y+_spinner_length);
draw_text(x+_spinner_textspace,y+_spinner_textspace,"test")
draw_set_color(c_white);
