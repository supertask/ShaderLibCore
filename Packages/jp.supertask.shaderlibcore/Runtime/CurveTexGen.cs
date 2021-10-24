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
    public class CurveTexGen {
        public static Texture2D Create (AnimationCurve animCurve, int width = 512, int height = 1) {
            var animTex = new Texture2D(width, height, TextureFormat.ARGB32, false);
            animTex.filterMode = FilterMode.Bilinear;
            float inv = 1f / (width - 1);
            for (int y = 0; y < height; y++) {
                for (int x = 0; x < width; x++) {
                    var t = x * inv;
                    Color col = new Color();
                    float curveVal = animCurve.Evaluate(t);
                    col.r = col.g = col.b = col.a = curveVal;
                    animTex.SetPixel(x, y, col);
                }
            }
            animTex.Apply();
            return animTex;
        }
    }

}