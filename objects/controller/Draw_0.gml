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