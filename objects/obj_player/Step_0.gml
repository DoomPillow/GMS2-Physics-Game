/// @description

event_inherited();

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	var _a_input = keyboard_check(ord("E")) - keyboard_check(ord("Q"));
	
	accel = new vector(_x_input, _y_input);
	angular_velocity += _a_input * 0.005;
	
}

velocity.y += 0.1;

angle += angular_velocity;
angular_velocity *= 0.95;

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity.x = clamp(velocity.x, -8,8);
velocity.y = max(velocity.y, -15);
velocity = vec_multiply(velocity, 1 - fric);
