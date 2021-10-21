
#ifndef IMAGE_EFFECT_DISTORTION
#define IMAGE_EFFECT_DISTORTION

float4 mosaicCore(
	sampler2D tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams)
{
	float2 delta = saturate(mosaicScale / screenParams.xy);
	float2 uv = (floor(uv / delta) + 0.5) * delta;
	float4 col = tex2D(tex, uv);
	return col;
}

void MosaicBlock_float(
	sampler2D tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams,
	out float4 res)
{
	res = mosaicCore(tex, uv, mosaicCore, screenParams);
}

void MosaicCircle_float(
	sampler2D tex,
	float2 uv,
	float2 mosaicScale,
	float4 screenParams,
	out float4 res)
{
	res = mosaicCore(tex, uv, mosaicCore, screenParams);

	float2 uv2 = frac(uv / delta);
	float len = 0.5 - length(uv2 - 0.5);
	res = res * smoothstep(0.0, 0.05, len);
}

#endif