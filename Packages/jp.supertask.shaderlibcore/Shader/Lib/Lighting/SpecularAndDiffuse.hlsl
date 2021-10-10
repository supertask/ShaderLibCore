// Specular and diffuse shader
// Ref. https://en.wikibooks.org/wiki/GLSL_Programming/GLUT/Specular_Highlights

void SpecularAndDiffuse_float(
    float3 viewDirection,
    float3 normalDirection,
    float3 vertexPositionWS,
    float3 vertexColor,

    bool isDirectionLight, 
    float3 lightPositionWS, // WorldSpaceLightPos0
    float3 lightColor,

    float3 specularColor,
    float specularShininess,

    out float3 diffuseReflection,
    out float3 specularReflection)
{
    float attenuation; 
    float3 lightDirection;
    if (isDirectionLight) // directional light?
    {
        attenuation = 1.0; // no attenuation
        //lightDirection = normalize(lightPositionWS.xyz);
        lightDirection = normalize(lightPositionWS.xyz - vertexPositionWS.xyz);
    } 
    else // point or spot light
    {
        float3 vertexToLightSource = lightPositionWS.xyz - vertexPositionWS.xyz;
        float distance = length(vertexToLightSource);
        attenuation = 1.0 / distance; // linear attenuation 
        lightDirection = normalize(vertexToLightSource);
    }    
    

    //
    // Diffuse
    //
    diffuseReflection = attenuation * lightColor.rgb * vertexColor.rgb
        * max(0.0, dot(normalDirection, lightDirection));

    //
    // Specular reflection
    //
    if (dot(normalDirection, lightDirection) < 0.0) 
        // light source on the wrong side?
    {
        specularReflection = float3(0.0, 0.0, 0.0); 
            // no specular reflection
    }
    else // light source on the right side
    {
        specularReflection = attenuation * lightColor.rgb * specularColor.rgb
            * pow(
                max(0.0,
                    dot(
                        reflect(-lightDirection, normalDirection), 
                        viewDirection
                    )
                ),
                specularShininess
            );
    }
}
