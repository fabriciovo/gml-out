/// @description Insert description here
enum options {
	battle,
	coop,
}

menu_color_ = make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = make_color_rgb(126, 127, 81); //58, 173, 133

option_[options.battle] = "Battle";
option_[options.coop] = "Co op Game";
option_length_ = array_length_1d(option_);

index_ = options.battle;