attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 v_vPosition;

void main()
{

    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    //in_Colour = vec4(1.0, 1.0, 1.0, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = in_Position;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float vTime;
uniform float vSwitch;
uniform float yOffset;
uniform float distanceF;

varying vec2 v_vTexcoord;
uniform vec3 vRes;
varying vec4 v_vColour;

varying vec3 v_vPosition;


void main(){
  vec2 uv = v_vTexcoord.xy;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    gl_FragColor.r = distanceF;
    gl_FragColor.g = 1.0 - distanceF;
    gl_FragColor.b = 1.0 - distanceF;// / distanceF;
  
    }
