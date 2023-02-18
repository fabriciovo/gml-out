event_user(0)
event_user(1)

if o_game.players_[0].character != noone && o_game.players_[1].character != noone {
	room_goto(rm_battle)
}