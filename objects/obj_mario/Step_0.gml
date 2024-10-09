/// @description

event_inherited();

angle += angular_velocity;
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



