varying vec3 interpolatedNormal;
varying vec3 vertPos;
varying float intensity;
varying vec3 v_color;

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

  gl_FragColor = vec4(v_color, 1.0);
}
