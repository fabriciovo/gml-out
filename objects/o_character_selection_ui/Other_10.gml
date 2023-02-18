/// @description Player 1 input
var _last_index_1 = index_player_1;
if o_input_player_1.left_pressed_ {
	index_player_1 = max(--index_player_1, 0);
} else if o_input_player_1.right_pressed_ {
	index_player_1 = min(++index_player_1, option_length_-1);
}

if _last_index_1 != index_player_1 {
	//audio_play_sound(a_menu_move, 1, false);	
}

if o_input_player_1.confirm_pressed_ {
	switch (index_player_1) {
		case characters.cody:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_1.sprite_index = s_cody_idle
			o_game.players_[0].character = Cody
		break;
		
		case characters.cyber_girl:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_1.sprite_index = s_cyber_girl_idle
			o_game.players_[0].character  = CyberGirl
		break;
		
		case characters.musashi:
			//audio_play_sound(a_menu_select, 3, false);
			i_character_select_1.sprite_index = s_musashi_idle
			o_game.players_[0].character  = Musashi
		break;
	}
}
