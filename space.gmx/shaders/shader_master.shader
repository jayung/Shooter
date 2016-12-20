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
uniform float shadeType;

varying vec2 v_vTexcoord;
uniform vec3 vRes;
varying vec4 v_vColour;

varying vec3 v_vPosition;


void main(){
  vec2 uv = v_vTexcoord.xy;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
   // gl_FragColor.g = 1.0;
    
    if (  (shadeType >= 0.) && (shadeType < 0.9)  ){
        //gl_FragColor.r = distanceF;
        gl_FragColor.b = 0.0;
        float x1 = v_vPosition.x;
    float x2 = sin(vTime / 160.0) * 320.0 * 1.0;
    float y1 = v_vPosition.y;
    float y2 = sin(vTime / 160.0) * 480.0 * 1.0;
    
    gl_FragColor.r = 0.5;
    gl_FragColor.g = 0.5;
    gl_FragColor.b = 0.1;
    //gl_FragColor.r *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
   // gl_FragColor.g *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.r *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.g *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.b *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
   } else if (shadeType == 1.0) {
        gl_FragColor.r = 0.0;
        gl_FragColor.b = 1.0;
        // Distance
    float x1 = v_vPosition.x;
    float x2 = sin(vTime / 160.0) * 320.0 * 1.0;
    float y1 = v_vPosition.y;
    float y2 = sin(vTime / 160.0) * 480.0 * 1.0;
    
    gl_FragColor.r = 0.5;
    gl_FragColor.g = 0.5;
    gl_FragColor.b = 0.1;
    //gl_FragColor.r *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
   // gl_FragColor.g *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.r *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.g *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.b *=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    
   } else if (shadeType == 2.0){
        gl_FragColor.r = distanceF * 2.0;
        gl_FragColor.g = 0.0;
        gl_FragColor.g = 0.0;
        
   }

  
    }
