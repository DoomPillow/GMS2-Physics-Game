/// @description

// Inherit parent variables
event_inherited();

// Circle component
components = [instance_create_layer(x,y,layer, obj_circle, {radius: radius, color: color})]; 

inv_mass = mass == 0 ? 0 : 1 / mass;

reposition = function() {
	components[0].position = vec_sum(components[0].position, velocity);
}

