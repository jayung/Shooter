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
  
   float x1 = v_vPosition.x;
    float x2 = sin(vTime / 80.0) * 320.0 * 1.0;
    float y1 = v_vPosition.y;
    float y2 = v_vPosition.y;//sin(vTime / 80.0) * 480.0 * 1.0;
    float distances = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    //uv.x = 0.1;
    //uv.y += 50.0;
   // v_vColour = vec4(0.0, 1.0, 0.0, 1.0);
float cor = (vRes.x / vRes.y);
    float ra = 1.0 + (cos(vTime/60.0))/10.0;
    float rs = 1.0 - (sin(vTime/30.0))/10.0;
    vec2 p =  v_vTexcoord.xy * 1.5;
    p.x *= cor;
    float a = atan(p.x,p.y);
    float r = length(p) * ra;
    
   
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    gl_FragColor.r = sin(uv.x*10.0) / vTime;
float verColor = (uv.x - (vTime / 120.0)) * 3.0;
    verColor = mod(verColor, 3.0);
    vec3 hc;
     if (distanceF < 0.5){
       hc = vec3(distanceF,distanceF,distanceF);
    } else {
       hc = vec3(0.5 ,0.5,0.5);
    }
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
   
   //grid lines
   float bv = 1.0;
   if ((mod(uv.y * 110.0, 1.0) > 0.70 || mod(uv.x * 110.0 * cor, 1.0) > 0.70) && vSwitch != 5.0) {
        bv = 1.15 * ra;
   }

   //line
  // uv = (2.0 * uv) - 1.0 / ra;
   float bw = abs(1.0 / (30.0 * uv.y)) * ra;
   vec3 hb = vec3(bw);
    
   // gl_FragColor.rgb = vec3(( hc));
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
   
  //  
  //  gl_FragColor.r =  1.0 - gl_FragColor.r;
    //gl_FragColor.g *=  sqrt((y1-y2)*(y1-y2)) / 576.0;
    //if ((sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0) < 0.3 ){
     // gl_FragColor.a /=  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
   // }
    //gl_FragColor.a = 1.0;
   ///////////////////////////
    
   /* gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
 
    
    gl_FragColor.b = 0.0;
   
    gl_FragColor.r =  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    gl_FragColor.g =  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)) / 576.0;
    */
    
    
    //gl_FragColor.rgb = vec3(( hc));
   // gl_FragColor.g =  sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));

   // gl_FragColor.g =  sin(v_vPosition.y*10.0) / vTime;
    
    //gl_FragColor.b += 0.5;
    //gl_FragColor.r = hc.b;
 
    }
