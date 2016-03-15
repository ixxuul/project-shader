
varying vec3 interpolatedNormal;
varying vec3 vertPos;
varying vec3 v_color;

varying vec3 L;
varying vec3 R;
varying vec3 V;

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

    L = normalize(lightPosition - vertPos);
    //L = normalize(vec3(viewMatrix * vec4(lightPosition, 0.0)));
    R = normalize(2.0 * interpolatedNormal * max(0.0, dot(interpolatedNormal,L)) - L);
    V = normalize(vec3(cameraPosition) - vertPos);


    vec3 Ia = vec3(Ka * ambientColor);
    vec3 Id = vec3(Kd * max(0.0,dot(interpolatedNormal,L)));
    vec3 Is = vec3(Kd * pow(max(0.0,dot(R,V)),N));

    v_color = Ia + Id + Is;
  

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vertPos, 1.0);

}
