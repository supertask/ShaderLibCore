# ShaderLibraryCore

Extended HLSL codes which are useful for ShaderGraph. The most of HLSL codes are [HERE](https://github.com/supertask/ShaderLibCore/tree/main/Packages/jp.supertask.shaderlibcore/Shader/Lib).

This shader library is still **under development**.


Effects
-------

### Deformaion3D

![Deformaion3D](./images/Deformaion3D.gif)


1. 3D distortion with Simplex noise gradient 
2. Twist
3. Death Stranding Glitch
4. Spring light damping
5. MIDI twist

### Cyber Circuit

Circuit shader based on Minkowski Voronoi & wave shader

<img src="./images/CyberCircuit.png" width="320px" alt = "CyberCircuit">


### Shader in Blender (Minkowski Voronoi & Wave) 

These are from Blender shader.


<table>
<tr>
	<th scope="Minkowski Voronoi">Minkowski Voronoi</th>
	<th scope="Wave">Wave</th>
</tr>
<tr>
<td><img src="./images/MinkowskiVoronoi.png" width="320px" alt = "Minkowski Voronoi"></td>
<td><img src="./images/Wave.png" width="320px" alt = "Wave"></td>
</tr>
</table>



## How to install

Write a package path on manifest.json

```
"jp.supertask.shaderlibcore": "https://github.com/supertask/ShaderLibCore.git?path=/Packages/jp.supertask.shaderlibcore",
```



