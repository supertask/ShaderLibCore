#ifndef PHYSICS_SPRING_UTIL
#define PHYSICS_SPRING_UTIL

#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Util/Constant.hlsl"

//
// Reference:
//     George C King, Vibrations and waves, https://himafi.fmipa.unej.ac.id/wp-content/uploads/sites/16/2018/03/vibrations-and-waves-george-c-king.pdf
//
void SpringLightDamping_float(
	float x, float expFrequency, float cosFrequency,
	float amplitude, out float res)
{
    res = amplitude * exp( - x * expFrequency / 2 ) * cos( x * cosFrequency);
}

#endif