import Qt3D.Core 2.13
import Qt3D.Render 2.13
import Qt3D.Extras 2.13

import QtQuick 2.13 as QQ2

Entity {

    property Layer in_render_layer

    Buffer{
        id: vertex_buffer
        type: Buffer.VertexBuffer
        data: {
            var buffer = new Float32Array(4*3);

            buffer[0] = 10.0;
            buffer[1] = 0.0;
            buffer[2] = 10.0;

            buffer[3] = 10.0;
            buffer[4] = 0.0;
            buffer[5] = -10.0;

            buffer[6] = -10.0;
            buffer[7] = 0.0;
            buffer[8] = -10.0;

            buffer[9] = -10.0;
            buffer[10] = 0.0;
            buffer[11] = 10.0;

            console.log( "buffer created" );
            return buffer;
        }
    }

    GeometryRenderer{
        id: geometry_renderer
        instanceCount: 1
        indexOffset: 0
        firstInstance: 0

        primitiveType: GeometryRenderer.LineLoop

        geometry: Geometry{
            boundingVolumePositionAttribute: vertex_position
            Attribute{
                id: vertex_position
                attributeType: Attribute.VertexAttribute
                vertexBaseType: Attribute.Float

                vertexSize: 3
                byteOffset: 0
                byteStride: 3*4
                count: 4
                name: "vertexxPosition"
                buffer: vertex_buffer
            }
        }
    }

    Transform {
        id: transform
        translation: Qt.vector3d( 0.0, 0.0, 0.0 )
        scale3D: Qt.vector3d( 1.2, 1.2, 1.2 )
        rotation: fromAxisAndAngle( Qt.vector3d(1, 0, 0), 0.0 )
    }


    Material{
        id: custom_material
        parameters: []

        effect: Effect{
            parameters: []
            techniques: [
                Technique{
                    // GraphicsApiFilter

                    parameters: []
                    filterKeys: []

                    renderPasses: [
                        RenderPass{
                            id: render_pass_01
                            filterKeys: []
                            renderStates: []
                            parameters: []
                            shaderProgram: ShaderProgram{
                                vertexShaderCode: loadSource("qrc:/ent_vertex01.vert")
                                fragmentShaderCode: loadSource("qrc:/ent_fragment01.frag")
                            }
                        }
                    ]
                }
            ]
        }
    }

    Entity{
        id: custom_entity
        components: [ geometry_renderer, transform, custom_material, in_render_layer ]
    }

}
