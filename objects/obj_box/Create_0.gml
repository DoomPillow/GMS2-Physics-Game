/// @description

event_inherited();

components = [instance_create_layer(x,y,layer,obj_rectangle, {vertex: [new vector(x, y), new vector(x+sprite_width, y)], width: sprite_height})];

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	local_position = vec_sum(local_position, vec_multiply(velocity, 1));
	position = vec_subtract(local_position, global.world_position);
	
	components[0].position = position;
	components[0].angle = angle;
	components[0].get_vertices();	
}

inertia = mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/6);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angular_velocity = 0;

bbox = get_bbox();