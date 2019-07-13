#version 430

attribute vec3 vertexPosition;
attribute vec3 vertexNormal;

uniform mat4 modelViewProjection;
uniform mat4 modelMatrix;

out vec4 vertexNormal_world;

void main(void)
{
    gl_Position = modelViewProjection * vec4( vertexPosition, 1.0 );
    vertexNormal_world = modelMatrix * vec4( vertexNormal, 0.0 );
}
