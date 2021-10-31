Shader "Hidden/VJKit/PostProcess/Mosaic"
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
            #include "Packages/jp.supertask.shaderlibcore/Shader/Lib/ImageEffect/MosaicSG.hlsl"

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


            float _DistortionNoiseScale;
            float _DistortionPower;

            TEXTURE2D_X(_InputTexture);
            //SAMPLER(sampler_InputTexture);


            float4 Fragment(Varyings input) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float2 uv = input.texcoord;

                float2 distortedUV;
                float4 color;
                /*
                MosaicUV_float(uv,
                    _DistortionNoiseScale, _DistortionNoisePosition, _DistortionPower,
                    distortedUV);
                color = LOAD_TEXTURE2D_X(_InputTexture, distortedUV * _ScreenSize.xy);
                */
                return color;
            }


            //#include "Distortion.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
