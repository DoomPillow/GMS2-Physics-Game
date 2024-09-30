/// @description

// Inherit parent variables
event_inherited();

// Circle component
components = [instance_create_layer(x,y,layer, obj_circle, {radius: radius, color: color, breadth: radius})]; 

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	position = vec_sum(position, velocity)
	components[0].position = position
}

bbox = get_bbox();