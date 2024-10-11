/// @description

view_width = display_get_width()/5;
view_height = display_get_height()/5;
zoom = 4;

window_scale = 3;
crunchy = 1;

window_set_size(view_width*window_scale,view_height*window_scale);

surface_resize(application_surface,view_width*window_scale*crunchy,view_height*window_scale*crunchy);

camx = 0;
camy = 0;

relative_angle = false;

follow = obj_player;