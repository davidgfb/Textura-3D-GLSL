// Create a 3D texture
vec3 noise3D_RGBA(vec3 p) {
    return vec3(texture(iChannel0, p).rgb);
}

vec3 noise3D_Gris(vec3 p) {
    return vec3(texture(iChannel0, p).r);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Calculate the texture coordinates
    vec3 p = vec3(fragCoord.xy / iResolution.xy, iTime);

    // Sample the 3D texture
    vec3 color = noise3D_RGBA(p); //noise3D_Gris(p);

    // Output the color
    fragColor = vec4(color, 1.0);
}
