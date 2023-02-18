draw_set_halign(fa_center);
for (var _i=0; _i<option_length_; _i++) {
	if _i == index_player_1 {
		draw_sprite(s_arrow_p1,1,o_game.screen_width/3.3+_i*68, o_game.screen_height / 2-34);
		draw_sprite(option_[_i],1,o_game.screen_width/3.3+_i*68, o_game.screen_height / 2);
		i_character_select_1.sprite_index = option_[_i]
	}
	if _i == index_player_2 {
		draw_sprite(s_arrow_p2,1,o_game.screen_width/3.3+_i*68+12, o_game.screen_height / 2-34);
		draw_sprite(option_[_i],1,o_game.screen_width/3.3+_i*68, o_game.screen_height / 2);
		i_character_select_2.sprite_index = option_[_i]
	}
	if _i != index_player_1 && _i != index_player_2 {
		draw_sprite(option_[_i],0,o_game.screen_width/3.3+_i*68, o_game.screen_height / 2);
	}

}
draw_set_color(c_white);
draw_set_halign(fa_left);