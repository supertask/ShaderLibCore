using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

namespace ShaderLibCore.PostProcessing
{
    [System.Serializable, VolumeComponentMenu("Post-processing/VJKit/Mosaic")]
    public sealed class Mosaic : CustomPostProcessVolumeComponent, IPostProcessComponent
    {
        public ClampedFloatParameter scale = new ClampedFloatParameter(0.5f, 0, 1.0f);
        public Bool​Parameter isCircle = new Bool​Parameter(false);

        ///public Vector3Parameter position = new Vector3Parameter(new Vector3(0,0,1));
        //public ClampedFloatParameter power = new ClampedFloatParameter(0, 0, 1.0f);

        Material _material;

        static class ShaderIDs
        {
            internal static readonly int MosaicScale = Shader.PropertyToID("_MosaicScale");
            internal static readonly int IsCricle = Shader.PropertyToID("_IsCricle");
            internal static readonly int InputTexture = Shader.PropertyToID("_InputTexture");
        }

        public bool IsActive() => _material != null && (scale.value > 0);

        public override CustomPostProcessInjectionPoint injectionPoint =>
        //    CustomPostProcessInjectionPoint.BeforePostProcess;
            CustomPostProcessInjectionPoint.AfterPostProcess;

        public override void Setup()
        {
            _material = CoreUtils.CreateEngineMaterial("Hidden/VJKit/PostProcess/Mosaic");
        }

        public override void Render(CommandBuffer cmd, HDCamera camera, RTHandle srcRT, RTHandle destRT)
        {
            if (_material == null) return;

            // Invoke the shader.
            _material.SetFloat(ShaderIDs.MosaicScale, scale.value);
            _material.SetInt(ShaderIDs.IsCricle, isCircle.value ? 1 : 0);
            _material.SetTexture(ShaderIDs.InputTexture, srcRT);

            // Shader pass number
            var pass = 0;

            // Blit
            HDUtils.DrawFullScreen(cmd, _material, destRT, null, pass);
        }

        public override void Cleanup()
        {
            CoreUtils.Destroy(_material);
        }
    }
}
