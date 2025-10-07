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