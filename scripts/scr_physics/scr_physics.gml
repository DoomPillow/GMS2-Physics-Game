
function collision_manifold(_o1, _o2, _normal, _pen, _cp) constructor {
	o1 = _o1;
	o2 = _o2;
	normal = _normal;
	pen = _pen;
	cp = _cp;
	
	resolve_penetration = function() {
		var pen_resolution = vec_multiply(normal, pen / (o1.inv_mass + o2.inv_mass));
		show_debug_message(pen_resolution)
		o1.local_position = vec_sum(o1.local_position, vec_multiply(pen_resolution, o1.inv_mass) );
		o2.local_position = vec_sum(o2.local_position, vec_multiply(pen_resolution, -o2.inv_mass) );
		//o1.position = vec_subtract(o1.local_position, global.world_position);
		//o2.position = vec_subtract(o2.local_position, global.world_position);
	}
	
	resolve_collision = function() {
		//var _points = vec_subtract(cp, o1.components[0].local_position);
		//var _normal = vec_normalize(vec_subtract(_points[0], _points[1]));
	
		// Closing velocity
		//show_message($"{cp}\n {o1.local_position} \n {o1.position}")
		var col_arm1 = vec_subtract(cp, o1.local_position);
		var rot_vel1 = new vector(-o1.angular_velocity * col_arm1.y, o1.angular_velocity * col_arm1.x);
		var clos_vel1 = vec_sum(o1.velocity, rot_vel1);
	
		var col_arm2 =vec_subtract(cp, o2.local_position);
		var rot_vel2 = new vector(-o2.angular_velocity * col_arm2.y, o2.angular_velocity * col_arm2.x);
		var clos_vel2 = vec_sum(o2.velocity, rot_vel2);
	
		// Impulse augmentation
		var imp_aug1 = vec_cross(col_arm1, normal);
		imp_aug1 = imp_aug1 * o1.inv_inertia * imp_aug1;
		var imp_aug2 = vec_cross(col_arm2, normal);
		imp_aug2 = imp_aug2 * o2.inv_inertia * imp_aug2;
	
		var _relVel = vec_subtract(clos_vel1, clos_vel2);
		var _sepVel = vec_dot(_relVel, normal);
		var _new_sepVel = -_sepVel * mean(o1.elasticity, o2.elasticity);
		var _vsep_diff = _new_sepVel - _sepVel;
	
		var _impulse = _vsep_diff / (o1.inv_mass + o2.inv_mass + imp_aug1 + imp_aug2);
		var _impulseVec = vec_multiply(normal, _impulse);
	
		// Change velocities
		o1.velocity = vec_sum(o1.velocity, vec_multiply(_impulseVec, o1.inv_mass));
		o2.velocity = vec_sum(o2.velocity, vec_multiply(_impulseVec, -o2.inv_mass));
	
		o1.angular_velocity += o1.inv_inertia * vec_cross(col_arm1, _impulseVec)
		o2.angular_velocity -= o2.inv_inertia * vec_cross(col_arm2, _impulseVec);
		//show_message( o2.inv_inertia * vec_cross(col_arm2, _impulseVec));
		
		//
		//o1.position = vec_subtract(o1.local_position, global.world_position);
		//o2.position = vec_subtract(o2.local_position, global.world_position);
	}
	
}
