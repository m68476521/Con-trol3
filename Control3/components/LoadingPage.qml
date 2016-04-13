import QtQuick 2.0
import "."

FocusScope {
    id: root


    function open() {
        innerFocus.state = "opened"
    }

    function close() {
        innerFocus.state = "closed"
        poster.source = ""
        rectangleFader.visible = true
        poster.visible = false
    }

    enabled: isOpened

    Rectangle {
        id: rectangleFader

        anchors.fill: parent

        color: "#80000000"
        opacity: 0
    }

    Image {
        id: poster
        source: ""

        anchors.fill: parent
        visible: false
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        enabled: false

        onClicked: {
            root.clickedOutsideContent()

            if (root.closeOnOuterClick) {
                root.close()
                pageStackView.currentItem.forceActiveFocus()
            }
        }
    }

    MouseArea {
        anchors.fill: focusScope
        enabled: root.isOpened
    }

    FocusScope {
        id: innerFocus

        anchors.centerIn: parent

        height: 400
        width: 300

        transform: Rotation {
            id: rotation

            origin.x: innerFocus.width
            origin.y: innerFocus.height
        }

        state: "closed"

        transitions: [
            Transition {
                from: "closed"
                to: "opened"
                reversible: true

                SequentialAnimation {
                    alwaysRunToEnd: true

                    ParallelAnimation {
                        PropertyAnimation { target: innerFocus; property: "opacity"; duration: 350; easing.type: Easing.InCubic }
                        PropertyAnimation { target: rotation; property: "angle"; duration: 375; easing.type: Easing.InOutQuad }
                        PropertyAnimation { target: rectangleFader; property: "opacity"; duration: 375; easing.type: Easing.InOutQuad }
                    }
                }
            }
        ]

        states: [
            State {
                name: "closed"
                PropertyChanges { target: innerFocus; opacity: 0 }
                PropertyChanges { target: rotation; angle: -45 }
                PropertyChanges { target: rectangleFader; enabled: false }
            },
            State {
                name: "opened"
                PropertyChanges { target: innerFocus; opacity: 1 }
                PropertyChanges { target: rotation; angle: 0 }
                PropertyChanges { target: rectangleFader; opacity: root.fadeBackground ? 1 : 0 }
                PropertyChanges { target: mouseArea; enabled: true }
            }
        ]

    }

}
