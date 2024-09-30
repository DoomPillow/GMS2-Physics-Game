
if controller.show_bboxes {
	draw_set_color($000085);
	draw_rectangle(bbox[0], bbox[1], bbox[2], bbox[3], true);
	draw_set_color(c_white);
}
