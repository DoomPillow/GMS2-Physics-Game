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
	
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:-32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:-64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:-32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:32, yoff:-32, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:-64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
	//instance_create_layer(x,y,layer,obj_rectangle, {xoff:64, yoff:-64, vertex: [new vector(x, y), new vector(x+32, y)], width: 32}),
];

following = false;

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	components[0].position = vec_sum(components[0].position, velocity);
	components[0].get_vertices();	
	
	for (var i = 1; i < array_length(components); i++) {
		
		var _dongus = 180 - point_direction(components[0].position.x + components[i].xoff, components[0].position.y + components[i].yoff, components[0].position.x, components[0].position.y);
		var _dist = point_distance(components[0].position.x + components[i].xoff, components[0].position.y + components[i].yoff, components[0].position.x, components[0].position.y);
		
		components[i].angle = components[0].angle;
		components[i].position.x = components[0].position.x + lengthdir_x(_dist, _dongus - radtodeg(components[0].angle)); //((components[0].dir.x) * components[0].length);
		components[i].position.y = components[0].position.y + lengthdir_y(_dist, _dongus - radtodeg(components[0].angle));//((components[0].dir.y) * components[0].length);
		components[i].get_vertices();
	}
	
}

inertia = 5 * array_length(components) * mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/12);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angle = 0;
angular_velocity = 0;

thrust_speed = 1

bbox = get_bbox();