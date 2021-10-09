#ifndef FBM_INCLUDED
#define FBM_INCLUDED

float random(float2 _st) {
	return frac(sin(dot(_st.xy,
		float2(12.9898, 78.233)))*
		43758.5453123);
}

// Based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise(float2 _st) {
	float2 i = floor(_st);
	float2 f = frac(_st);

	// Four corners in 2D of a tile
	float a = random(i);
	float b = random(i + float2(1.0, 0.0));
	float c = random(i + float2(0.0, 1.0));
	float d = random(i + float2(1.0, 1.0));

	float2 u = f * f * (3.0 - 2.0 * f);

	return lerp(a, b, u.x) +
		(c - a)* u.y * (1.0 - u.x) +
		(d - b) * u.x * u.y;
}
//float noise(float2 _st) {
//	return sin(1.5 * _st.x) * sin(1.5 * _st.y);
//}

#define NUM_OCTAVES 5

float fbm(float2 _st) {
	float v = 0.0;
	float a = 0.5;
	float2 shift = float2(10.0, 10.0);
	// Rotate to reduce axial bias
	float2x2 rot = float2x2(cos(0.5), sin(0.5),
		-sin(0.5), cos(0.50));
	for (int i = 0; i < NUM_OCTAVES; ++i) {
		v += a * noise(_st);
		_st = mul(rot, _st * 2.0 + shift);
		a *= 0.5;
	}
	return v;
}
#endif // FBM_INCLUDED