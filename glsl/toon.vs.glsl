varying vec3 interpolatedNormal;
varying vec3 v_color;

uniform float Ka;
uniform float Kd;
uniform float Ks;
uniform float N;
uniform float alpha;

uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;

uniform vec3 litColor;
uniform vec3 unlitColor;

void main() {
    vec3 vertPos = vec3(modelViewMatrix * vec4(position,0.0));
    interpolatedNormal = normalize(vec3(modelViewMatrix * vec4(normal, 0.0)));

    //intensity = max(0.0,dot(normalize(lightPosition), interpolatedNormal));

    vec3 L = normalize(vec3(modelViewMatrix * vec4((lightPosition - vertPos),0.0)));
    vec3 R = normalize(2.0 * interpolatedNormal * max(0.0, dot(interpolatedNormal,L)) - L);
    vec3 V = normalize(vec3(modelViewMatrix * vec4((cameraPosition - vertPos),0.0)));

    float intensity = (1.0 + max(0.0, dot(interpolatedNormal,L)))/2.0;

    if(abs(dot(interpolatedNormal, V) - 0.0) < 0.1){
    	v_color = vec3(0.0,0.0,0.0);
    }

    v_color = vec3(Ka * ambientColor) + 
			  intensity * vec3(0,0,0.9) + 
			  (1.0 - intensity) * vec3(1.0,0.5,0.5) + 
			  vec3(Kd * pow(max(0.0,dot(R,V)),N));


 //    if (intensity > 0.95)
	// 	v_color = vec3(1.0,0.5,0.5);
	// else if (intensity > 0.5)
	// 	v_color = vec3(0.6,0.3,0.3);
	// else if (intensity > 0.25)
	// 	v_color = vec3(0.4,0.2,0.2);
	// else
	// 	v_color = vec3(0.2,0.1,0.1);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
