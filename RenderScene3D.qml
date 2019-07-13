import Qt3D.Core 2.13
import Qt3D.Render 2.13
import Qt3D.Input 2.13
import Qt3D.Extras 2.13

Entity {

    id: render_scene_root

    Camera{
        id: perspective_camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 70
        nearPlane: 0.1
        farPlane: 1000.0

        position: Qt.vector3d( 0.0, 0.0, 40.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }

    //    FirstPersonCameraController{
    //        camera: perspective_camera
    //    }

    OrbitCameraController{
        camera: perspective_camera
    }

    components: [
        RenderSettings{
            //            activeFrameGraph: FrameGraph_01{
            //                in_camera: perspective_camera
            //            }
            activeFrameGraph: FrameGraph_02{
                id: frame_graph_02
                in_camera: perspective_camera
                in_layer_render_surface: layer_render_surface
                in_layer_render_target: layer_render_target
            }
            //            activeFrameGraph: ForwardRendererGraph{
            //                in_camera: perspective_camera
            //            }
        },
        InputSettings{

        }
    ]

    Layer {
        id: layer_render_target
        recursive: true
    }

    Layer {
        id: layer_render_surface
        recursive: true
    }

    TorusMesh {
        id: torusMesh
        radius: 5
        minorRadius: 1
        rings: 100
        slices: 20
    }

    CuboidMesh{
        id: cubeMesh
        xExtent: 10
        yExtent: 10
        zExtent: 10
    }

    PhongMaterial {
        id: material
    }

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
                    graphicsApiFilter{
                        api: GraphicsApiFilter.OpenGL
                        profile: GraphicsApiFilter.CoreProfile
                        majorVersion: 4
                        minorVersion: 3
                    }

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
//                                            source: "qrc:/stone.jpg"
//                                        }
//                                    }
                                    value: frame_graph_02.out_render_target_texture
                                }
                            ]
                            shaderProgram: ShaderProgram{
                                vertexShaderCode: loadSource("qrc:/vertex01.vert")
                                fragmentShaderCode: loadSource("qrc:/fragment01.frag")
                            }
                        }
                    ]
                }
            ]
        }
    }

    Transform {
        id: torusTransform
        scale3D: Qt.vector3d(2.0, 2.0, 2.0)
        rotation: fromAxisAndAngle(Qt.vector3d(1, 0, 0), 0)
    }

    Entity {
        id: torusEntity
        components: [ torusMesh, material, torusTransform, layer_render_target ]
    }

    Entity {
        id: cubeEntity
        components: [ cubeMesh, /*diffuse_specular_material*/custom_material, torusTransform, layer_render_surface ]
    }

}
