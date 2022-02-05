#ifndef GLITCH_UTIL
#define GLITCH_UTIL

void BasicGlitch_float(float2 uv, int samples, out float4 res)
{
    float4 c = float4(uv,0,1);
    float4 e;
    for (int i = 0; i < samples; i++)
    {
        e = floor(c);
        res += sin(e * e.yxyx + e * (_Time/10));
        c *= 2.5;
    }
}

#endif