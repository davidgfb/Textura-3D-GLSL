/*void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Time varying pixel color
    //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));

    vec3 value = texture(iChannel0, vec3(iTime / 20.0, 1.0, 2.0)).rgb;

    // Output to screen
    fragColor = vec4(value,1.0);
}
*/

vec3 z = vec3(0, 0, 1);

float d_Esfera(vec3 p, float r) { 
    return length(p) - r;
}

void mainImage( out vec4 fragColor, vec2 fragCoord ) { 
    fragCoord *= 1e3 / iResolution.x;

    vec3 p = vec3(fragCoord, float(iFrame / 2)) - 100.0*vec3(5,2.75,2);

    float col = d_Esfera(p, 1e2);

    /*
    fragCoord *= 1e3 / iResolution.x;

    vec3 col = vec3(0), x = z.zxx, y = z.xzx,  
        o = vec3(fragCoord.x, 0, -fragCoord.y) - 100.0*vec3(5,0,-3),
        p = o, v = y; //v direccion, p.y no importa pues la persp
        //es ortogonal. tiene q ser opuesto
    float f_D_Supcie = d_Esfera(p, 1e2), d_Max = 1e2;
        
    for (p; length(p-o) < d_Max;) { //while  
        p += v*f_D_Supcie;
        
        if (f_D_Supcie < 1e-3) col = vec3(1); 
    }
       
    // Normalized pixel coordinates (from 0 to 1)
    //vec2 uv = fragCoord/iResolution.xy;
    // Time varying pixel color
    //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));
    // Output to screen
    */
    
    fragColor = vec4(vec3(col, 0, 0), 1.0);  
}

