
#include "./PhotoShopMath.hlsl"

void DesaturateShaderGraph_float(float3 color, float Desaturation, out float4 res)
{
	res = PhotoShopDesaturate(color, Desaturation);
}

void rgb2hsvShaderGraph_float(float3 c, out float3 res)
{
	res = rgb2hsv(c);
}

void hsv2rgbShaderGraph_float(float3 c, out float3 res)
{
	res = hsv2rgb(c);
}

void hsvLerpShaderGraph_float(float3 startHSV, float3 endHSV, float t, out float3 res)
{
	res = hsvLerp(startHSV, endHSV, t);
}

void RGBToHSLShaderGraph_float(float3 color, out float3 res)
{
	res = RGBToHSL(color);
}

void HueToRGBShaderGraph_float(float f1, float f2, float hue, out float res)
{
	res = HueToRGB(f1, f2, hue);
}

void HSLToRGBShaderGraph_float(float3 hsl, out float3 res)
{
	res = HSLToRGB(hsl);
}

void ContrastSaturationBrightnessShaderGraph_float(float3 color, float brt, float sat, float con, out float3 res)
{
	res = ContrastSaturationBrightness(color, brt, sat, con);
}

void BlendLightenShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendLighten(baseColor, blendColor);
}

void BlendLightenShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendLighten(baseColor, blendColor);
}

void BlendDarkenShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendDarken(baseColor, blendColor);
}

void BlendDarkenShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendDarken(baseColor, blendColor);
}

void BlendLinearBurnShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendLinearBurn(baseColor, blendColor);
}

void BlendLinearBurnShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendLinearBurn(baseColor, blendColor);
}

void BlendLinearDodgeShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendLinearDodge(baseColor, blendColor);
}

void BlendLinearDodgeShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendLinearDodge(baseColor, blendColor);
}

void BlendLinearLightShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendLinearLight(baseColor, blendColor);
}

void BlendLinearLightShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendLinearLight(baseColor, blendColor);
}

void BlendScreenShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendScreen(baseColor, blendColor);
}

void BlendScreenShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendScreen(baseColor, blendColor);
}

void BlendOverLayShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendOverLay(baseColor, blendColor);
}

void BlendOverLayShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendOverLay(baseColor, blendColor);
}

void BlendSoftLightShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendSoftLight(baseColor, blendColor);
}

void BlendSoftLightShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendSoftLight(baseColor, blendColor);
}

void BlendHardLightShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendHardLight(baseColor, blendColor);
}

void BlendHardLightShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendHardLight(baseColor, blendColor);
}

void BlendColorDodgeShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendColorDodge(baseColor, blendColor);
}

void BlendColorDodgeShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendColorDodge(baseColor, blendColor);
}

void BlendColorBurnShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendColorBurn(baseColor, blendColor);
}

void BlendColorBurnShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendColorBurn(baseColor, blendColor);
}

void BlendVividLightShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendVividLight(baseColor, blendColor);
}

void BlendVividLightShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendVividLight(baseColor, blendColor);
}

void BlendPinLightShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendPinLight(baseColor, blendColor);
}

void BlendPinLightShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendPinLight(baseColor, blendColor);
}

void BlendHardLerpShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendHardLerp(baseColor, blendColor);
}

void BlendHardLerpShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendHardLerp(baseColor, blendColor);
}

void BlendReflectShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendReflect(baseColor, blendColor);
}

void BlendReflectShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendReflect(baseColor, blendColor);
}

void BlendNegationShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendNegation(baseColor, blendColor);
}

void BlendNegationShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendNegation(baseColor, blendColor);
}

void BlendExclusionShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendExclusion(baseColor, blendColor);
}

void BlendExclusionShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendExclusion(baseColor, blendColor);
}

void BlendPhoenixShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendPhoenix(baseColor, blendColor);
}

void BlendPhoenixShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendPhoenix(baseColor, blendColor);
}

void BlendHueShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendHue(baseColor, blendColor);
}

void BlendHueShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendHue(baseColor, blendColor);
}

void BlendSaturationShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendSaturation(baseColor, blendColor);
}

void BlendSaturationShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendSaturation(baseColor, blendColor);
}

void BlendColorShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendColor(baseColor, blendColor);
}

void BlendColorShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendColor(baseColor, blendColor);
}

void BlendLuminosityShaderGraph_float(float3 baseColor, float3 blendColor, out float3 res)
{
	res = BlendLuminosity(baseColor, blendColor);
}

void BlendLuminosityShaderGraph_float(float3 baseColor, float4 blendColor, out float3 res)
{
	res = BlendLuminosity(baseColor, blendColor);
}

void HSLShiftShaderGraph_float(half3 baseColor, half3 shift, out float3 res)
{
	res = HSLShift(baseColor, shift);
}

void HSLShiftShaderGraph_float(float3 baseColor, float4 shift, out float3 res)
{
	res = HSLShift(baseColor, shift);
}

void HSVShiftShaderGraph_float(half3 baseColor, half3 shift, out float3 res)
{
	res = HSVShift(baseColor, shift);
}

void HSVShiftShaderGraph_float(float3 baseColor, float4 shift, out float3 res)
{
	res = HSVShift(baseColor, shift);
}
