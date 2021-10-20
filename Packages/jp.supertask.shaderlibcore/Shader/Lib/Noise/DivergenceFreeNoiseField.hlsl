// Ref. https://github.com/keijiro/KvantSwarm

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"

// Divergence-free noise vector field

void DivergenceFreeNoiseField_float(float3 uvw, float swirlAndSpread, out float3 res)
{
    uvw += float3(0.9, 1.0, 1.1) * swirlAndSpread;
    float3 n1 = snoise_grad(uvw);
    float3 n2 = snoise_grad(uvw + float3(15.3, 13.1, 17.4));
    res = cross(n1, n2);
}