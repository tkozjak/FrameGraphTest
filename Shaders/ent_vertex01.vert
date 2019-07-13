#version 430

attribute vec3 vertexxPosition;
uniform mat4 modelViewProjection;

void main(void)
{
    gl_Position = modelViewProjection * vec4( vertexxPosition, 1.0 );
}
