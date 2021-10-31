
#ifndef IMAGE_EFFECT_MOSAIC
#define IMAGE_EFFECT_MOSAIC

void MosaicUV_float(
	float2 uv,
	float mosaicScale,
	out float2 mosaicUV)
{
	float2 delta = saturate(mosaicScale / _ScreenSize.xy);
	mosaicUV = (floor(uv / delta) + 0.5) * delta;
}

void MosaicCircle_float(
	float2 uv,
	float mosaicScale,
	out float circle)
{
	float2 delta = saturate(mosaicScale / _ScreenSize.xy);
	float2 uv2 = frac(uv / delta);
	float len = 0.5 - length(uv2 - 0.5);
	circle = smoothstep(0.0, 0.05, len);
}
/*
float4 mosaicCore(
	Texture2DArray<float4> tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams)
{
	float2 delta = saturate(mosaicScale / screenParams.xy);
	float2 mosaicUV = (floor(uv / delta) + 0.5) * delta;
	float4 col = LOAD_TEXTURE2D_X(tex, mosaicUV * _ScreenSize.xy);

	return col;
}

void MosaicBlock_float(
	Texture2DArray<float4> tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams,
	out float4 res)
{
	res = mosaicCore(tex, uv, mosaicScale, screenParams);
}

void MosaicCircle_float(
	Texture2DArray<float4> tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams,
	out float4 res)
{
	res = mosaicCore(tex, uv, mosaicScale, screenParams);

	float2 uv2 = frac(uv / delta);
	float len = 0.5 - length(uv2 - 0.5);
	res = res * smoothstep(0.0, 0.05, len);
}
*/

#endif