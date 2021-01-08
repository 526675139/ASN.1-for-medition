import QtQuick 2.12
import QtQuick.Window 2.12
import "qml"

Window {
    id: mainWindow
    visible: true
    visibility: Window.Maximized

    flags: Qt.Window | Qt.FramelessWindowHint

    onFocusObjectChanged:
    {
        if ( mainWindow.visibility != Window.Maximized )
        {
            console.log("change focus")
            mainWindow.visibility = Window.Maximized
        }
    }

    HomePage{
        id: homePage
    }

}
