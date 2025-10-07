/// @description !

/// Variables 

// load player data 
_chips = 0;
_player_name = "";
_player_id = ""; 
_player_card = 4;

// game data
_card[0] = -1;
_card[1] = -1;
_card[2] = -1;
_card[3] = -1;
_card[4] = -1;
_bet = 0;
_win_string = "";

_card_action[0] = false;
_card_action[1] = false;
_card_action[2] = false;
_card_action[3] = false;
_card_action[4] = false;

// ui 
_card_obj[0] = card_obj_00; 
_card_obj[1] = card_obj_01; 
_card_obj[2] = card_obj_02; 
_card_obj[3] = card_obj_03; 
_card_obj[4] = card_obj_04; 

/// Function

// init
_init = function(){
	_set_card_objects();
	_set_cards_hidden();
	
}

// card functions 
_get_card_name = function(_arg_index){
	var _card = "";
	if(real(_arg_index) >= 0 && real(_arg_index) <= 51)
		_card = _get_card_value(_arg_index)+" of "+_get_card_suite(_arg_index);
	return _card;
}

_get_card_value = function(_arg_index){
	var _card = "";
		if(				real(_arg_index) == 0  || 
						real(_arg_index) == 13 || 
						real(_arg_index) == 26 || 
						real(_arg_index) == 39)
					_card = "Ace";
        else if(		real(_arg_index) == 1  ||
                        real(_arg_index) == 14 ||
                        real(_arg_index) == 27 ||
                        real(_arg_index) == 40)
                _card = "Two";
        else if(		real(_arg_index) == 2  ||
                        real(_arg_index) == 15 ||
                        real(_arg_index) == 28 ||
                        real(_arg_index) == 41)
                _card = "Three";
        else if(		real(_arg_index) == 3  ||
                        real(_arg_index) == 16 ||
                        real(_arg_index) == 29 ||
                        real(_arg_index) == 42)
                _card = "Four";
        else if(		real(_arg_index) == 4  ||
                        real(_arg_index) == 17 ||
                        real(_arg_index) == 30 ||
                        real(_arg_index) == 43)
                _card = "Five";
        else if(		real(_arg_index) == 5  ||
                        real(_arg_index) == 18 ||
                        real(_arg_index) == 31 ||
                        real(_arg_index) == 44)
                _card = "Six";
        else if(
                        real(_arg_index) == 6  ||
                        real(_arg_index) == 19 ||
                        real(_arg_index) == 32 ||
                        real(_arg_index) == 45)
                _card = "Seven";
        else if(		real(_arg_index) == 7  ||
                        real(_arg_index) == 20 ||
                        real(_arg_index) == 33 ||
                        real(_arg_index) == 46)
                _card = "Eight";
        else if(		real(_arg_index) == 8  ||
                        real(_arg_index) == 21 ||
                        real(_arg_index) == 34 ||
                        real(_arg_index) == 47)
                _card = "Nine";
        else if(		real(_arg_index) == 9  ||
                        real(_arg_index) == 22 ||
                        real(_arg_index) == 35 ||
                        real(_arg_index) == 48)
                _card = "Ten";
        else if(		real(_arg_index) == 10 ||
                        real(_arg_index) == 23 ||
                        real(_arg_index) == 36 ||
                        real(_arg_index) == 49)
                _card = "Jack";
        else if(		real(_arg_index) == 11 ||
                        real(_arg_index) == 24 ||
                        real(_arg_index) == 37 ||
                        real(_arg_index) == 50)
                _card = "Queen";
		else if(		real(_arg_index) == 12 ||
						real(_arg_index) == 25 ||
                        real(_arg_index) == 38 ||
                        real(_arg_index) == 51)
                _card = "King";
        else
                _card = "Error";
	return _card;
}

_get_card_suite = function(_arg_index){
	var _card = "";
	if(real(_arg_index) >= 0 && (real(_arg_index) < 12)){
		_card += "Spades";
	} else if (real(_arg_index) >= 13 && (real(_arg_index) <= 25)) {
		_card += "Hearts";
	} else if (real(_arg_index) >= 26 && (real(_arg_index) <= 38)) {
		_card += "Clubs";
	} else if (real(_arg_index) >= 39 && (real(_arg_index) <= 51)) {
		_card += "Diamonds";
	} else { 
		_card += "Error";	
	}
	return _card;
}

_set_card_objects = function(){
	for(var i=0; i<5;i++){
		_card_obj[i].image_index = real(_card[i]);	
		_card_obj[i]._card_index = i;
	}
}

