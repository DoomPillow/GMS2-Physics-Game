/// @description

/// Delta Stuff
global.delta = delta_time / 1000000 * global.target_fps * global.timescale;
global.time += global.delta;

// Gui Stuff
array_pop(fps_avg);
array_insert(fps_avg, 0, fps_real);	



////// vvv TEMP STUFF
//global.world_position.x += 10 * (keyboard_check(vk_right) - keyboard_check(vk_left))
//global.world_position.y += 10 * (keyboard_check(vk_down) - keyboard_check(vk_up))
//global.world_position = vec_sum(obj_ship.local_position, new vector(-1500, -900));
////// ^^^ TEMP STUFF

// Make background and particles move in the new coordinate system
part_system_position(global.particle_system, -global.world_position.x, -global.world_position.y);
var back_id = layer_get_id("Background");
layer_x(back_id, -global.world_position.x);
layer_y(back_id, -global.world_position.y);

/// Physics stuff
for (var i = 0; i < array_length(BODIES); i++) {	
	with BODIES[i] {
		
		reposition();

	}
}

overlapping_bboxes = 0; // Debug only
// Loop through each physics object...
for (var i = 0; i < array_length(BODIES); i++) {
	with BODIES[i] {
		
		// For each physics object, loop through evey other physics object...
		for (var body_pair = i+1; body_pair < array_length(other.BODIES); body_pair++) {
			
			// Root out things that obviously don't collide using the bboxes
			var _bbox1 = other.BODIES[i].bbox;
			var _bbox2 = other.BODIES[body_pair].bbox;
			if !rectangle_in_rectangle(_bbox1[0], _bbox1[1], _bbox1[2], _bbox1[3], _bbox2[0], _bbox2[1], _bbox2[2], _bbox2[3]) {
				continue	
			}
			other.overlapping_bboxes ++; // Debug only
			
			// Full SAT check
			var mtv = {pen: -1, axis: -1, cont: -1};
			
			// Loop through all of the components of the second object for every component in the first...
			for (var o1_comp = 0; o1_comp < array_length(other.BODIES[i].components); o1_comp++) {
				for (var o2_comp = 0; o2_comp < array_length(other.BODIES[body_pair].components); o2_comp++) {
					
					// Continue if not on the same collision layer
					if other.BODIES[i].components[o1_comp].collision_layer != other.BODIES[body_pair].components[o2_comp].collision_layer {
						continue;	
					}
					
					// Perform breadth-distance broad phase
					if point_distance(other.BODIES[i].components[o1_comp].position.x, other.BODIES[i].components[o1_comp].position.y, other.BODIES[body_pair].components[o2_comp].position.x, other.BODIES[body_pair].components[o2_comp].position.y) > (other.BODIES[i].components[o1_comp].breadth + other.BODIES[body_pair].components[o2_comp].breadth) {
						continue;	
					}
					
					// Perform the separating axis theorem func to see if they are colliding
					var _colliding = other.sat(other.BODIES[i].components[o1_comp], other.BODIES[body_pair].components[o2_comp]);
					if _colliding != false {
						// Since an object may be colliding with multiple components at a time, take the mtv with the greatest magnitude
						// This should probably be replaced with a method that can find an mtv that spans across multiple components, as objects can still get stuck if their components overlap enough.
						if _colliding.pen > mtv.pen {
							// Set minimum translation vector
							mtv = _colliding;
						}
					}
				}
			}
			
			if mtv.pen != -1 { // The penetration being -1 is not exactly what's important, this just makes sure there is actually a collision
				array_push( other.COLLISIONS, new collision_manifold( other.BODIES[i], other.BODIES[body_pair], mtv.axis, mtv.pen, mtv.cont));
				array_push( other.contact_vertices, mtv); /// <---- only for the debug overlay. Not necessary for the collision.
			}
			
		}
	}
}


// Resolve each collision
for (var i = 0; i < array_length(COLLISIONS); i++) {
	COLLISIONS[i].resolve_penetration();
	COLLISIONS[i].resolve_collision();
}



// reset array at the end of every frame
num_collisions = array_length(COLLISIONS);
COLLISIONS = [];