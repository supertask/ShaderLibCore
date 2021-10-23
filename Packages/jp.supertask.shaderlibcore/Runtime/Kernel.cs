using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

namespace ComputeShaderUtil {

	public class Kernel
	{
		public int Index { get { return index; } }
		public uint ThreadX { get { return threadX; } }
		public uint ThreadY { get { return threadY; } }
		public uint ThreadZ { get { return threadZ; } }

		int index;
		uint threadX, threadY, threadZ;

		public Kernel(ComputeShader shader, string key)
		{
            Assert.AreNotEqual(shader, null);
			index = shader.FindKernel(key);
			if (index < 0)
			{
				Debug.LogWarning("Can't find kernel");
				return;
			}
			shader.GetKernelThreadGroupSizes(index, out threadX, out threadY, out threadZ);
		}
	}
}