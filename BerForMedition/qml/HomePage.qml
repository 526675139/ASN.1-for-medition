import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "#3b9c0e"

    Image {
        id: skinpic
        x: 0
        y: 0
        anchors.fill: parent
        fillMode: Image.TileHorizontally
        source: "qrc:/image/image/background.jpg"

        //标题栏
        Rectangle{
            id : topBar
            anchors.left: parent.left
            anchors.right : parent.right
            anchors.top: parent.top
            height: sysbtngrp.height
            color: "#33b1a7a7"

            Text {
                id: title
                x: 5
                y: 3
                width: 125
                height: 12
                color: "#ffffff"
                text: "montage by Inky"
                font.family: "微软雅黑"
                font.pixelSize: 12
            }

            MouseArea {
                anchors.fill: parent
                property variant previousPosition
                onPressed: {
                    previousPosition = Qt.point(mouseX, mouseY)
                }
                onPositionChanged: {
                    if (pressedButtons == Qt.LeftButton) {
                        var dx = mouseX - previousPosition.x
                        var dy = mouseY - previousPosition.y
                        mainWindow.setX(mainWindow.x + dx)
                        mainWindow.setY(mainWindow.y + dy)
                    }
                }
            }

            SysBtnGroup
            {
                id: sysbtngrp
                anchors.right: parent.right
                anchors.top: parent.top
                onMin: mainWindow.showMinimized()
                onClose: mainWindow.close()
            }
        }


        //侧边栏
        Rectangle{
            id: leftBar
            anchors.top: topBar.bottom
            anchors.topMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            radius: 40
            clip: true

            x: -298
            width: 300
            color: "#99858f94"

            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onExited: leftBar.x=-298
                onEntered: leftBar.x = -200

                LeftBar{
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 2
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    width: 100
                    color: "transparent"
                }

            }
            Behavior on x{  //定义x属性上的行为动画
                PropertyAnimation{
                    duration: 1000
                    easing.type: Easing.InQuart //加速运动
                }
            }
        }


        //进度条    屏蔽其他所有窗体，展示进度


        //画布用于画树形图    增加搜索框


        //画布，用于展示富文本


        //画布用于展示详细信息

    }

}
