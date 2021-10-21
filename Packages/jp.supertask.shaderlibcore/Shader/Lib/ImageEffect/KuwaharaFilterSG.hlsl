void KuwaharaFilter_float (sampler2D tex,
    float4 texelSize, float2 uv, float kuwaharaRadius,  out float4 color)
{
    float3 mean[4] = {
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0}
    };
    float3 sigma[4] = {
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0}
    };

    float2 start[4] = {{-kuwaharaRadius, -kuwaharaRadius}, {-kuwaharaRadius, 0}, {0, -kuwaharaRadius}, {0, 0}};

    float2 pos;
    float3 col;
    for (int k = 0; k < 4; k++) {
        for(int i = 0; i <= kuwaharaRadius; i++) {
            for(int j = 0; j <= kuwaharaRadius; j++) {
                pos = float2(i, j) + start[k];
                col = tex2Dlod(tex, float4(uv + float2(pos.x * texelSize.x, pos.y * texelSize.y), 0., 0.)).rgb;
                //col = tex.Sample(texSampler,
                //    float2(uv + float2(pos.x * texelSize.x, pos.y * texelSize.y)) ).rgb;
                mean[k] += col;
                sigma[k] += col * col;
            }
        }
    }

    float sigma2;

    float n = pow(kuwaharaRadius + 1, 2);
    color = tex2D(tex, uv);
    //color = tex.Sample(texSampler, uv);
    float min = 1;

    for (int l = 0; l < 4; l++) {
        mean[l] /= n;
        sigma[l] = abs(sigma[l] / n - mean[l] * mean[l]);
        sigma2 = sigma[l].r + sigma[l].g + sigma[l].b;

        if (sigma2 < min) {
            min = sigma2;
            color.rgb = mean[l].rgb;
        }
    }
	//return color;
}



    /*
void KuwaharaFilter_float (Texture2D<float4> tex, SamplerState texSampler,
    float4 texelSize, float2 uv, float kuwaharaRadius,  out float4 color)
{
    color = tex.Sample(texSampler, uv);
    //color = SAMPLE_TEXTURE2D(tex, texSampler, uv);

    float3 mean[4] = {
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0}
    };
    float3 sigma[4] = {
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0},
        {0, 0, 0}
    };

    float2 start[4] = {{-kuwaharaRadius, -kuwaharaRadius}, {-kuwaharaRadius, 0}, {0, -kuwaharaRadius}, {0, 0}};

    float2 pos;
    float3 col;
    for (int k = 0; k < 4; k++) {
        for(int i = 0; i <= kuwaharaRadius; i++) {
            for(int j = 0; j <= kuwaharaRadius; j++) {
                pos = float2(i, j) + start[k];
                //col = tex2Dlod(tex, float4(uv + float2(pos.x * texelSize.x, pos.y * texelSize.y), 0., 0.)).rgb;
                col = tex.Sample(texSampler,
                    float2(uv + float2(pos.x * texelSize.x, pos.y * texelSize.y)) ).rgb;
                mean[k] += col;
                sigma[k] += col * col;
            }
        }
    }

    float sigma2;

    float n = pow(kuwaharaRadius + 1, 2);
    //color = tex2D(tex, uv);
    color = tex.Sample(texSampler, uv);
    float min = 1;

    for (int l = 0; l < 4; l++) {
        mean[l] /= n;
        sigma[l] = abs(sigma[l] / n - mean[l] * mean[l]);
        sigma2 = sigma[l].r + sigma[l].g + sigma[l].b;

        if (sigma2 < min) {
            min = sigma2;
            color.rgb = mean[l].rgb;
        }
    }
	//return color;
}
*/