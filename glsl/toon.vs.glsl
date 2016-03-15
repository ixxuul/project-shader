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
    vertPos = vec3(modelViewMatrix * vec4(position,0.0));
    interpolatedNormal = normalize(vec3(modelViewMatrix * vec4(normal, 0.0)));
    intensity = max(0.0,dot(normalize(lightPosition), interpolatedNormal));

    if (intensity > 0.95)
		v_color = vec3(1.0,0.5,0.5);
	else if (intensity > 0.5)
		v_color = vec3(0.6,0.3,0.3);
	else if (intensity > 0.25)
		v_color = vec3(0.4,0.2,0.2);
	else
		v_color = vec3(0.2,0.1,0.1);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vertPos, 1.0);
}
