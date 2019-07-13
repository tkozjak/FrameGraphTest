import Qt3D.Core 2.13
import Qt3D.Render 2.13
import Qt3D.Extras 2.13


Entity {

    id: entity_root

    property Layer in_render_layer

    DiffuseSpecularMaterial{
        id: diffuse_specular_material
        ambient: Qt.rgba(1.0, 0.6, 0.0, 1.0)
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
                            parameters: [
                                Parameter{
                                    name: "texture"
//                                    value:Texture2D {
//                                        id: diffuse_texture
//                                        minificationFilter: Texture.LinearMipMapLinear
//                                        magnificationFilter: Texture.Linear
//                                        wrapMode {
//                                            x: WrapMode.Repeat
//                                            y: WrapMode.Repeat
//                                        }
//                                        generateMipMaps: true
//                                        maximumAnisotropy: 16.0
//                                        TextureImage {
//                                            id: texture_image
//                                            source: "qrc:/Textures/stone.jpg"
//                                        }
//                                    }
//                                    value: frame_graph_02.out_render_target_texture
                                    value: frame_graph_02.out_render_target_texture_01
                                }
                            ]
                            shaderProgram: ShaderProgram{
                                vertexShaderCode: loadSource("qrc:/Shaders/vertex01.vert")
                                fragmentShaderCode: loadSource("qrc:/Shaders/fragment01.frag")
                            }
                        }
                    ]
                }
            ]
        }
    }

    CuboidMesh{
        id: cubeMesh
        xExtent: 10
        yExtent: 10
        zExtent: 10
    }

    Transform {
        id: transform_01
        scale3D: Qt.vector3d(2.0, 2.0, 2.0)
        rotation: fromAxisAndAngle(Qt.vector3d(1, 0, 0), 0)
    }

    Entity {
        id: cubeEntity
        components: [ cubeMesh, custom_material, transform_01, in_render_layer ]
    }

}
