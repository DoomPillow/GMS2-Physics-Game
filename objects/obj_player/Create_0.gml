/// @description

event_inherited();

components = [instance_create_layer(x,y,layer,obj_rectangle, {vertex: [new vector(x, y), new vector(x+32, y)], width: 32})];

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	
	if keyboard_check_pressed(vk_space) {
		velocity.y -= 8;	
	}
	
	local_position = vec_sum(local_position, vec_multiply(velocity, 1));
	position = vec_subtract(local_position, global.world_position);
	
	components[0].position = position;
	components[0].angle = angle;
	components[0].get_vertices();	
}

inertia = 0 *  mass * (power(components[0].width, 2) + power(components[0].length, 2)) * (1/6);
inv_inertia = inertia == 0 ? 0 : 1 / inertia;

angular_velocity = 0;

bbox = get_bbox();