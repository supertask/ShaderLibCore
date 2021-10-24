using UnityEngine;

/*
#if UNITY_EDITOR
using UnityEditor;
#endif
*/

using System.IO;
using System.Collections;

namespace ComputeShaderUtil
{
    public class GradientTexGen {
        public static Texture2D Create (Gradient grad, int width = 32, int height = 1) {
            var gradTex = new Texture2D(width, height, TextureFormat.ARGB32, false);
            gradTex.filterMode = FilterMode.Bilinear;
            float inv = 1f / (width - 1);
            for (int y = 0; y < height; y++) {
                for (int x = 0; x < width; x++) {
                    var t = x * inv;
                    Color col = grad.Evaluate(t);
                    gradTex.SetPixel(x, y, col);
                }
            }
            gradTex.Apply();
            return gradTex;
        }
    }
}