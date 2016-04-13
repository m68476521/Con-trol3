import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import "QML.componets"// 1.0 as COMP
//import "components" as CO
//import components 2.0 as CO

import "components" as CO

Window {
    id: root

    property bool debug: false

    visible: true
    width: debug ? 1280 : undefined
    height: debug ? 800 : undefined

//    MainForm {
//        anchors.fill: parent
//        mouseArea.onClicked: {
//            Qt.quit();
//        }
//    }

    Rectangle {
        width: debug ? 1280 : undefined
        height: debug ? 800 : undefined

        color: "#BFDD9D"

        Image {
            id: imageBackGround

            visible: !busyIndicator2.visible

            width: debug ? 1280 : undefined
            height: debug ? 800 : undefined

            fillMode: Image.Tile

            source: "imagen/scarface.jpg"
        }
    }

    Loader {
        id: mainComponent
    }

//    LoadingComponent {
//       id: loading
//    }

//   CO.LoadingPage {
//        id: page
//    }

    Component.onCompleted: {
        firstTimer.restart()
    }

    Item {
        id: loadindItem

        anchors.centerIn: parent

        visible: false
        width: debug ? 1280 : undefined
        height: debug ? 800 : undefined

        Rectangle {
            anchors.centerIn: parent
            width: debug ? 1280 : undefined
            height: debug ? 800 : undefined

            visible: loadindItem.visible

            color: "#000000"

            opacity: 0.5
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
//                loadindItem.visible = false
            }
        }

        BusyIndicator {
            id: busyIndicator

            anchors.centerIn: parent

            running: true

            style: BusyIndicatorStyle {
                indicator: Image {
                    id: imageIndicator

                    RotationAnimation on rotation {
                        running: true
                        loops: Animation.Infinite
                        duration: 3000
                        from: 0; to: 360
                    }

                    source: "imagen/9.png"
                }
            }
        }
    }

    Timer {
        id: firstTimer

        interval: 3000
        running: false
        repeat: false
        onTriggered: busyIndicator2.visible = false
    }

    BusyIndicator {
        id: busyIndicator2

        running: true

        //        visible: loadindItem.visible

        anchors.centerIn: parent

//        style: BusyIndicatorStyle {
//            indicator: Item {

                RotationAnimation on rotation {
                    running: true
                    loops: Animation.Infinite
                    duration: 5000
                    from: 0; to: 180
                }
//            }
//        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: debug ? 1280 : undefined
        height: debug ? 800 : undefined

        visible: busyIndicator2.visible

        color: "#000000"

        opacity: 0.5
    }

//    BusyIndicator {
//        running: true

//        visible: loadindItem.visible

//        anchors.centerIn: parent

//        RotationAnimation on rotation {
//            running: true
//            loops: Animation.Infinite
//            duration: 3000
//            from: 0; to: 360
//        }
//    }

    Rectangle {
        id: rect1

        anchors {
            centerIn: parent
        }
    }

//    Rectangle {
//        id: rect2

//        width: 100

//        anchors {
//            centerIn: parent
//        }
//    }

//    Rectangle {
//        id: rect3

//        anchors {
//            centerIn: parent
//        }
//    }
}
//console log
