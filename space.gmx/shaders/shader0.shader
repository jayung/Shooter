attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;



void main()
{
    //in_Position.x += 10.0;
   // float nums = in_Position.x ;//+ 10.0;
    vec4 object_space_pos = vec4( in_Position.x , in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    //in_TextureCoord.x += 10.0;
    v_vColour = in_Colour;

    v_vTexcoord = in_TextureCoord;
   // in_TextureCoord.u += 10.0;
   // v_vTexcoord = vec2(30.0, 30.0);
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
   

   
   
    //gl_FragColor.rgb = vec3(((bv * hb) * hc));
    }
