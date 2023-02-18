/// @description Player 2 input
var _last_index_2 = index_player_2;

if o_input_player_2.left_pressed_ {
	index_player_2 = max(--index_player_2, 0);
}

if o_input_player_2.right_pressed_ {
	index_player_2 = min(++index_player_2, option_length_-1);
}

if _last_index_2 != index_player_2 {
	//audio_play_sound(a_menu_move, 1, false);	
}

if o_input_player_2.confirm_pressed_ {
	switch (index_player_2) {
		case characters.cody:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_2.sprite_index = s_cody_idle
			o_game.players_[1].character  = Cody
			break;
		
		case characters.cyber_girl:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_2.sprite_index = s_cyber_girl_idle
			o_game.players_[1].character  = CyberGirl
			break;
		
		case characters.musashi:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_2.sprite_index = s_musashi_idle
			o_game.players_[1].character  = Musashi
			break;
	}
}
