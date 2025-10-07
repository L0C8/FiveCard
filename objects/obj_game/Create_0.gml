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
		_card = "test";
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