/// @description

for (var i = 0; i < array_length(contact_vertices); i++) {
	if contact_vertices[i].pen != -1 {
		draw_set_color(c_red);
		draw_arrow(contact_vertices[i].cont.x, contact_vertices[i].cont.y, contact_vertices[i].cont.x + contact_vertices[i].axis.x * contact_vertices[i].pen, contact_vertices[i].cont.y + contact_vertices[i].axis.y * contact_vertices[i].pen, 10);
	
		draw_set_color(c_aqua);
		draw_circle(contact_vertices[i].cont.x, contact_vertices[i].cont.y, 10, true);
		draw_set_color(c_white);
	}
}

contact_vertices = [];

draw_set_alpha(0.5);
//var _dir1 = point_direction(0, 0, obj_ship.position.x, obj_ship.position.y);
var _dir2 = point_direction(mouse_x + global.world_position.x, mouse_y + global.world_position.y, 0, 0);
draw_set_color(c_red);
draw_arrow(mouse_x + lengthdir_x(-25, _dir2), mouse_y + lengthdir_y(-25, _dir2), mouse_x + lengthdir_x(25, _dir2), mouse_y + lengthdir_y(25, _dir2), 20);
draw_set_color(c_white);
//draw_arrow(0, 0, lengthdir_x(50, _dir1), lengthdir_y(50, _dir1), 20);
draw_set_alpha(1);

