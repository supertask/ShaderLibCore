#include "Packages/jp.supertask.shaderlibcore/Shader/Lib/Noise/common_voronoi3d.hlsl"

//#define MINKOWSKI
//#define CHEBYSHEV
//#define MANHATTAN
#define EUCLIDEAN

void EuclideanDistanceVoronoi3D_float(
	in float2 uv,
	in float w,
	in float randomness,
	in float time,
	out float grayColor,
	out float4 distance

) {
	float3 uv3 = float3(uv.x, uv.y, w);
	float3 baseCell = floor(uv3);
	float3 f = frac(uv3);

	float2 closestDistances = float2(10.0, 10.0);
	float3 closestCell;

	for(int k = -1; k <= 1; k++)
	{
		for(int j = -1; j <= 1; j++)
		{
			for(int i = -1; i <= 1; i++)
			{
				float3 neighborCell = float3(i, j, k);
				float3 cell = baseCell + neighborCell; //current cell
				float3 rand_point = hash(cell); //random point
				rand_point = 0.5 + 0.5 * sin( time + 6.2831 * rand_point );
				float3 r = neighborCell - f + randomness * rand_point; //Vector beteen the pixel and the point

				// Ref. chebyshev distance, https://gist.github.com/BarakChamo/bbaa5080acad2e3f8080e3bdd42325a7


				#if defined(MINKOWSKI)
					float d = minkowskiDistance(float3(0.0, 0.0, 0.0), r, minkowskiPower);
				#elif defined(CHEBYSHEV)
					float d = chebyshevDistance(float3(0.0, 0.0, 0.0), r);
				#elif defined(MANHATTAN)
					float d = manhattanDistance(float3(0.0, 0.0, 0.0), r);
				#else
					float d = euclideanDistance(float3(0.0, 0.0, 0.0), r);
				#endif
				
				if(d < closestDistances.x)
				{
					closestDistances.y = closestDistances.x;
					closestDistances.x = d; //closestDistance
					closestCell = cell;
				}
				else if(d < closestDistances.y) {
					closestDistances.y = d;
				}
			}
		}
	}

	// Ref. https://www.ronja-tutorials.com/2018/09/29/voronoi-noise.html
	// Ref. https://documentation.3delightcloud.com/display/3DFK/Worley+Noise
	grayColor = rand3dTo1d(closestCell);
	float f1 = closestDistances.x;
	float f2 = closestDistances.y;
	distance = float4(
		f1,
		f2,
		f2 - 1,
		f2 + f1
	);
}
