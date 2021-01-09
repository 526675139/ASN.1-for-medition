import QtQuick 2.0

Rectangle {
    id : leftBarPage

    property var spaceSize : 30
    property var buttonWidth : 100
    property var buttonHeight : 100
    InkButton{
        id : inputFile
        x:0
        y:0
        width: buttonWidth
        height: buttonHeight
        buttonText: "导入"
        onButtonClicked: {

        }
    }

    InkButton{
        id : outputFile
        x:0
        anchors.top: inputFile.bottom
        anchors.topMargin: spaceSize
        width: buttonWidth
        height: buttonHeight
        buttonText: "导出"
        onButtonClicked: {

        }
    }


}
