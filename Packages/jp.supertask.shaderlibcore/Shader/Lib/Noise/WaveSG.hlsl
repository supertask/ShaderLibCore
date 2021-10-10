//
// http://math.hws.edu/graphicsbook/c7/s3.html
//

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"

void Wave0_float(in float2 uv, in float distortion, out float res) {
    float t = (uv.x + uv.y);
    t += distortion * snoise(uv);
    float value =  (1.0+sin(t))/2.0;
    res = sqrt(value);
}

void Wave1_float(in float2 uv, in float distortion, out float res) {
    float t = (uv.x + uv.y);
    t += distortion * snoise(uv);
    float value =  abs(sin(t));
    res = sqrt(value);
}

void Wave2_float(in float2 uv, in float distortion, out float res) {
    float t = (uv.x + uv.y);
    t += distortion * snoise(uv);
    float value = t - floor(t);
    res = sqrt(value);
}