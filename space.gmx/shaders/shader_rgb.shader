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
uniform float tRed;
uniform float tGreen;
uniform float tBlue;


varying vec2 v_vTexcoord;
uniform vec3 vRes;
varying vec4 v_vColour;

varying vec3 v_vPosition;


void main(){
  vec2 uv = v_vTexcoord.xy;
  gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    float cor = (vRes.x / vRes.y);
    float ra = 1.0 + (cos(vTime/60.0))/10.0;
    float rs = 1.0 - (sin(vTime/30.0))/10.0;
    vec2 p =  v_vTexcoord.xy * 1.5;
    p.x *= cor;
    float a = atan(p.x,p.y);
    float r = length(p) * ra;
    
   
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    //gl_FragColor.r = sin(uv.x*10.0) / vTime;
float verColor = (uv.x - (vTime / 120.0)) * 3.0;
    verColor = mod(verColor, 3.0);
    vec3 hc = vec3(0.25, 0.25, 0.25);
    
    if (verColor < 1.0) {
        hc.r += 1.0 - verColor;
        hc.g += verColor;
   }
    else if (verColor < 2.0) {
        verColor -= 1.0;
        hc.g += 1.0 - verColor;
        hc.b += verColor;
   }
    else {
        verColor -= 2.0;
        hc.b += 1.0 - verColor;
        hc.r += verColor;
   }
  //gl_FragColor.rgb = vec3(( hc));
  
  float colorMin = 0.65;
  if (0.0 < colorMin){
    gl_FragColor.r = 0.0;//tRed;
  } else {
    gl_FragColor.r = tRed;
  }
  if (0.0 < colorMin){
    gl_FragColor.g = 0.0;// tGreen;
  } else {
    gl_FragColor.g = tGreen;
  }
  if (0.0 < colorMin){
    gl_FragColor.b = colorMin;
  } else {
   // gl_FragColor.b = 1.0 ;//- (uv.x*sin(vTime));//sin(vTime*uv.x*10.0);// * tBlue;
    gl_FragColor.b = tBlue;
  }

  
    }
