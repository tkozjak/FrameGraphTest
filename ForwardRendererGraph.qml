import Qt3D.Extras 2.13

ForwardRenderer{

    property alias in_camera: forward_renderer.camera

    id: forward_renderer
    clearColor: "red"
}
