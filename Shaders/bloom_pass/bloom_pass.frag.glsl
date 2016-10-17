#version 450

#ifdef GL_ES
precision mediump float;
#endif

#include "../compiled.glsl"
//const float bloomTreshold = 3.0;

uniform sampler2D tex;

in vec2 texCoord;
out vec4 fragColor;

void main() {
	vec4 col = texture(tex, texCoord);
	float brightness = dot(col.rgb, vec3(0.2126, 0.7152, 0.0722));
	if (brightness > bloomTreshold) {
		fragColor.rgb = vec3(col.rgb);
		return;
	}
	fragColor.rgb = vec3(0.0);
}