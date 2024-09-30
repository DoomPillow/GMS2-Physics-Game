/// @description

event_inherited();

draw_set_color(c_yellow);
draw_text(components[0].position.x, components[0].position.y, $"{mass}kg");
draw_set_color(c_white);

//if !movy {
//	var _dir = point_direction(components[0].position.x, components[0].position.y, mouse_x, mouse_y);
//	draw_arrow(components[0].position.x, components[0].position.y, components[0].position.x + lengthdir_x(80, _dir), components[0].position.y + lengthdir_y(80, _dir), 15);
//	draw_arrow(components[0].position.x, components[0].position.y, components[0].position.x + lengthdir_x(65, 90 + radtodeg(-components[0].angle)), components[0].position.y + lengthdir_y(65, 90 + radtodeg(-components[0].angle)), 15);
//}

//var _deg = radtodeg(components[0].angle);
//draw_text(x+60,y+60, $"{components[0].dir}, {lengthdir_x(1, _deg)}, {lengthdir_y(1, _deg)}" );

//draw_line(vertex[0].x, vertex[0].y, vertex[1].x, vertex[1].y);
//draw_line(vertex[1].x, vertex[1].y, vertex[2].x, vertex[2].y);
//draw_line(vertex[2].x, vertex[2].y, vertex[3].x, vertex[3].y);
//draw_line(vertex[3].x, vertex[3].y, vertex[0].x, vertex[0].y);
//
//draw_set_color(c_orange);
//draw_set_halign(fa_middle);
//draw_set_valign(fa_center);
//draw_text(position.x, position.y, "+");
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_color(c_red);
//draw_arrow(position.x, position.y, position.x + lengthdir_x(30, pi/2 - radtodeg(angle)), position.y +  + lengthdir_y(30, pi/2 - radtodeg(angle)), 5)
//draw_set_color(c_white);

draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_text(position.x, position.y + 150, position)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

