import QtQuick 2.0

Rectangle {
    id: page

    color: "white"
    border.color: "black"

    property alias buttonText: buttonLabel.text

    radius: 10

    signal buttonClicked

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            page.border.width = 2
        }
        onExited: {
            page.border.width = 1
            page.color = "white"
        }

        onPressed: {
            buttonLabel.font.bold= true
        }

        onClicked: {
            page.buttonClicked()
            buttonLabel.font.bold= false
        }
    }

    Text {
        id: buttonLabel
        text: qsTr("text")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
    }
}
