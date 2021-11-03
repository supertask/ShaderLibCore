
#ifndef IMAGE_EFFECT_DISTORTION
#define IMAGE_EFFECT_DISTORTION

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Constant.hlsl"
//#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"
#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/SimplexNoiseGrad3D.cginc"

float2 getRotationUV(float2 uv, float angle, float power) {
	float2 v = (float2)0;
	float rad = angle * PI;
	
	v.x = uv.x + cos(rad) * power;
	v.y = uv.y + sin(rad) * power;

	return v;
}


float fukuokaMirrorX(float x) {
    return abs(fmod(x, 2.0) - 1) * 0.995 + 0.003;
}

float2 fukuokaMirrorUV(float2 uv) {
	return float2(fukuokaMirrorX(uv.x), fukuokaMirrorX(uv.y));
}

void DistortionUV_float(
	float2 uv,
	float distortionNoiseScale,
	float3 distortionNoisePosition,
	float distortionPower,
	out float2 distortedUV)
{
	float3 uv1 = float3(uv * distortionNoiseScale, _Time.x * 5);
	float3 noise = snoise_grad(uv1 + distortionNoisePosition);
				
	distortedUV = getRotationUV(uv, noise.x, noise.y * distortionPower);
	//distortedUV = saturate(distortedUV);
	distortedUV.x = distortedUV.x < 0 ? frac(- distortedUV.x) : distortedUV.x;
	distortedUV.y = distortedUV.y < 0 ? frac(- distortedUV.y) : distortedUV.y;
	distortedUV.x = distortedUV.x > 1 ? frac(distortedUV.x) : distortedUV.x;
	distortedUV.y = distortedUV.y > 1 ? frac(distortedUV.y) : distortedUV.y;
	//distortedUV = frac(distortedUV); //repeated uv (0 ~ 1), TODO(Tasuku): Mirrorに変更する
}


#endif