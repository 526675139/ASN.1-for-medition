import QtQuick 2.0

Rectangle {
    id: page

    color: "transparent"
    border.color: "gray"
    width: 200
    height: 25
    radius: 10

    Rectangle{
        id : inputRectangle
        radius:10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height-5
        anchors.right: parent.right
        anchors.rightMargin: 70
        color: "white"
        border.color: "black"

        TextInput{
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            selectByMouse: true
            //horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
        }
    }

    Button_1{
        id : startSrearch

        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: inputRectangle.top
        anchors.bottom: inputRectangle.bottom

        width: 50
        buttonText: "搜寻"

        onButtonClicked: {
            console.log("filepath1111111111111111")
        }
    }
}
