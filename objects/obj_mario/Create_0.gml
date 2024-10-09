/// @description

event_inherited();

components = load_object_from_sprite(sprite_index, irandom(5))

_centerx = 0;
_centery = 0;
for (var i = 0; i < array_length(components); i++) {
	_centerx += components[i].xoff;
	_centery += components[i].yoff;
}
	
_centerx /= array_length(components);
_centery /= array_length(components);
	
for (var i = 0; i < array_length(components); i++) {
	components[i].xoff -= _centerx;
	components[i].yoff -= _centery;
}

inv_mass = mass == 0 ? 0 : 1 / mass;


reposition = function() {
	
	local_position = vec_sum(local_position, vec_multiply(velocity, 1));
	position = vec_subtract(local_position, global.world_position);
	
	//components[0].position = vec_sum(components[0].position, velocity);
	//components[0].get_vertices();	
	
	for (var i = 0; i < array_length(components); i++) {
		
		var _dongus = 180 - point_direction(position.x + components[i].xoff, position.y + components[i].yoff, position.x, position.y);
		var _dist = point_distance(position.x + components[i].xoff, position.y + components[i].yoff, position.x, position.y);
		
		components[i].angle = angle;
		components[i].position.x = position.x + lengthdir_x(_dist, _dongus - radtodeg(angle)); //((components[0].dir.x) * components[0].length);
		components[i].position.y = position.y + lengthdir_y(_dist, _dongus - radtodeg(angle));//((components[0].dir.y) * components[0].length);
		components[i].get_vertices();
	}
	
}

inertia = 5 * array_length(components) * mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/18);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angular_velocity = 0;

bbox = get_bbox();