
var _p = part_type_create();

	part_type_sprite(_p, spr_particle, true, true, false);
	part_type_life(_p, 10, 100);
	part_type_speed(_p,8,12,-0.15,0);
	part_type_color3(_p, c_white, c_aqua, c_blue);
	//part_type_color3(_p, c_white, c_yellow, c_red);
	//part_type_direction(_p,80,100,0,0);

global.pt_thrust1 = _p;

var _p = part_type_create();

	part_type_sprite(_p, spr_particle, true, true, false);
	part_type_life(_p, 10, 100);
	part_type_speed(_p,8,12,-0.15,0);
	part_type_color3(_p, c_white, c_red, c_purple);
	//part_type_direction(_p,80,100,0,0);

global.pt_thrust2 = _p;