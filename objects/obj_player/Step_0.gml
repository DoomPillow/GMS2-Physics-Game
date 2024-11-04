/// @description

event_inherited();

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	var _a_input = keyboard_check(ord("E")) - keyboard_check(ord("Q"));
	
	accel = new vector(_x_input, _y_input);
	angular_velocity += _a_input * 0.005;
	
	if _x_input != 0 {
		image_xscale = _x_input;
		sprite_index = onfloor ? spr_player_walk : spr_player_jump;
	} else {
		sprite_index = onfloor ? spr_player : spr_player_jump;
	}
	
}

onfloor = collision_line(position.x - 12,position.y + 19, position.x + 12, position.y + 19, par_fronttile, true, true) != noone;
onwall = position_meeting(position.x,position.y, par_backtile);

if onfloor {
	coyote = 10;
} else {
	coyote -= 1;	
}

if onwall {
	velocity.y += 0.35;
}

if keyboard_check_pressed(vk_space) && coyote > 0 {
	velocity.y = -10;
	coyote = 0;
}

angle += angular_velocity;
angular_velocity *= 0.95;

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity = vec_multiply(velocity, 1 - fric);

if onwall {
	velocity.x = clamp(velocity.x, -8,8);	
	velocity.y = clamp(velocity.y, -8,16);	
} else {
	velocity.x = clamp(velocity.x, -30,30);	
	velocity.y = clamp(velocity.y, -30,30);		
}
