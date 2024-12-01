/// @description

var _fps_mean = 0;
for (var i = 0; i < array_length(fps_avg); i++) {
	_fps_mean += fps_avg[i];	
}
_fps_mean = round( _fps_mean * (1/array_length(fps_avg)));

draw_text(60, 50, $"{fps} fps");
draw_text(60, 80, $"{fps_real} fps real");
draw_text(60, 110, $"{_fps_mean} fps mean");

draw_text(60, 140, $"# of collisions:    {num_collisions}");
draw_rectangle(260, 140, 260 + (20 * num_collisions), 160, false);

draw_text(60, 170, $"# of bbox overlaps: {overlapping_bboxes}");
draw_rectangle(260, 170, 260 + (20 * overlapping_bboxes), 190, false);

draw_text(60, 200, $"Showing broad phase: {show_bboxes}");
draw_text(60, 230, $"World pos: ({global.world_position.x}, {global.world_position.y})");

