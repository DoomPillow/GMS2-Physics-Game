/// @description

/////// INIT
global.particle_system = part_system_create();

//// Gui Stuff
fps_avg = [];
repeat(200) {
	array_push(fps_avg,0);	
}

//// Time / Delta stuff
global.time = 0;
global.target_fps = 60;
global.timescale = 1;
global.delta = 0;

// End init stage
room_goto_next();

////////////////////////////////////////////////////////

BODIES = []; // Array containing all physics objects
COLLISIONS = []; // Contains collision manifolds to be resolved

num_collisions = 0; //// Purely for the debug info
contact_vertices = []; //// Also only for debugging

// Separating axis theorem functions
function project_shape_onto_axis(axis, obj) {
	
	set_ball_vertices_along_axis(obj, axis);
	
	var _min = vec_dot(axis, obj.vertex[0]);
	var _max = _min;
	var col_vertex = obj.vertex[0];
	
	for (var i = 0; i < array_length(obj.vertex); i++) {
		var p = vec_dot(axis, obj.vertex[i]);
		if p < _min {
			_min = p;
			col_vertex = obj.vertex[i];
		}
		if p > _max {
			_max = p;	
		}
	}
	
	return {
		_min: _min,	
		_max: _max,
		col_vertex: col_vertex
	}
}

function find_axes(o1, o2) {
	var axes = [];
	if o1.object_index == obj_circle && o2.object_index == obj_circle {
		array_push( axes, vec_normalize(vec_subtract(o2.position, o1.position)) );
		return axes;
	}
	if o1.object_index == obj_circle {
		array_push(axes, vec_normalize(vec_subtract(closest_vertex_to_point(o2, o1.position), o1.position)));	
		array_push(axes, vec_normal(o2.dir) );
		if (o2.object_index == obj_rectangle) {
			array_push(axes, o2.dir);	
		}
		return axes;
	}
		
	if o2.object_index == obj_circle {
		array_push(axes, vec_normal(o1.dir) );
		if (o1.object_index == obj_rectangle) {
			array_push(axes, o1.dir);	
		}
		array_push(axes, vec_normalize(vec_subtract(closest_vertex_to_point(o1, o2.position), o2.position)));
		return axes;

	}
	
	array_push(axes, vec_normal(o1.dir) );
	array_push(axes, o1.dir );
	array_push(axes, vec_normal(o2.dir) );
	array_push(axes, o2.dir );
	return axes;
}

function closest_vertex_to_point(obj, p) {
	var _closest_vertex;
	var _min_dist = 999;

	for (var i = 0; i < array_length(obj.vertex); i++) {
		if vec_magnitude(vec_subtract(p, obj.vertex[i])) < _min_dist || _min_dist == 999 {
			_closest_vertex = obj.vertex[i];
			_min_dist = vec_magnitude(vec_subtract(p, obj.vertex[i]));
		}
	}
	
	return _closest_vertex;
}

function set_ball_vertices_along_axis(obj, axis) {
	if obj.object_index == obj_circle {
		obj.vertex[0] = vec_sum(obj.position, vec_multiply(vec_normalize(axis), -obj.radius) );	
		obj.vertex[1] = vec_sum(obj.position, vec_multiply(vec_normalize(axis), obj.radius) );	
	}
}

function sat(o1, o2) {

	var _min_overlap = 999;
	var smallest_axis;
	var vertex_obj;
	
	var axes = find_axes(o1, o2); 

	var proj1, proj2 = 0;
	
	for (var i = 0; i < array_length(axes); i++) {
		proj1 = project_shape_onto_axis(axes[i], o1);
		proj2 = project_shape_onto_axis(axes[i], o2);
		var _overlap = min(proj1._max, proj2._max) - max(proj1._min, proj2._min);
		if _overlap < 0 {
			return false;	
		}
		
		if (proj1._max > proj2._max && proj1._min < proj2._min) ||
		   (proj1._max < proj2._max && proj1._min > proj2._min) {
			var _mins = abs(proj1._min - proj2._min);
			var _maxs = abs(proj1._max - proj2._max);
			if _mins < _maxs {
				_overlap += _mins;	
			} else {
				_overlap += _maxs;
				axes[i] = vec_multiply( axes[i], -1 );
			}
		}
		
		if _overlap < _min_overlap || _min_overlap == 999 {
			_min_overlap = _overlap;
			smallest_axis = axes[i];
			if i < (o1.object_index == obj_circle ? 1 : 2) {
				vertex_obj = o2;
				if proj1._max > proj2._max {
					smallest_axis = vec_multiply(axes[i], -1);
				}	
			} else {
				vertex_obj = o1;
				if proj1._max < proj2._max {
					smallest_axis = vec_multiply(axes[i], -1);
				}	
			}
		}
		
	}

	var contact_vertex = project_shape_onto_axis(smallest_axis, vertex_obj).col_vertex; /// Gms2 says col vertex is only refrenced once... not true. See line 46
	
	if vertex_obj == o2 {
		smallest_axis = vec_multiply(smallest_axis, -1);	
	}
	
	return {
		pen: _min_overlap,
		axis: smallest_axis,
		cont: contact_vertex
	};
}