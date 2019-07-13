#version 430

//uniform sampler2D texture;
//varying vec2 vertexUV;

uniform vec3 lightDirection = vec3(0.0, -1.0, 0.0);

layout(location = 0) out vec4 colorOut;
layout(location = 1) out vec4 colorOut_01;

void main(void)
{
//    vec4 texCol = texture2D(texture, vertexUV );
//    colorOut = texCol;
    colorOut = vec4(1.0, 0.0, 0.0, 1.0);
    colorOut_01 = vec4(1.0, 0.0, 1.0, 1.0);
}
