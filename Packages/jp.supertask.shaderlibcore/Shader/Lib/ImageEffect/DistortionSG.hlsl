
#ifndef IMAGE_EFFECT_DISTORTION
#define IMAGE_EFFECT_DISTORTION

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Constant.hlsl"
#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"

float2 getRotationUV(float2 uv, float angle, float power) {
	float2 v = (float2)0;
	float rad = angle * PI;
	
	v.x = uv.x + cos(rad) * power;
	v.y = uv.y + sin(rad) * power;

	return v;
}

void Distortion_float(
	sampler2D tex,
	float2 uv,
	float distortionNoiseScale,
	float3 distortionNoisePosition,
	float distortionPower,
	out float4 color)
{
	float3 uv1 = float3(uv * distortionNoiseScale,0);
	float3 noise = snoise_grad(uv1 + distortionNoisePosition);
				
	float2 uv = getRotationUV(uv, noise.x, noise.y * distortionPower);
	color = tex2D(_MainTex, uv);
}

#endif