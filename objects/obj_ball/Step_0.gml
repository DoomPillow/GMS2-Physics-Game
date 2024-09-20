/// @description

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	accel.x = _x_input;
	accel.y = _y_input;

}

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity = vec_multiply(velocity, 1 - fric);

