// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Characters(_input) constructor {
	input_ = _input
	state_ = player_state.idle
	sprite_[player_state.idle] =s_cyber_girl_idle
	sprite_[player_state.run] = s_cyber_girl_run
	
	sprite_index = sprite_[state_]
	create_method = function(){		
		enum player_state {
			idle,
			run,
			jump,
			attack,
			special,
		}
		grav_ = 0.2;
		jump_ = 5;
		hsp_ = 0; 
		vsp_ = 0;
		acc_ = 0.3
		max_speed_ = 3
		grounded_ = false
		hit_stun_ = false

	}
	
	step_method = function(){
		if(!place_meeting(x, y+1, o_solid)){
			    vsp_ += grav_;
			    image_speed = 0
			    image_index = (vsp_ > 0)

			    if(input_.up_released_ && vsp_ < -6){
				 vsp_ = -jump_/2
			    }
			}else{ 
			    vsp_ = 0
			    if(input_.up_){
			       vsp_ = -jump_
			    }
			}

		if state_ == player_state.idle || state_ == player_state.run {
			if(input_.right_ || input_.left_){
			    hsp_ += (input_.right_ - input_.left_)*acc_
			    var _hsp_dir = input_.right_ - input_.left_

			    if(hsp_ > max_speed_) hsp_ = max_speed_
			    if(hsp_ < -max_speed_) hsp_ = -max_speed_ 
			}else { 
			    apply_friction(acc_)
			}

			if(hsp_ != 0){
			    image_xscale = sign(hsp_)
				state_ = player_state.run
				image_speed= 0.6
			}else{
				state_ = player_state.idle
				image_speed = 1
			}

			if input_.action_one_pressed_ {
				state_ = player_state.attack
				image_speed = .6
			}else if input_.action_two_pressed_ {
				state_ = player_state.special
				image_speed = .6
			}
		
		}

			//Horizontal Collisions
			if (place_meeting(x+hsp_,y, o_solid)){
			    while(!place_meeting(x+sign(hsp_),y,o_solid)){ 
			        x += sign(hsp_)
			    }
			    hsp_ = 0
			}

			//Vertical Collisions
			if (place_meeting(x,y+vsp_, o_solid)){
			    while(!place_meeting(x,y+sign(vsp_),o_solid)){ 
			        y += sign(vsp_)
			    }
			    vsp_ = 0
			}
	
			sprite_index = sprite_[state_]
			y+= vsp_
			x+= hsp_
	}
}


function CyberGirl(_input) : Characters(_input) constructor {
	sprite_[player_state.idle] =s_cyber_girl_idle
	sprite_[player_state.run] = s_cyber_girl_run
	sprite_[player_state.attack] = s_cody_attack
	sprite_[player_state.special] = s_cody_special
	state_ = player_state.idle
	sprite_index = sprite_[state_]
}

function Cody(_input) : Characters(_input) constructor {
	sprite_[player_state.idle] = s_cody_idle
	sprite_[player_state.run] = s_cody_run
	sprite_[player_state.jump] = s_cody_jump
	sprite_[player_state.attack] = s_cody_attack
	sprite_[player_state.special] = s_cody_special
	state_ = player_state.idle
	sprite_index = sprite_[state_]
}

function Musashi(_input) : Characters(_input) constructor {
	sprite_[player_state.idle] =s_musashi_idle
	sprite_[player_state.run] = s_musashi_run
	sprite_[player_state.attack] = s_cody_jump
	sprite_[player_state.special] = s_cody_jump
	state_ = player_state.idle
	sprite_index = sprite_[state_]
}