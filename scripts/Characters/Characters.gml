// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Characters(_input) constructor {

	input_ = _input
	state_ = player_state.idle
	sprite_[player_state.idle] = s_cyber_girl_idle
	sprite_[player_state.run] = s_cyber_girl_run

	sprite_index = sprite_[state_]
	create_method = function(){		
		enum player_state {
			idle,
			run,
			jump,
			fall,
			attack,
			special,
			hit_stun,
			dash
		}

		grav_ = 0.2;
		jump_ = 5;
		hsp_ = 0; 
		vsp_ = 0;
		acc_ = 0.3
		max_speed_ = 2
		grounded_ = false
		hit_stun_ = false
		hit_ = false
		hit_power_ = 0
		hit_dir_ = -1
		dash_distance_ = 60
		can_dash_ = true
		can_jump_ = true
		dash_time_ = 12
	}
	
	step_method = function(){
		if(!place_meeting(x, y+1, o_solid)){
			if hit_ {
				vsp_ += grav_ * 2
			}else{
				vsp_ += grav_;
			}
			    if(input_.up_released_ && vsp_ < -6){
				 can_jump_ = false
				 vsp_ = -jump_/2
			    }
				
				grounded_ = false
			}else{ 
			    vsp_ = 0
				
			    if(input_.up_){
				   
			       vsp_ = -jump_
			    }

				grounded_ = true

			}

		if can_dash_ && input_.dash_pressed_ {
			can_dash_ = false
			alarm[1] = 120 
			if (input_.right_ - input_.left_) == 0 && grounded_{
				hsp_dash_ = image_xscale
			}else {
				hsp_dash_ = input_.right_ - input_.left_
			}
			
			_dash_direction = point_direction(0,0,hsp_dash_,input_.down_ - input_.up_)
			_dash_speed = dash_distance_ / dash_time_
			_dash_energy = dash_distance_
			state_ = player_state.dash
		}
		
		if state_ == player_state.dash {
			hsp_ = lengthdir_x(_dash_speed , _dash_direction)
			vsp_ = lengthdir_y(_dash_speed,  _dash_direction)
			
			with (instance_create_depth(x,y,depth+1,o_dash_effect)){
				sprite_index = other.sprite_index
				image_blend = c_fuchsia
				image_alpha = 0.7
			}
			
			
			_dash_energy -= _dash_speed;
			if _dash_energy <= 0 {
				state_ = player_state.idle
			}
		}
		else if state_ == player_state.attack  {
			if grounded_ {
				apply_friction(acc_)
			}
			
		}
		else if state_ == player_state.hit_stun {
			if hit_ {
				hit_ = false
				vsp_ = -hit_power_ 	
				hsp_ = hit_power_ * hit_dir_
			}
			
			if !grounded_ && hit_power_ > 4{
				image_angle += 23
			}			
			
			apply_friction(acc_)
					
		} else  if state_ == player_state.idle 
		|| state_ == player_state.run  
		|| state_ == player_state.jump 
		|| state_ == player_state.fall {
			if(input_.right_ || input_.left_){
			    hsp_ += (input_.right_ - input_.left_)*acc_
			}else {
				apply_friction(acc_)
			}
			
			
			if !grounded_ && vsp_ > 0 {
				image_speed = 0
				state_ = player_state.fall

			} else if !grounded_ && vsp_ < 0 {

				image_speed = 0
				state_ = player_state.jump

			}
			else if (hsp_ != 0 && grounded_) {
				image_xscale = sign(hsp_)
				state_ = player_state.run
				image_speed= 0.6
			}else {
				state_ = player_state.idle
				image_speed = 0
			}
			if input_.action_two_pressed_ {
				state_ = player_state.attack
				var _hitbox = instance_create_layer(x+13*image_xscale,y-6,"Instances",o_hitbox)
				_hitbox.image_xscale = image_xscale
				image_speed = .2
			 
			}else if input_.action_one_pressed_ {
				state_ = player_state.special
				image_speed = .4
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
			
			if state_ != player_state.dash{
				if(hsp_ > max_speed_) hsp_ = max_speed_
				if(hsp_ < -max_speed_) hsp_ = -max_speed_ 
			}
			y+= vsp_
			x+= hsp_
			sprite_index = sprite_[state_]
	}
	
	hitbox_collision_method = function(){
		if hit_stun_ exit
		hit_stun_ = true
		state_ = player_state.hit_stun
		hit_power_++
		hit_dir_ = other.image_xscale
		hit_ = true
		alarm[0] = 20
	}


}


function CyberGirl(_input) : Characters(_input) constructor {
	sprite_[player_state.idle] =s_cyber_girl_idle
	sprite_[player_state.run] = s_cyber_girl_run
	sprite_[player_state.jump] = s_cyber_girl_run
	sprite_[player_state.fall] = s_cyber_girl_run
	sprite_[player_state.attack] = s_cyber_girl_run
	sprite_[player_state.special] = s_cyber_girl_run
	sprite_[player_state.hit_stun] = s_cyber_girl_idle
	state_ = player_state.idle
	sprite_index = sprite_[state_]
}

function Cody(_input) : Characters(_input) constructor {
	sprite_[player_state.idle] = s_cody_idle
	sprite_[player_state.run] = s_cody_run
	sprite_[player_state.jump] = s_cody_jump
	sprite_[player_state.fall] = s_cody_fall
	sprite_[player_state.attack] = s_cody_attack
	sprite_[player_state.special] = s_cody_special
	sprite_[player_state.hit_stun] = s_cody_idle
	sprite_[player_state.dash] = s_cody_run
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