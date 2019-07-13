import Qt3D.Render 2.13

Viewport{
    id: root_viewport

    property Camera in_camera

    property Layer in_layer_render_target
    property Layer in_layer_render_surface

    property alias out_render_target_texture: color_attachment_texture_00
    property alias out_render_target_texture_01: color_attachment_texture_01

    RenderSurfaceSelector{

        CameraSelector{
            id: camera_selector_1
            camera: root_viewport.in_camera

            LayerFilter{
                layers: [ in_layer_render_target ]

                RenderTargetSelector{
                    id: render_target

                    target: RenderTarget{
                        attachments: [
                            RenderTargetOutput{
                                objectName: "render_target_object"
                                attachmentPoint: RenderTargetOutput.Color0
                                texture:Texture2D{
                                    id: color_attachment_texture_00
                                    width: 512
                                    height: 512
                                    format: Texture.RGBA8_UNorm
                                    generateMipMaps: false
                                    magnificationFilter: Texture.Linear
                                    minificationFilter: Texture.Linear
                                    wrapMode{
                                        x: WrapMode.ClampToEdge
                                        y: WrapMode.ClampToEdge
                                    }
                                }
                            }
                            ,
                            RenderTargetOutput{
                                objectName: "render_target_object"
                                attachmentPoint: RenderTargetOutput.Color1
                                texture:Texture2D{
                                    id: color_attachment_texture_01
                                    width: 512
                                    height: 512
                                    format: Texture.RGBA8_UNorm
                                    generateMipMaps: false
                                    magnificationFilter: Texture.Linear
                                    minificationFilter: Texture.Linear
                                    wrapMode{
                                        x: WrapMode.ClampToEdge
                                        y: WrapMode.ClampToEdge
                                    }
                                }
                            }
//                            ,
//                            RenderTargetOutput
//                            {
//                                objectName: "depth"
//                                attachmentPoint: RenderTargetOutput.Depth
//                                texture:
//                                    Texture2D{
//                                    id: depthAttachment
//                                    width: 512
//                                    height: 512
//                                    format: Texture.D32F
//                                    generateMipMaps: false
//                                    magnificationFilter: Texture.Linear
//                                    minificationFilter: Texture.Linear
//                                    wrapMode
//                                    {
//                                        x: WrapMode.ClampToEdge
//                                        y: WrapMode.ClampToEdge
//                                    }
//                                }
//                            }
                        ]
                    }

                    ClearBuffers{
                        buffers: ClearBuffers.AllBuffers
                        clearColor: "yellow"
                    }
                }
            }

            LayerFilter{
                layers: [ in_layer_render_surface ]

                ClearBuffers{
                    buffers: ClearBuffers.AllBuffers
                    clearColor: "blue"
                }
            }
        }
    }
}

