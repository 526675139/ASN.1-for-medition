import QtQuick 2.12
import QtQuick.Window 2.12
import "qml"

Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    flags: Qt.Window | Qt.FramelessWindowHint
    title: qsTr("Hello World")

    HomePage{
        id: homePage
    }

}
