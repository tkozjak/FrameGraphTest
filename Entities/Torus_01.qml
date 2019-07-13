import Qt3D.Core 2.13
import Qt3D.Render 2.13
import Qt3D.Extras 2.13


Entity {
    id: entity_root

    property Layer in_render_layer

    PhongMaterial {
        id: phong_material
    }

    DiffuseSpecularMaterial{
        id: diffuse_specular_material
        ambient: Qt.rgba(1.0, 0.6, 0.0, 1.0)
    }

    Material{
        id: custom_rt_mat
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
                            filterKeys: []
                            renderStates: []
                            parameters: []
                            shaderProgram: ShaderProgram{
                                vertexShaderCode: loadSource("qrc:/Shaders/rt_vertex01.vert")
                                fragmentShaderCode: loadSource("qrc:/Shaders/rt_fragment01.frag")
                            }
                        } // render pass
                    ]
                } // technique
            ]
        } // effect
    } // material

    TorusMesh {
        id: torusMesh
        radius: 5
        minorRadius: 1
        rings: 100
        slices: 20
    }

    Transform {
        id: torusTransform
        scale3D: Qt.vector3d(2.0, 2.0, 2.0)
        rotation: fromAxisAndAngle(Qt.vector3d(1, 0, 0), 0)
    }

    Entity {
        id: torusEntity
        components: [ torusMesh, custom_rt_mat, torusTransform, in_render_layer ]
    }
}
