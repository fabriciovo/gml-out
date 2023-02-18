/// @description Insert description here
// You can write your code in this editor
if room == rm_init {
	room_goto(rm_title)
}

if room == rm_battle {
	for(var _i = 0; _i < players_length_; _i++){
		instance_create_layer(x+128*_i,y,"Instances", o_player, new players_[_i].character(players_[_i].input))
	}
}