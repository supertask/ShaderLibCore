
void SobelFilter_float (sampler2D tex, float2 uv, float2 delta, out float sobel) {
	float4 hr = float4(0, 0, 0, 0);
	float4 vt = float4(0, 0, 0, 0);
	
	hr += tex2D(tex, (uv + float2(-1.0, -1.0) * delta)) *  1.0;
	hr += tex2D(tex, (uv + float2( 0.0, -1.0) * delta)) *  0.0;
	hr += tex2D(tex, (uv + float2( 1.0, -1.0) * delta)) * -1.0;
	hr += tex2D(tex, (uv + float2(-1.0,  0.0) * delta)) *  2.0;
	hr += tex2D(tex, (uv + float2( 0.0,  0.0) * delta)) *  0.0;
	hr += tex2D(tex, (uv + float2( 1.0,  0.0) * delta)) * -2.0;
	hr += tex2D(tex, (uv + float2(-1.0,  1.0) * delta)) *  1.0;
	hr += tex2D(tex, (uv + float2( 0.0,  1.0) * delta)) *  0.0;
	hr += tex2D(tex, (uv + float2( 1.0,  1.0) * delta)) * -1.0;
	
	vt += tex2D(tex, (uv + float2(-1.0, -1.0) * delta)) *  1.0;
	vt += tex2D(tex, (uv + float2( 0.0, -1.0) * delta)) *  2.0;
	vt += tex2D(tex, (uv + float2( 1.0, -1.0) * delta)) *  1.0;
	vt += tex2D(tex, (uv + float2(-1.0,  0.0) * delta)) *  0.0;
	vt += tex2D(tex, (uv + float2( 0.0,  0.0) * delta)) *  0.0;
	vt += tex2D(tex, (uv + float2( 1.0,  0.0) * delta)) *  0.0;
	vt += tex2D(tex, (uv + float2(-1.0,  1.0) * delta)) * -1.0;
	vt += tex2D(tex, (uv + float2( 0.0,  1.0) * delta)) * -2.0;
	vt += tex2D(tex, (uv + float2( 1.0,  1.0) * delta)) * -1.0;
	
	sobel = sqrt(hr * hr + vt * vt);
}