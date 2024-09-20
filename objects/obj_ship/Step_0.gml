/// @description

if movy {
	
	var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var _y_input = keyboard_check(ord("W")) - keyboard_check(ord("S"));
	
	accel = vec_multiply(new vector(lengthdir_x(1, radtodeg(-components[0].angle) + 90), lengthdir_y(1, radtodeg(-components[0].angle) + 90)), _y_input);
	angular_velocity += _x_input * 0.003;
	
	if _y_input != 0 {
		part_type_direction(global.pt_thrust1, radtodeg(-components[0].angle) - 15 - 90, radtodeg(-components[0].angle) + 15 - 90, 0, 0);
		part_particles_create(global.particle_system, components[0].position.x - 16 + lengthdir_x(14, radtodeg(-components[0].angle) - 90), components[0].position.y - 16 + lengthdir_y(14, radtodeg(-components[0].angle) - 90), global.pt_thrust1, 2);	
	}
	
} else {
	if keyboard_check_pressed(vk_control) {
		following = !following;	
	}
	
	var _oinking = 0;
	
	if following {
		
		var _dir = point_direction(components[0].position.x, components[0].position.y, mouse_x, mouse_y);//global.hog.components[0].position.x, global.hog.components[0].position.y);
		
		var _diff = angle_difference(_dir, 90 + radtodeg(-components[0].angle));
		
		if abs(_diff) > 30 {
			angular_velocity += (0.002 + ((360-_diff) / 72000)) * -sign(_diff);
		} else if point_distance(components[0].position.x, components[0].position.y, mouse_x, mouse_y) > 350 {
			part_type_direction(global.pt_thrust2, radtodeg(-components[0].angle) - 15 - 90, radtodeg(-components[0].angle) + 15 - 90, 0, 0);
			part_particles_create(global.particle_system, components[0].position.x - 16 + lengthdir_x(14, radtodeg(-components[0].angle) - 90), components[0].position.y - 16 + lengthdir_y(14, radtodeg(-components[0].angle) - 90), global.pt_thrust2, 2);	
			_oinking = 1;
		}
		
	}
	
	accel = vec_multiply(new vector(lengthdir_x(1, radtodeg(-components[0].angle) + 90), lengthdir_y(1, radtodeg(-components[0].angle) + 90)), _oinking);
}

components[0].angle += angular_velocity;
angular_velocity *= 0.95;

accel = vec_multiply(vec_normalize(accel), acceleration * global.delta);
velocity = vec_sum(velocity, accel);
velocity = vec_multiply(velocity, 1 - fric);


//var _rot_mat = rotation_matrix(angle);
//dir = mat_multiply_vec(_rot_mat, refdir);
//
//vertex[0] = vec_sum(vec_sum( position, vec_multiply(dir, -length*0.5)), vec_multiply( vec_normal(dir), width*0.5));
//vertex[1] = vec_sum(vec_sum( position, vec_multiply(dir, -length*0.5)), vec_multiply( vec_normal(dir), -width*0.5));
//vertex[2] = vec_sum(vec_sum( position, vec_multiply(dir, length*0.5)), vec_multiply( vec_normal(dir), -width*0.5));
//vertex[3] = vec_sum(vec_sum( position, vec_multiply(dir, length*0.5)), vec_multiply( vec_normal(dir), width*0.5));