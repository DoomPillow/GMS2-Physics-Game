/// @description

// Inherit parent variables
event_inherited();

// Circle component
components = [instance_create_layer(x,y,layer, obj_circle, {radius: radius, color: color, breadth: radius})]; 

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	local_position = vec_sum(local_position, vec_multiply(velocity, 1));
	position = vec_subtract(local_position, global.world_position);
	components[0].position = position
}

bbox = get_bbox();