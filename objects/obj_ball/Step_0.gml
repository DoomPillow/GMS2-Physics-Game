/// @description

event_inherited();

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	accel.x = _x_input;
	accel.y = _y_input;

	if mouse_check_button_pressed(mb_left) {
		local_position.x = mouse_x;	
		local_position.y = mouse_y;	
	}

}

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity = vec_multiply(velocity, 0.94);
