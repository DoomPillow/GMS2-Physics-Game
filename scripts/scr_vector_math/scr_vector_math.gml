

//////// VECTORS
function vector(_x, _y) constructor {
	x = _x;
	y = _y;
}

function vec_sum(v1, v2) {
	return new vector(v1.x + v2.x, v1.y + v2.y);
}
function vec_subtract(v1, v2) {
	return new vector(v1.x - v2.x, v1.y - v2.y);
}
function vec_multiply(vec, scalar) {
	return new vector(vec.x * scalar, vec.y * scalar);
}
function vec_magnitude(vec) {
	return sqrt((vec.x * vec.x) + (vec.y * vec.y));
}
function vec_normalize(vec) {
	var _mag = vec_magnitude(vec);
	if _mag == 0 {
		return new vector(0,0);
	} else {
		return new vector(vec.x / _mag, vec.y / _mag);
	}
}
function vec_normal(vec) {
	return vec_normalize(new vector(-vec.y, vec.x));
}
function vec_dot(v1, v2) {
	return v1.x * v2.x + v1.y * v2.y;
}
function vec_cross(v1, v2) {
	return v1.x * v2.y - v1.y * v2.x;	
}

//////// MATRIX
function matrix(_rows, _cols) constructor {
	rows = _rows;
	cols = _cols;
	data = [];
	
	for (var i = 0; i < rows; i++) {
		data[i] = [];
		for (var j = 0; j < cols; j++) {
			data[i][j] = 0;
		}
	}
}

function mat_multiply_vec(mat, vec) {
	var result = new vector(0,0);
	result.x = mat.data[0][0] * vec.x + mat.data[0][1] * vec.y;
	result.y = mat.data[1][0] * vec.x + mat.data[1][1] * vec.y;
	return result;
}

function rotation_matrix(angle) {
	var mx = new matrix(2,2);
	mx.data[0][0] =  cos(angle);
	mx.data[0][1] = -sin(angle);
	mx.data[1][0] =  sin(angle);
	mx.data[1][1] =  cos(angle);
	return mx;
}