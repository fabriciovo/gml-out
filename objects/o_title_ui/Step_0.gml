var _last_index = index_;
if o_input_player_1.up_pressed_ {
	index_ = max(--index_, 0);
}

if o_input_player_1.down_pressed_ {
	index_ = min(++index_, option_length_-1);
}

if _last_index != index_ {
	//audio_play_sound(a_menu_move, 1, false);	
}

if o_input_player_1.confirm_pressed_ {
	switch (index_) {
		case options.battle:
			//audio_play_sound(a_menu_select, 3, false);
			o_game.game_mode = 1;
			room_goto(rm_character_selection);
			break;
		
		case options.coop:
			//audio_play_sound(a_menu_select, 3, false);
			o_game.game_mode = 1
			room_goto(rm_character_selection);
			break;
	}
}