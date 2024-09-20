/// @description

event_inherited();

components = [instance_create_layer(x,y,layer,obj_rectangle, {vertex: [new vector(x, y), new vector(x+sprite_width, y)], width: sprite_height})];

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	components[0].position = vec_sum(components[0].position, velocity);
	components[0].get_vertices();	
}

inertia = mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/12);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angle = 0;
angular_velocity = 0;