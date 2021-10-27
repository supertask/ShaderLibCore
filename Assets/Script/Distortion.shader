Shader "Hidden/Kino/PostProcess/Distortion"
{
    SubShader
    {
        Pass
        {
            Cull Off ZWrite Off ZTest Always
            HLSLPROGRAM
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "Distortion.hlsl"
            ENDHLSL
        }
        Pass
        {
            Cull Off ZWrite Off ZTest Always
            HLSLPROGRAM
            #define GLITCH_BASIC
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "Distortion.hlsl"
            ENDHLSL
        }
        Pass
        {
            Cull Off ZWrite Off ZTest Always
            HLSLPROGRAM
            #define GLITCH_BLOCK
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "Distortion.hlsl"
            ENDHLSL
        }
        Pass
        {
            Cull Off ZWrite Off ZTest Always
            HLSLPROGRAM
            #define GLITCH_BASIC
            #define GLITCH_BLOCK
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "Distortion.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
