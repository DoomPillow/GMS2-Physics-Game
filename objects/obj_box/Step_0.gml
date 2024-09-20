/// @description

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("W")) - keyboard_check(ord("S"));
	
	accel = vec_multiply(components[0].dir, _y_input);
	angular_velocity += _x_input * 0.005;
	
}

components[0].angle += angular_velocity;
angular_velocity *= 0.95;

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity = vec_multiply(velocity, 1 - fric);
