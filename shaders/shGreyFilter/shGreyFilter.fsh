//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 Color = vec4(0.9,0.9,1.0,0.875);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * Color;
}
