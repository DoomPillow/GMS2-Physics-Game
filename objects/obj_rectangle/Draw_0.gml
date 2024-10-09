/// @description

if color == false {
	draw_line(vertex[0].x, vertex[0].y, vertex[1].x, vertex[1].y);
	draw_line(vertex[1].x, vertex[1].y, vertex[2].x, vertex[2].y);
	draw_line(vertex[2].x, vertex[2].y, vertex[3].x, vertex[3].y);
	draw_line(vertex[3].x, vertex[3].y, vertex[0].x, vertex[0].y);

	draw_set_color(c_orange);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_text(position.x, position.y, "+");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
} else {
	
	draw_set_color(c_black);
	draw_line(vertex[0].x, vertex[0].y, vertex[1].x, vertex[1].y);
	draw_line(vertex[1].x, vertex[1].y, vertex[2].x, vertex[2].y);
	draw_line(vertex[2].x, vertex[2].y, vertex[3].x, vertex[3].y);
	draw_line(vertex[3].x, vertex[3].y, vertex[0].x, vertex[0].y);
	draw_set_color(c_white);

	draw_primitive_begin(pr_trianglestrip);
	draw_vertex_color(vertex[0].x, vertex[0].y, color, 1);
	draw_vertex_color(vertex[1].x, vertex[1].y, color, 1);
	draw_vertex_color(vertex[2].x, vertex[2].y, color, 1);
	draw_vertex_color(vertex[3].x, vertex[3].y, color, 1);
	draw_vertex_color(vertex[0].x, vertex[0].y, color, 1);
	draw_primitive_end();
}

if controller.show_bboxes { 
	draw_set_alpha(0.25)
	draw_set_color(c_lime);
	draw_circle(position.x, position.y, breadth, true)
	draw_set_alpha(1.0)
	
}
draw_set_color(c_white);