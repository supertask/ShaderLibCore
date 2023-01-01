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

float smoothstepMountain(float x,
    float centerX, float mainWidth, float slopeWidth)
{
    float halfMainWidth = mainWidth / 2.0;
    float begin = centerX - halfMainWidth;
    float end = centerX + halfMainWidth;

    return smoothstep(begin, begin + slopeWidth, x)
        * smoothstep(end, end - slopeWidth, x);
}

void SmoothstepMountain_float(float x,
    float centerX, float mainWidth, float slopeWidth, out float y)
{
    y = smoothstepMountain(x, centerX, mainWidth, slopeWidth);
}

// Triangle wave for ping pong uv
// Usecase: PingPong texture
float fukuokaTriangleWave(float x) {
    //return abs(fmod(x, 2.0) - 1) * 0.995 + 0.003; //original version
    return abs(fmod(x + 1 + 100, 2.0) - 1);
}


#endif