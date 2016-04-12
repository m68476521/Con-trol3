import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root

    visible: true
    width: 1280
    height: 800

//    MainForm {
//        anchors.fill: parent
//        mouseArea.onClicked: {
//            Qt.quit();
//        }
//    }

    Rectangle {
        width: 1280
        height: 800

        color: "transparent"


        Image {
            id: imageBackGround

//            z:1000

            anchors.fill: root

            fillMode: Image.Tile

//            width: 100
//            height: 200

//            source: "uno.png"
            source: "imagen/scarface.jpg"
        }
    }
}
//console log
