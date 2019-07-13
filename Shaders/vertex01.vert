#version 430

attribute vec3 vertexPosition;
attribute vec2 vertexTexCoord;
uniform mat4 modelViewProjection;

varying vec2 vertexUV;

void main(void)
{
    gl_Position = modelViewProjection * vec4( vertexPosition, 1.0 );
    vertexUV = vertexTexCoord;
}
