/// @description ! 
draw_set_font(fnt_ui)
draw_set_color(c_white);
draw_text(12,12,"test:");
draw_text(24,32,"Card 1: "+string(_get_card_name(_card[0])));
draw_text(24,48,"Card 2: "+string(_get_card_name(_card[1])));
draw_text(24,64,"Card 3: "+string(_get_card_name(_card[2])));
draw_text(24,80,"Card 4: "+string(_get_card_name(_card[3])));
draw_text(24,96,"Card 5: "+string(_get_card_name(_card[4])));
draw_text(24,112,"Win: "+string(_win_string));