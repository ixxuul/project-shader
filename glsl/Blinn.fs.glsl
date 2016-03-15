varying vec3 interpolatedNormal;
varying vec3 vertPos;
varying vec3 L;
varying vec3 R;
varying vec3 V;
varying vec3 H;

uniform float Ka;
uniform float Kd;
uniform float Ks;
uniform float N;

uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;

uniform vec3 litColor;
uniform vec3 unlitColor;

void main() {

  gl_FragColor = vec4(vec3(Ka * ambientColor), 1.0) +
  vec4(vec3(Kd * max(0.0,dot(interpolatedNormal,L))), 1.0)+
  vec4(vec3(Ks * pow(dot(H,interpolatedNormal),N)), 1.0);
}
