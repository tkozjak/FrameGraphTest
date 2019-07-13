#version 430

uniform vec3 lightDirection = vec3(0.0, -1.0, 0.0);

in vec4 vertexNormal_world;

layout(location = 0) out vec4 colorOut_00;
layout(location = 1) out vec4 colorOut_01;

void main(void)
{
    colorOut_00 = vec4(1.0, 0.0, 0.0, 1.0);
    colorOut_01 = vec4(vertexNormal_world.xyz, 1.0);
}
