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
    vertPos = vec3(modelViewMatrix * vec4(position,0.0));
    interpolatedNormal = normalize(vec3(modelViewMatrix * vec4(normal, 0.0)));

    L = normalize(vec3(modelViewMatrix * vec4((lightPosition - vertPos),0.0)));
    R = normalize(2.0 * interpolatedNormal * max(0.0, dot(interpolatedNormal,L)) - L);
    V = normalize(vec3(modelViewMatrix * vec4((cameraPosition - vertPos),0.0)));
    H = normalize((L+V)/2.0);  
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
