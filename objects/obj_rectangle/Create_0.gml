/// @description

if vertex == 0 {
	vertex = [];
	vertex[0] = new vector(x,y);
	vertex[1] = new vector(x+sprite_width, y);
}
edge = vec_subtract(vertex[1], vertex[0]);
dir = vec_normalize(edge);
refdir = vec_normalize(edge);
length = vec_magnitude(edge);
vertex[2] = vec_sum(vertex[1], vec_multiply(vec_normal(dir), width));
vertex[3] = vec_sum(vertex[2], vec_multiply(dir, -length));
position = vec_sum(vec_sum(vertex[0], vec_multiply(dir, length*0.5)), vec_multiply(vec_normal(dir), width*0.5));
angle = 0;
rot_mat = new matrix(2,2);

get_vertices = function() {
	var _rot_mat = rotation_matrix(angle);
	dir = mat_multiply_vec(_rot_mat, refdir);

	vertex[0] = vec_sum(vec_sum( position, vec_multiply(dir, -length*0.5)), vec_multiply( vec_normal(dir), width*0.5));
	vertex[1] = vec_sum(vec_sum( position, vec_multiply(dir, -length*0.5)), vec_multiply( vec_normal(dir), -width*0.5));
	vertex[2] = vec_sum(vec_sum( position, vec_multiply(dir, length*0.5)), vec_multiply( vec_normal(dir), -width*0.5));
	vertex[3] = vec_sum(vec_sum( position, vec_multiply(dir, length*0.5)), vec_multiply( vec_normal(dir), width*0.5));	
}

breadth = sqrt( power(vertex[1].x - vertex[0].x, 2) + power(vertex[2].y - vertex[0].y, 2)) * 0.5