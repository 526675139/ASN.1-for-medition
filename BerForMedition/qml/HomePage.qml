import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "#3b9c0e"


    SysBtnGroup
    {
        id: sysbtngrp
        anchors.right: parent.right
        anchors.top: parent.top

        onMin: mainWindow.showMinimized()
        onClose: mainWindow.close()
    }
}
