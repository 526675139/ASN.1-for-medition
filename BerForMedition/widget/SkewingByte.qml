import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    color: "transparent"
    height: 30

    property int fixedNum: 0
    property int repeatingNum: 0

    CheckBox {
        id: fixedCK
        checked: false
        text: qsTr("Fixed")

        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter

        onCheckedChanged: {
            if( fixedCK.checked == true )
                fixedNum = Number(fixedInput.text)
            else
                fixedNum = 0
        }
    }

    Rectangle{
        id : fixedR
        radius:10
        anchors.left: fixedCK.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: fixedCK.height/2
        color: "white"
        border.color: "black"
        width: 60

        TextInput{
            id: fixedInput
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            selectByMouse: true
            //horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
            validator: RegExpValidator{regExp:/[0-9]+/}
        }
    }

    CheckBox {
        id: repeatingCK
        checked: false
        text: qsTr("Repeating")

        anchors.left: fixedR.right
        anchors.leftMargin: 200
        anchors.verticalCenter: parent.verticalCenter

        onCheckedChanged: {
            if( repeatingCK.checked == true )
                repeatingNum = Number(repeatingInput.text)
            else
                repeatingNum = 0
        }
    }

    Rectangle{
        id : repeatingR
        radius:10
        anchors.left: repeatingCK.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        height: repeatingCK.height/2
        color: "white"
        border.color: "black"
        width: 60

        TextInput{
            id: repeatingInput
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            selectByMouse: true
            //horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
            validator: RegExpValidator{regExp:/[0-9]+/}
        }
    }
}
