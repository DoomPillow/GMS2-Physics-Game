/// @description

var view = view_camera[0];

camera_set_view_size(view, (view_width*zoom), (view_height*zoom));

//if keyboard_check_pressed(vk_tab) {
//	relative_angle = !relative_angle;	
//}

if relative_angle {
	camera_set_view_angle(view, radtodeg(follow.components[0].angle));
} else {
	camera_set_view_angle(view, 0);	
}

if instance_exists(follow) {
	
	camx = lerp(camx, follow.position.x - (view_width*zoom)/2,  1);
	camy = lerp(camy, follow.position.y - (view_height*zoom)/2, 1);
	//camx = clamp(camx, 0, room_width - view_width);
	//camy = clamp(camy, 0, room_height - view_height);
	
	camera_set_view_pos(view, camx, camy);

}