import QtQuick 2.0

Rectangle {

    color: "transparent"

    property alias buttonText: buttonText.text
    signal buttonClicked

    Image {
        id: backPng
        anchors.fill: parent
        fillMode: Image.TileHorizontally
        source: "qrc:/image/image/cloud_2.png"

        AnimatedImage {
            id: animated
            source: ""
            anchors.fill: parent
            paused: true

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    animated.paused = false
                    animated.source = "qrc:/image/image/inkClicked.gif"
                }
                onExited: {
                    animated.paused = true
                    buttonText.font.pointSize = 20
                    animated.source = ""
                }

                onClicked: {
                    buttonText.font.pointSize = 25
                    buttonClicked()
                }
            }

            Text {
                id: buttonText
                text: qsTr("text")
                font.pointSize: 20
                //font.bold: true
                font.family: "华文行楷"
                anchors.horizontalCenter:  parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }




}
