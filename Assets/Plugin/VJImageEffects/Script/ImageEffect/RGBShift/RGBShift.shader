Shader "Hidden/VJKit/PostProcess/RGBShift"
{
    SubShader
    {
        Pass
        {
            Cull Off ZWrite Off ZTest Always
            HLSLPROGRAM
            #pragma vertex Vertex
            #pragma fragment Fragment

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/Noise.hlsl"

            struct Attributes
            {
                uint vertexID : SV_VertexID;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
                float2 texcoord   : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            Varyings Vertex(Attributes input)
            {
                Varyings output;
                UNITY_SETUP_INSTANCE_ID(input);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
                output.positionCS = GetFullScreenTriangleVertexPosition(input.vertexID);
                output.texcoord = GetFullScreenTriangleTexCoord(input.vertexID);
                
                return output;
            }

            TEXTURE2D_X(_InputTexture);
            //SAMPLER(sampler_InputTexture);

			float2 _ShiftPower;
            
            

            float4 Fragment(Varyings input) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float2 uv = input.texcoord;
                
				float2 shiftpow = _ShiftPower * (1.0 / _ScreenSize.x);
				float r = LOAD_TEXTURE2D_X(_InputTexture, (uv - shiftpow) * _ScreenSize.xy).r;
				float2 ga = LOAD_TEXTURE2D_X(_InputTexture, uv * _ScreenSize.xy).ga;
				float b = LOAD_TEXTURE2D_X(_InputTexture, (uv + shiftpow) * _ScreenSize.xy).b;

				float4 color = float4(r, ga.x, b, ga.y);
                return color;
            }


            ENDHLSL
        }
    }
    Fallback Off
}
