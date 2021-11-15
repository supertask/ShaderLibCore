void snoiseShaderGraph_float(float2 v, out float res)
{
	res = snoise(v);
}

void snoiseShaderGraph_float(float3 v, out float res)
{
	res = snoise(v);
}

void snoiseShaderGraph_float(float4 v, out float res)
{
	res = snoise(v);
}

void snoise2DShaderGraph_float(float2 v, out float2 res)
{
	res = snoise2D(v);
}

void snoise3DShaderGraph_float(float3 v, out float3 res)
{
	res = snoise3D(v);
}

void snoise_gradShaderGraph_float(float3 v, out float3 res)
{
	res = snoise_grad(v);
}

void curlXShaderGraph_float(float3 v, float d, out float res)
{
	res = curlX(v, d);
}

void curlYShaderGraph_float(float3 v, float d, out float res)
{
	res = curlY(v, d);
}

void curlZShaderGraph_float(float3 v, float d, out float res)
{
	res = curlZ(v, d);
}

void CurlNoiseShaderGraph_float(float2 pos, float e, out float2 res)
{
	res = CurlNoise(pos, e);
}

void CurlNoiseShaderGraph_float(float3 pos, float e, out float3 res)
{
	res = CurlNoise(pos, e);
}

void randomShaderGraph_float(float x, out float res)
{
	res = random(x);
}

void randomShaderGraph_float(float2 _st, out float res)
{
	res = random(_st);
}

void randomShaderGraph_float(float3 _st, out float res)
{
	res = random(_st);
}

void valueNoiseShaderGraph_float(float2 _st, out float res)
{
	res = valueNoise(_st);
}

void morganNoiseShaderGraph_float(float2 _st, out float res)
{
	res = morganNoise(_st);
}

void fbm2DWithMorganShaderGraph_float(float2 _st, int numOfOctaves, out float res)
{
	res = fbm2DWithMorgan(_st, numOfOctaves);
}

void fbmWithSimplexShaderGraph_float(float u, int numOfOctaves, out float res)
{
	res = fbmWithSimplex(u, numOfOctaves);
}

void fbmWithSimplexShaderGraph_float(float2 uv, int numOfOctaves, out float res)
{
	res = fbmWithSimplex(uv, numOfOctaves);
}

void fbmWithSimplexShaderGraph_float(float3 uv, int numOfOctaves, out float res)
{
	res = fbmWithSimplex(uv, numOfOctaves);
}

