#version 430

uniform sampler2D texture;
varying vec2 vertexUV;

out vec4 colorOut;

void main(void)
{
    vec4 texCol = texture2D(texture, vertexUV );
    colorOut = texCol;
    colorOut = vec4(1.0, 0.0, 0.0, 1.0);
}