_set_card_hidden = function(_arg_index){
	_card_obj[real(_arg_index)].image_index = 52+real(_player_card);	
}

_set_cards_hidden = function(){
	for(var i=0; i<5;i++)
		_set_card_hidden(i);
}

// game functions
_check_win = function(){
	var _hand_size = array_length(_card);
	if(_hand_size < 5){
		_win_string = "";
		return;
	}

	var _values = array_create(5, 0);
	var _suits = array_create(5, 0);
	var _value_count = array_create(13, 0);
	var _high_card_value = -1;
	var _high_card_rank = -1;
	var _valid_hand = true;

	for(var i = 0; i < 5; i++){
		var _raw = _card[i];
		if(!is_real(_raw) || _raw < 0){
			_valid_hand = false;
			break;
		}

		_raw = floor(_raw);
		var _value = _raw mod 13;
		var _suit = _raw div 13;

		_values[i] = _value;
		_suits[i] = _suit;
		_value_count[_value] += 1;

		var _rank_order = (_value == 0) ? 13 : _value;
		if(_rank_order > _high_card_rank){
			_high_card_rank = _rank_order;
			_high_card_value = _value;
		}
	}

	if(!_valid_hand){
		_win_string = "Invalid Hand";
		return;
	}

	var _pairs = 0;
	var _three_kind = false;
	var _four_kind = false;
	for(var r = 0; r < 13; r++){
		var _count = _value_count[r];
		if(_count == 4)
			_four_kind = true;
		else if(_count == 3)
			_three_kind = true;
		else if(_count == 2)
			_pairs += 1;
	}

	var _flush = true;
	for(var j = 1; j < 5; j++){
		if(_suits[j] != _suits[0]){
			_flush = false;
			break;
		}
	}

	var _sorted = array_create(5, 0);
	for(var s = 0; s < 5; s++)
		_sorted[s] = _values[s];

	array_sort(_sorted, function(_a, _b){
		return _a > _b;
	});

	var _straight = true;
	for(var c = 1; c < 5; c++){
		if(_sorted[c] == _sorted[c - 1] || _sorted[c] != (_sorted[0] + c)){
			_straight = false;
			break;
		}
	}

	if(!_straight){
		if(_sorted[0] == 0 && _sorted[1] == 1 && _sorted[2] == 2 && _sorted[3] == 3 && _sorted[4] == 4)
			_straight = true;
		else if(_sorted[0] == 0 && _sorted[1] == 9 && _sorted[2] == 10 && _sorted[3] == 11 && _sorted[4] == 12)
			_straight = true;
	}

	var _royal = (_straight && _sorted[0] == 0 && _sorted[1] == 9 && _sorted[2] == 10 && _sorted[3] == 11 && _sorted[4] == 12);

	var _win_type = "High Card";
	if(_straight && _flush){
		if(_royal)
			_win_type = "Royal Flush";
		else
			_win_type = "Straight Flush";
	}else if(_four_kind){
		_win_type = "Four of a Kind";
	}else if(_three_kind && _pairs > 0){
		_win_type = "Full House";
	}else if(_flush){
		_win_type = "Flush";
	}else if(_straight){
		_win_type = "Straight";
	}else if(_three_kind){
		_win_type = "Three of a Kind";
	}else if(_pairs >= 2){
		_win_type = "Two Pair";
	}else if(_pairs == 1){
		_win_type = "One Pair";
	}else{
		_win_type = string(_get_card_value(_high_card_value)) + " High";
	}

	_win_string = _win_type;
}
// draw functions
_draw_hand = function(){
	for(var i=0; i<5; i++){
		_card[i] = irandom_range(0,51);
	}
}
	
_draw_card = function(_arg_card){
	_card[real(_arg_card)] = irandom_range(0,51);
}

// debug
_debug_inc = function(_arg_card){
	var _card_slot = floor(real(_arg_card));
	var _card_count = array_length(_card);

	if(_card_count <= 0)
		return;

	if(_card_slot < 0 || _card_slot >= _card_count)
		return;

	var _value = _card[_card_slot];

	if(!is_real(_value) || _value < 0)
		_value = 0;
	else
		_value = (_value + 1) mod 52;

	_card[_card_slot] = _value;
	_set_card_objects();
}

_debug_rng = function(){
	_draw_hand();
	_set_card_objects();
}

/// Start Game
_init();
