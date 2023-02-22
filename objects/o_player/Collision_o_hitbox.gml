/// @description Insert description here
// You can write your code in this editor
if hit_stun_ exit
hit_stun_ = true
state_ = player_state.hit_stun
hit_power_++
hsp_ = 0.1 * hit_power_ * other.image_xscale
hit_ = true

alarm[0] = 10
