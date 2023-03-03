/// @description Get Input
right_ = keyboard_check(vk_right);
left_ = keyboard_check(vk_left);
up_ = keyboard_check(vk_up);
down_ = keyboard_check(vk_down);

up_released_ = keyboard_check_released(vk_up);
right_pressed_ = keyboard_check_pressed(vk_right);
left_pressed_ = keyboard_check_pressed(vk_left);
up_pressed_ = keyboard_check_pressed(vk_up);
down_pressed_ = keyboard_check_pressed(vk_down);
dash_pressed_ = keyboard_check_pressed(vk_shift);

action_one_pressed_ = keyboard_check_pressed(ord("X"));
action_two_pressed_ = keyboard_check_pressed(ord("Z"));
action_three_pressed_ = keyboard_check_pressed(ord("C"));
action_one_ = keyboard_check(ord("X"));
action_two_ = keyboard_check(ord("Z"));
action_three_ = keyboard_check(ord("C"));

confirm_pressed_ = keyboard_check_pressed(vk_enter);