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
    vec3 interpolatedNormal = normalize(vec3(normalMatrix * normal));

    //intensity = max(0.0,dot(normalize(lightPosition), interpolatedNormal));

    vec3 L = normalize(vec3(modelViewMatrix * vec4((lightPosition - vertPos),0.0)));
    vec3 R = normalize(2.0 * interpolatedNormal * max(0.0, dot(interpolatedNormal,L)) - L);
    vec3 V = normalize(vec3(modelViewMatrix * vec4((cameraPosition - vertPos),0.0)));

    vec3 H = normalize((L+V)/2.0);  

    float intensity = (1.0 + max(0.0, dot(interpolatedNormal,L)))/2.0;

    if(abs(dot(interpolatedNormal, V) - 0.0) < 0.1){
    	v_color = vec3(0.0,0.0,0.0);
    }else{

    v_color =  intensity * unlitColor * (vec3(0.15,0.2,0.3) + 
			  (1.0 - intensity) * vec3(0.0,1.0,0.0));
			  //vec3(Ks * pow(dot(H,interpolatedNormal),N));
	}
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
