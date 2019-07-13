import Qt3D.Render 2.13

RenderSurfaceSelector{

    property alias in_camera: camera_selector.camera

    Viewport{

        ClearBuffers{
            buffers: ClearBuffers.AllBuffers
            clearColor: "blue"

            CameraSelector{
                id: camera_selector
            }
        }
    }
}

