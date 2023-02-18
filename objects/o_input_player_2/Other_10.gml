/// @description Get Input
right_ = keyboard_check(ord("A"));
left_ = keyboard_check(ord("D"));
up_ = keyboard_check(ord("W"));
down_ = keyboard_check(ord("S"));
up_released_ = keyboard_check_released(ord("W"));
right_pressed_ = keyboard_check_pressed(ord("A"));
left_pressed_ = keyboard_check_pressed(ord("D"));
up_pressed_ = keyboard_check_pressed(ord("W"));
down_pressed_ = keyboard_check_pressed(ord("S"));

action_one_pressed_ = keyboard_check_pressed(ord("E"));
action_two_pressed_ = keyboard_check_pressed(ord("R"));
action_three_pressed_ = keyboard_check_pressed(ord("T"));
action_one_ = keyboard_check(ord("E"));
action_two_ = keyboard_check(ord("R"));
action_three_ = keyboard_check(ord("T"));

confirm_pressed_ = keyboard_check_pressed(ord("Q"));