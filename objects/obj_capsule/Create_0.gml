/// @description

event_inherited();

startpoint = new vector(x,y);
endpoint = new vector(x+200,y);

components = [instance_create_layer(startpoint.x, startpoint.y,layer,obj_circle, {position: startpoint, radius: radius}), instance_create_layer(endpoint.x, endpoint.y,layer,obj_circle, {position: endpoint, radius: radius})];

var rec_v1 = vec_sum(components[1].position, vec_multiply(vec_normal(vec_normalize(vec_subtract(components[1].position, components[0].position))), radius) );
var rec_v2 = vec_sum(components[0].position, vec_multiply(vec_normal(vec_normalize(vec_subtract(components[1].position, components[0].position))), radius) );

array_insert(components, 0, instance_create_layer(x, y, layer, obj_rectangle, {vertex: [rec_v1,rec_v2], width: radius*2}));


inv_mass = mass == 0 ? 0 : 1 / mass;

acceleration = 1;
accel = new vector(0,0);
velocity = new vector(0,0);

inertia = mass * (power(2*components[0].width, 2) + power(components[0].length+2*components[0].width, 2)) / 12;
inv_inertia = inertia == 0 ? 0 : 1 / inertia;


angle = 0;

reposition = function() {
	components[0].position = vec_sum(components[0].position, velocity);
	components[0].angle = angle;
	components[0].get_vertices();
	components[1].position = vec_sum( components[0].position, vec_multiply( components[0].dir, -components[0].length * 0.5));
	components[2].position = vec_sum( components[0].position, vec_multiply( components[0].dir, components[0].length * 0.5));	
}

bbox = get_bbox();