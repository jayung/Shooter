attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;



void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float vTime;
uniform float vSwitch;
uniform float yOffset;

varying vec2 v_vTexcoord;
uniform vec3 vRes;
varying vec4 v_vColour;



void main(){
    vec2 uv = v_vTexcoord.xy;

    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );

 
    //colors
    float verColor = (uv.x - (vTime / 120.0)) * 3.0;
    verColor = mod(verColor, 3.0);
    vec3 hc = vec3(0.25, 0.25, 0.25);
    gl_FragColor.rgb = vec3(0.25, 0.25, 0.25);
    if (verColor < 1.0) {
        gl_FragColor.r += 1.0 - verColor;
        gl_FragColor.g += verColor;
   }
    else if (verColor < 2.0) {
        verColor -= 1.0;
        gl_FragColor.g += 1.0 - verColor;
        gl_FragColor.b += verColor;
   }
    else {
        verColor -= 2.0;
        gl_FragColor.b += 1.0 - verColor;
        gl_FragColor.r += verColor;
   }
    gl_FragColor.r = uv.x;

   
   
    //gl_FragColor.rgb = vec3(((bv * hb) * hc));
    }
