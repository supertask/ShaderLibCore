
#ifndef TWIST_POSITION
#define TWIST_POSITION


//
// Bounce vertex shader
// https://joy.recurse.com/posts/174-vertex-love-online-vertex-shader-editor
//

//#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Constant.hlsl"
//#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"
#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Random.hlsl"

void Bounce_float(
	float3 positionVS,
	float3 bounceDir,
	float bounceRadius,
	float bounceStrengthAtCurve,
	float3 hitPositionVS,
	out float3 bouncePositionVS)
{
	//float3 randomVec = normalize(float3(random(seed), random(seed + 20), random(seed + 30)) );
	float distanceFromHitPoint = distance(positionVS, hitPositionVS);
	float normalizedDamage = 1.0 - saturate(distanceFromHitPoint / bounceRadius); //1.0 - clamp(distanceFromHitPoint / bounceRadius, 0.0, 1.0);
	bouncePositionVS = positionVS + bounceDir * normalizedDamage * bounceStrengthAtCurve * distanceFromHitPoint;
}


#endif