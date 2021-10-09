#ifndef CONTOUR_UTIL
#define CONTOUR_UTIL

sampler2D _MainTex;
float2 _MainTex_TexelSize;

sampler2D_float _CameraDepthTexture;
sampler2D _CameraGBufferTexture2;

half4 _Color;
half4 _Background;

float _LowerThreshold;
float _UpperThreshold;

float _ColorSensitivity;
float _DepthSensitivity;
float _NormalSensitivity;
float _FallOffDepth;
//float _InvFallOff;


float4 GetContour(float2 uv)
{
	float invRange = 1 / (_UpperThreshold - _LowerThreshold);
	float invFallOff = 1 / _FallOffDepth;
	_DepthSensitivity *= 2;

	// Source color
	half4 c0 = tex2D(_MainTex, uv);

	// Four sample points of the roberts cross operator
	float2 uv0 = uv;                                   // TL
	float2 uv1 = uv + _MainTex_TexelSize.xy;           // BR
	float2 uv2 = uv + float2(_MainTex_TexelSize.x, 0); // TR
	float2 uv3 = uv + float2(0, _MainTex_TexelSize.y); // BL

	half edge = 0;

	//#ifdef _CONTOUR_COLOR

		// Color samples
		float3 c1 = tex2D(_MainTex, uv1).rgb;
		float3 c2 = tex2D(_MainTex, uv2).rgb;
		float3 c3 = tex2D(_MainTex, uv3).rgb;

		// Roberts cross operator
		float3 cg1 = c1 - c0;
		float3 cg2 = c3 - c2;
		float cg = sqrt(dot(cg1, cg1) + dot(cg2, cg2));

		edge = cg * _ColorSensitivity;

	//#endif

	//#ifdef _CONTOUR_DEPTH

		// Depth samples
		float zs0 = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv0);
		float zs1 = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv1);
		float zs2 = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv2);
		float zs3 = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv3);

		// Calculate fall-off parameter from the depth of the nearest point
		float zm = min(min(min(zs0, zs1), zs2), zs3);
		float falloff = 1.0 - saturate(LinearEyeDepth(zm) * invFallOff);

		// Convert to linear depth values.
		float z0 = Linear01Depth(zs0);
		float z1 = Linear01Depth(zs1);
		float z2 = Linear01Depth(zs2);
		float z3 = Linear01Depth(zs3);

		// Roberts cross operator
		float zg1 = z1 - z0;
		float zg2 = z3 - z2;
		float zg = sqrt(zg1 * zg1 + zg2 * zg2);
		//return zg;

		edge = max(edge, zg * falloff * _DepthSensitivity / Linear01Depth(zm));

	//#endif

	//#ifdef _CONTOUR_NORMAL
		//return float4(0,0,1,1);

		// Normal samples from the G-buffer
		float3 n0 = tex2D(_CameraGBufferTexture2, uv0).rgb;
		float3 n1 = tex2D(_CameraGBufferTexture2, uv1).rgb;
		float3 n2 = tex2D(_CameraGBufferTexture2, uv2).rgb;
		float3 n3 = tex2D(_CameraGBufferTexture2, uv3).rgb;
		//return float4(n0,1);

		// Roberts cross operator
		float3 ng1 = n1 - n0;
		float3 ng2 = n3 - n2;
		float ng = sqrt(dot(ng1, ng1) + dot(ng2, ng2));
		

		edge = max(edge, ng * _NormalSensitivity);
		

	//#endif

	// Thresholding
	edge = saturate((edge - _LowerThreshold) * invRange);

	half3 cb = lerp(c0.rgb, _Background.rgb, _Background.a);
	half3 co = lerp(cb, _Color.rgb, edge * _Color.a);
	//return float4(0,1,0,1);

	return half4(co, c0.a);
}

#endif