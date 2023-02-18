/// @description Insert description here
enum characters {
	cody,
	cyber_girl,
	musashi
}

menu_color_ = make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = make_color_rgb(126, 127, 81); //58, 173, 133

option_[characters.cody] = s_cody_idle;
option_[characters.cyber_girl] = s_cyber_girl_idle;
option_[characters.musashi] = s_musashi_idle;
option_length_ = array_length_1d(option_);

index_player_1 = characters.cody;
index_player_2 = characters.cyber_girl;


