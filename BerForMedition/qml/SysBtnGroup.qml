import QtQuick 2.7

Row
{
    id: sysbtngroup
    spacing: 0

    signal min
    signal close  

    SysBtn
    {
        id:min
        picHover: "qrc:/image/image/min_hover.png"
        picNormal: "qrc:/image/image/min_normal.png"
        picPressed: "qrc:/image/image/min_pressed.png"
        onClicked:
        {
            console.log("min btn clicked")
            sysbtngroup.min()
        }
    }

    SysBtn
    {
        id:close
        picHover: "qrc:/image/image/close_hover.png"
        picNormal: "qrc:/image/image/close_normal.png"
        picPressed: "qrc:/image/image/close_pressed.png"
        onClicked:
        {
            console.log("close btn clicked")
            sysbtngroup.close()
        }
    }
}
