/// @description

draw_set_color(c_yellow);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_text(components[0].position.x, components[0].position.y, mass == 0 ? "static" : $"{mass}kg");
draw_set_halign(fa_top);
draw_set_valign(fa_left);
draw_set_color(c_white);
