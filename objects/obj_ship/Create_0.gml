/// @description

event_inherited();

components = [
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:0, yoff:0 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:0 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:64, yoff:0 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-32, yoff:0, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-64, yoff:0, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-64, yoff:32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:64, yoff:32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-32, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:0, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:-64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	instance_create_layer(x,y,layer,obj_rectangle, {xoff:64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32})
];

following = false;

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	
	local_position = vec_sum(local_position, vec_multiply(velocity, keyboard_check(vk_shift) ? 1000 : 1));
	position = vec_subtract(local_position, global.world_position)
	
	for (var i = 0; i < array_length(components); i++) {
		
		var _off = 180 - point_direction(position.x + components[i].xoff, position.y + components[i].yoff, position.x, position.y);
		var _dist = point_distance(position.x + components[i].xoff, position.y + components[i].yoff, position.x, position.y);
		
		components[i].angle = angle;
		components[i].position.x = position.x + lengthdir_x(_dist, _off - radtodeg(angle)); //((components[0].dir.x) * components[0].length);
		components[i].position.y = position.y + lengthdir_y(_dist, _off - radtodeg(angle));//((components[0].dir.y) * components[0].length);
		components[i].get_vertices();
	}
	
}

inertia = 5 * array_length(components) * mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/12);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angular_velocity = 0;

thrust_speed = 1

bbox = get_bbox();