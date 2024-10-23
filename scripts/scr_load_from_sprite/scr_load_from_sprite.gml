
function load_object_from_sprite(_spr,_submg)
{
	//
	var components = []
	//
	var _surf = -1;
	
	//get sprite data + Set variables
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);

	
	//set surface
	_surf = surface_create(_w,_h);
	
	//draw sprite
	surface_set_target(_surf);
	draw_clear_alpha(0,0);
	draw_sprite(_spr,_submg,0,0)
	surface_reset_target();

	//convert surface to buffer
	
	var _buff = buffer_create(4 * _w * _h, buffer_fast, 1);
	buffer_get_surface(_buff, _surf, 0);
	surface_free(_surf);
	
	for (var _y = 0; _y < _h; ++_y) {
			for (var _x = 0; _x < _w; ++_x) {
					buffer_seek(_buff, buffer_seek_start, 4 * (_x + _y * _w));
					var _r = buffer_read(_buff, buffer_u8);
					var _g = buffer_read(_buff, buffer_u8);
					var _b = buffer_read(_buff, buffer_u8);
					//var _a = buffer_read(_buff, buffer_u8);
					
					var _col = make_color_rgb(_r,_g,_b);
					//show_message(_col)
					//if _col != 0 {
					//	
					//	array_push(components, instance_create_layer(x,y,layer,obj_rectangle, {color: _col, xoff: _x * 32, yoff: -_y * 32 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}));
					//	mass += 6;
					//
					//}
					switch (_col) {
						case 16777215:
							array_push(components, instance_create_layer(x,y,layer,obj_rectangle, {color: _col, collision_layer: 0, xoff: _x * 32, yoff: -_y * 32 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}));
							mass += 6;
						break;
						case 7368816:
							array_push(components, instance_create_layer(x,y,layer,obj_rectangle, {color: _col, collision_layer: 1, xoff: _x * 32, yoff: -_y * 32 , vertex: [new vector(x, y), new vector(x+32, y)], width: 32}));
							mass += 1;
						break;
					}
			}
	}
	//clean up
	buffer_delete(_buff);
	surface_free(_surf);
	
	//
	//show_message(components)
	
	return components;
}