using UnityEngine;

namespace ShaderLibCore
{
    public static class Util
    {
        public static float SpringLightDamping(float x, float expFrequency, float cosFrequency, float amplitude)
        {
            return amplitude * Mathf.Exp( - x * expFrequency / 2 ) * Mathf.Cos( x * cosFrequency);
        }
    }
}