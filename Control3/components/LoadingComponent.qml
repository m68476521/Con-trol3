import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import QtQuick.XmlListModel 2.0
//import Qt.labs.folderlistmodel 2.1

//FocusScope {
import "LoadingPage.qml"

LoadingPage {
    id: root

    Item {
        height: 1280
        width: 800

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
}
