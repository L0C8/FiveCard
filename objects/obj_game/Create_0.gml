/// @description !

// load player data 
_chips = 0;
_player_name = "";
_player_id = ""; 

// game data
_card[0] = 0;
_card[1] = 0;
_card[2] = 0;
_card[3] = 0;
_card[4] = 0;
_bet = 0;

_get_card_name = function(_arg_index){
	var _card = "";
	_card = _get_card_value(_arg_index)+" of "+_get_card_suite(_arg_index);
	return _card;
}

_get_card_value = function(_arg_index){
	var _card = "";
	if(		
			real(_arg_index) == 0  || 
			real(_arg_index) == 13 || 
			real(_arg_index) == 26 || 
			real(_arg_index) == 39)
		_card = "Ace";
        else if(
                        real(_arg_index) == 1  ||
                        real(_arg_index) == 14 ||
                        real(_arg_index) == 27 ||
                        real(_arg_index) == 40)
                _card = "Two";
        else if(
                        real(_arg_index) == 2  ||
                        real(_arg_index) == 15 ||
                        real(_arg_index) == 28 ||
                        real(_arg_index) == 41)
                _card = "Three";
        else if(
                        real(_arg_index) == 3  ||
                        real(_arg_index) == 16 ||
                        real(_arg_index) == 29 ||
                        real(_arg_index) == 42)
                _card = "Four";
        else if(
                        real(_arg_index) == 4  ||
                        real(_arg_index) == 17 ||
                        real(_arg_index) == 30 ||
                        real(_arg_index) == 43)
                _card = "Five";
        else if(
                        real(_arg_index) == 5  ||
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
        else if(
                        real(_arg_index) == 7  ||
                        real(_arg_index) == 20 ||
                        real(_arg_index) == 33 ||
                        real(_arg_index) == 46)
                _card = "Eight";
        else if(
                        real(_arg_index) == 8  ||
                        real(_arg_index) == 21 ||
                        real(_arg_index) == 34 ||
                        real(_arg_index) == 47)
                _card = "Nine";
        else if(
                        real(_arg_index) == 9  ||
                        real(_arg_index) == 22 ||
                        real(_arg_index) == 35 ||
                        real(_arg_index) == 48)
                _card = "Ten";
        else if(
                        real(_arg_index) == 10 ||
                        real(_arg_index) == 23 ||
                        real(_arg_index) == 36 ||
                        real(_arg_index) == 49)
                _card = "Jack";
        else if(
                        real(_arg_index) == 11 ||
                        real(_arg_index) == 24 ||
                        real(_arg_index) == 37 ||
                        real(_arg_index) == 50)
                _card = "Queen";
	else if(
			real(_arg_index) == 12 ||
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

_check_win = function(){
        var _values = array_create(5, 0);
        var _value_counts = array_create(14, 0);
        var _suit_counts = array_create(4, 0);

        for (var _i = 0; _i < 5; ++_i) {
                var _card_index = _card[_i];
                var _value = (_card_index mod 13) + 1;
                var _suit = floor(_card_index / 13);

                _values[_i] = _value;
                _value_counts[_value] += 1;
                _suit_counts[_suit] += 1;
        }

        for (var _i = 0; _i < 5; ++_i) {
                for (var _j = _i + 1; _j < 5; ++_j) {
                        if (_values[_j] < _values[_i]) {
                                var _temp = _values[_i];
                                _values[_i] = _values[_j];
                                _values[_j] = _temp;
                        }
                }
        }

        var _is_flush = false;
        for (var _i = 0; _i < 4; ++_i) {
                if (_suit_counts[_i] == 5) {
                        _is_flush = true;
                        break;
                }
        }

        var _is_straight = true;
        for (var _i = 1; _i < 5; ++_i) {
                if (_values[_i] != _values[_i - 1] + 1) {
                        _is_straight = false;
                        break;
                }
        }

        var _is_royal = false;
        if (!_is_straight) {
                if (_values[0] == 1 && _values[1] == 10 && _values[2] == 11 && _values[3] == 12 && _values[4] == 13) {
                        _is_straight = true;
                        _is_royal = true;
                }
        } else if (_values[0] == 1 && _values[1] == 10) {
                // Handles the sorted case where Ace is low but forms Ten-to-Ace straight
                _is_royal = (_values[2] == 11 && _values[3] == 12 && _values[4] == 13);
        }

        var _pair_count = 0;
        var _has_three_kind = false;
        var _has_four_kind = false;

        for (var _i = 1; _i <= 13; ++_i) {
                switch (_value_counts[_i]) {
                        case 4:
                                _has_four_kind = true;
                                break;
                        case 3:
                                _has_three_kind = true;
                                break;
                        case 2:
                                _pair_count += 1;
                                break;
                }
        }

        if (_is_flush && _is_straight) {
                return (_is_royal) ? 0 : 1;
        }
        if (_has_four_kind) {
                return 2;
        }
        if (_has_three_kind && _pair_count == 1) {
                return 3;
        }
        if (_is_flush) {
                return 4;
        }
        if (_is_straight) {
                return 5;
        }
        if (_has_three_kind) {
                return 6;
        }
        if (_pair_count == 2) {
                return 7;
        }
        if (_pair_count == 1) {
                return 8;
        }

        return 9;
}

_win = function(_arg_type, _arg_value){
	switch(real(_arg_type)){
		case(0): // Royal Flush
			break;
		case(1): // Straight Flush
			break;
		case(2): // Four of a Kind 
			break;
		case(3): // Full House 
			break;
		case(4): // Flush
			break;
		case(5): // Straight
			break;
		case(6): // Three of a Kind 
			break;
		case(7): // Two Pair 
			break;
		case(8): // One Pair
			break;
		default: // other
			break;
	}
}
	
// debug
_debug_rng = function(){
	_card[0] = irandom_range(0,51);
	_card[1] = irandom_range(0,51);
	_card[2] = irandom_range(0,51);
	_card[3] = irandom_range(0,51);
	_card[4] = irandom_range(0,51);
}