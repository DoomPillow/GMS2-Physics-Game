/// @description

if vertex == 0 {
	vertex[0] = new vector(x,y);
	vertex[1] = new vector(x+sprite_width,y+sprite_height);
} 
dir = vec_normalize( vec_subtract(vertex[1], vertex[0]) );
mag = vec_magnitude( vec_subtract(vertex[1], vertex[0]) );

position = new vector( (vertex[0].x + vertex[1].x) * 0.5, (vertex[0].y + vertex[1].y) * 0.5);