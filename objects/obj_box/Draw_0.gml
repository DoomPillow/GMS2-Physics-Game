/// @description

event_inherited();

draw_set_color( mass == 0 ? c_aqua : c_yellow);
draw_text(components[0].position.x, components[0].position.y, mass == 0 ? "static" : $"{mass}kg");
draw_set_color(c_white);