attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

struct MaterialSource
{
    vec3 Ambient;
    vec4 Diffuse;
    vec3 Specular;
    float Shininess;
    vec2 TextureOffset;
    vec2 TextureScale;
};

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
   vec2 uv2 = v_vTexcoord.xy * 1.1;
    float uv3 = atan(uv.x,uv.y);
    
    float cor = (vRes.x / vRes.y);
    float ra = 1.0 + (cos(vTime/60.0))/10.0;
    float rs = 1.0 - (sin(vTime/30.0))/10.0;
    vec2 p =  v_vTexcoord.xy * 1.5;
    p.x *= cor;
    float a = atan(p.x,p.y);
    float r = length(p) * ra;
    mediump vec4 total = vec4(0.0);
   // uv = vec2((a),length(p) );
   // uv.x /= 2.0;
   //total +=  texture2D( gm_BaseTexture, uv );
   //total +=  texture2D( gm_BaseTexture, uv +  vec2(10.0 , 10.0));
   
    // gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
   // gl_FragColor *= 2.0;
     //gl_FragColor = total;
     
     //gl_FragColor.rgb = vec3(((bv * hb) * hc));
    //squigly line
    if(vSwitch == 0.0){
        //uv.y *= 2.0 + (sin((uv.x*10.0) + (vTime/30.0))) / (2.0 / (sin(vTime/30.0)/10.0)) - .5 - yOffset;
        //uv.x *= cor;
    }
    
    //curved line
    if(vSwitch == 1.0){
        uv = (v_vTexcoord.xy) * vec2((a)/(3.1415926535),r) / 0.5 -.5 - yOffset;
        uv.x *= cor;
    }
    
    //circle
    if(vSwitch == 2.0){
        uv = vec2((a)/(3.1415926535),r/2. - yOffset) ;// - center/100.0;
    }
    
    //diagonal line
    if(vSwitch == 3.0){
       uv.y += uv.x - .5 + yOffset; 
    }
    
    //squiggly diagonal line
    if(vSwitch == 4.0){
        uv.y += uv.x - .5 + yOffset;
        uv.y *= 2.0 + (sin((uv.x*10.0) + (vTime/30.0))) / (2.0 / (sin(vTime/30.0)/10.0)) - .5 - yOffset;
    }
    
    //fullscreen thingy
    if(vSwitch == 5.0){
        uv.y = .5;
    }
    
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
   //gl_FragColor.a = 0.5;
   // bv = 1.0;
   //grid lines
   float bv = 1.0;
  // if ((mod(uv.y * 110.0, 1.0) > 0.70 || mod(uv.x * 110.0 * cor, 1.0) > 0.70) && vSwitch != 5.0) {
  //      bv = 1.15 * ra;
  // }

   //linec
   uv = (2.0 * uv) - 1.0 / ra;
   float bw = abs(1.0 / (30.0 * uv.y)) * ra;
   vec3 hb = vec3(bw);
   
   
    //gl_FragColor.rgb = vec3(((bv * hb) * hc));
    }
