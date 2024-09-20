/// @description

event_inherited();

mass = 0;
inv_mass = mass == 0 ? 0 : 1 / mass;

var startpoint = new vector(x,y);
var endpoint = new vector(x+sprite_width,y+sprite_height);

components = [instance_create_layer(startpoint.x,startpoint.y,layer,obj_line, {vertex: [startpoint, endpoint]})];

reposition = function() {
	
}
