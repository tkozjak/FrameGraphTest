import Qt3D.Core 2.13
import Qt3D.Render 2.13
import Qt3D.Input 2.13
import Qt3D.Extras 2.13

import QtQuick 2.2 as QQ2

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

    OrbitCameraController{
        camera: perspective_camera
    }

    components: [
        RenderSettings{
            activeFrameGraph: FrameGraph_02{
                id: frame_graph_02
                in_camera: perspective_camera
                in_layer_render_surface: layer_render_surface
                in_layer_render_target: layer_render_target
            }
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

    Torus_01{
        in_render_layer: layer_render_target
    }

    Cuboid_01{
        in_render_layer: layer_render_surface
    }

    CustomEntity_01{
        in_render_layer: layer_render_surface
    }

    QQ2.Component.onCompleted: {
        console.log( "3d scene completed" )
    }

}
