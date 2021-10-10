//random3d
float3 hash(float3 p) {
  return frac(
      sin(float3(dot(p, float3(1.0, 57.0, 113.0)), dot(p, float3(57.0, 113.0, 1.0)),
               dot(p, float3(113.0, 1.0, 57.0)))) *
      43758.5453);
}

// Euclidean distance 3d
float euclideanDistance(float3 p1, float3 p2) {
	float d1 = (p1.x - p2.x);
	float d2 = (p1.y - p2.y);
	float d3 = (p1.z - p2.z);
	return sqrt(pow(d1, 2.0) + pow(d2, 2.0) + pow(d3, 2.0));
}

// Minkowski distance
float minkowskiDistance(float3 p1, float3 p2, float power) {
	float d1 = pow(abs(p1.x - p2.x), power);
	float d2 = pow(abs(p1.y - p2.y), power);
	float d3 = pow(abs(p1.z - p2.z), power);
	return pow(d1 + d2 + d3, 1.0 / power);
}

// Chebyshev distance 3d
float chebyshevDistance(float3 p1, float3 p2) {
	float d1 = abs(p1.x - p2.x);
	float d2 = abs(p1.y - p2.y);
	float d3 = abs(p1.z - p2.z);
	return max(d1, max(d2, d3));
}

// Manhattan distance 3d
float manhattanDistance(float3 p1, float3 p2) {
	float d1 = abs(p1.x - p2.x);
	float d2 = abs(p1.y - p2.y);
	float d3 = abs(p1.z - p2.z);
	return d1 + d2 + d3;
}

//get a scalar random value from a 3d value
float rand3dTo1d(float3 value, float3 dotDir = float3(12.9898, 78.233, 37.719)){
	//make value smaller to avoid artefacts
	float3 smallValue = sin(value);
	//get scalar value from 3d vector
	float random = dot(smallValue, dotDir);
	//make value more random by making it bigger and then taking the factional part
	random = frac(sin(random) * 143758.5453);
	return random;
}
