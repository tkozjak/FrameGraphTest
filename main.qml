import QtQuick 2.13
import QtQuick.Window 2.13

import QtQuick.Scene3D 2.13

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Scene3D{
        focus: true
        anchors.fill: parent
        anchors.margins: 10
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
        multisample: true

        RenderScene3D{}
    }
}
