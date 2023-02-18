game_mode = noone
screen_width = display_get_width();
screen_height = display_get_height();

players_[0] = {
	character: noone,
	input: o_input_player_1
};
players_[1] = {
	character: noone,
	input: o_input_player_2
};
players_length_ = array_length_1d(players_);