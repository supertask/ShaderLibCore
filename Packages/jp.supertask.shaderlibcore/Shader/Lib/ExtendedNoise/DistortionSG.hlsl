
#ifndef IMAGE_EFFECT_DISTORTION
#define IMAGE_EFFECT_DISTORTION

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Constant.hlsl"
#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Function.hlsl"
#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"
//#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/SimplexNoiseGrad3D.cginc"

float2 getRotationUV(float2 uv, float thetaAngle, float power) {
	float2 v = (float2)0;
	float theta = thetaAngle * PI;
	
	v.x = uv.x + cos(theta) * power;
	v.y = uv.y + sin(theta) * power;

	return v;
}

float3 getRotationUVW(float3 uvw, float thetaAngle, float phiAngle, float power) {
	float3 v = (float3)0;
	float theta = thetaAngle * PI;
	float phi = phiAngle * PI;

	v.x = uvw.x + sin(theta) * cos(phi) * power;
	v.y = uvw.y + sin(theta) * sin(phi) * power;
	v.z = uvw.z + cos(theta) * power;

	return v;
}

void DistortionUV_float(
	float2 uv,
	float distortionNoiseScale,
	float3 distortionNoisePosition,
	float distortionPower,
	float timeScale,
	out float2 distortedUV)
{
	float3 uv1 = float3(uv * distortionNoiseScale, _Time.x * timeScale);
	float3 noise = snoise_grad(uv1 + distortionNoisePosition);

	distortedUV = getRotationUV(uv, noise.x, noise.y * distortionPower);
	distortedUV = fukuokaTriangleWave2D(distortedUV);
}

//3d dimention distortion
void DistortionUVW_float(
	float3 uv,
	float distortionNoiseScale,
	float3 distortionNoisePosition,
	float distortionPower,
	float timeScale,
	out float3 distortedUVW)
{
	float3 uv1 = float3(uv * distortionNoiseScale);
	uv1.z += _Time.x * timeScale;
	float3 noise = snoise_grad(uv1 + distortionNoisePosition);

	distortedUVW = getRotationUVW(uv, noise.x, noise.y,
		noise.z * distortionPower);
	//distortedUVW = fukuokaTriangleWave3D(distortedUVW);
}

#endif