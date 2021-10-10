#ifndef FUNCTION_UTIL
#define FUNCTION_UTIL

//ガンマ補正
float gammaCorrect(float gamma, float x)
{
    return pow(x, 1.0 / gamma);
}

//バイアス
float bias(float bias, float x)
{
    return pow(x, log(bias) / log(0.5));
}

float gain(float gain, float x) {
    if(x < 0.5) {
        return bias(1.0 - gain, 2.0 * x) / 2.0;
    } else {
        return 1.0 - bias(1.0 - gain, 2.0 - 2.0 * x) / 2.0;
    }
}

//コントラスト
float contrast(float contrast, float x) {
    return 1/(1+exp(-contrast*(x-0.5)));
}

float3 gammaCorrectColor(float gamma, float3 color)
{
    return pow(color, 1.0 / gamma);
}

float4 contrastColor(float contrast, float4 color) {
    return 1/(1+exp(-contrast*(color-0.5)));
}


float pulse(float a, float b, float x)
{
    return step(a, x) - step(b, x);
}

float smoothpulse(float a1, float a2, float b1, float b2, float x)
{
    return smoothstep(a1, a2, x) - smoothstep(b1, b2, x);
}

#endif