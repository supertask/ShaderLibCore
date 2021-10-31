Shader "Hidden/VJKit/PostProcess/RadiationBlur"
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
            //#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/ImageEffect/MosaicSG.hlsl"

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
			float4  _InputTexture_TexelSize;

			float2 _BlurCenter;
			float _BlurPower;

            float4 Fragment(Varyings input) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

                float2 uv = input.texcoord;

				float2 dir = _BlurCenter - uv;
				float distance = length(dir);
                
				dir = normalize(dir) * _InputTexture_TexelSize.xy * 1000;
				dir *= _BlurPower * distance;

				float4 color = LOAD_TEXTURE2D_X(_InputTexture, uv * _ScreenSize.xy) * 0.19;
                for (int j = 1; j < 10; j++) {
                    float2 radiationUV = uv + dir * j;
					color += LOAD_TEXTURE2D_X(_InputTexture, radiationUV * _ScreenSize.xy)
                        * (0.19 - j * 0.02);
				}

                return color;
            }


            //#include "Distortion.hlsl"
            ENDHLSL
        }
    }
    Fallback Off
}
