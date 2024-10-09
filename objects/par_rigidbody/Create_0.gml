/// @description

array_push(controller.BODIES, id);

components = [];
local_position = new vector(x, y);
position = vec_subtract(local_position, global.world_position);
inv_mass = 0;
inertia = 0;
inv_inertia = 0;
bbox = []

velocity = new vector(vx, vy);
accel = new vector(0, 0);
acceleration = 1;

angle = 0;
angular_velocity = 0;
fric = 0.015;

get_bbox = function() {
	
	var _bbox = [components[0].position.x, components[0].position.y, components[0].position.x, components[0].position.y]
	
	for (var i = 0; i < array_length(components); i++) {
		// If rectangle, find max position for each vertex
		if components[i].object_index == obj_rectangle {
			for (var j = 0; j < array_length(components[i].vertex); j++) {
				if components[i].vertex[j].x < _bbox[0] { _bbox[0] = components[i].vertex[j].x}	
				if components[i].vertex[j].y < _bbox[1] { _bbox[1] = components[i].vertex[j].y}	
				if components[i].vertex[j].x > _bbox[2] { _bbox[2] = components[i].vertex[j].x}	
				if components[i].vertex[j].y > _bbox[3] { _bbox[3] = components[i].vertex[j].y}
			}
		} else { // Otherwise, it's a ball, so check the position of the ball plus its radius

			if (components[i].position.x - components[i].radius) < _bbox[0] { _bbox[0] = components[i].position.x - components[i].radius }
			if (components[i].position.y - components[i].radius) < _bbox[1] { _bbox[1] = components[i].position.y - components[i].radius }
			if (components[i].position.x + components[i].radius) > _bbox[2] { _bbox[2] = components[i].position.x + components[i].radius }
			if (components[i].position.y + components[i].radius) > _bbox[3] { _bbox[3] = components[i].position.y + components[i].radius }
				
		}
	}
	
	//
	return _bbox
}