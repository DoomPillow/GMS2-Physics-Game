/// @description

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
draw_set_color(c_white);
