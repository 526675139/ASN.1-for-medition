import QtQuick 2.0
import "qrc:/widget"
import LoadBerFile 1.0

Rectangle {
    id: homePage
    anchors.fill: parent
    color: "#3b9c0e"

    signal startReadFile(string value)
    LoadBerFile{id: loadBer}

    Image {
        id: skinpic
        x: 0
        y: 0
        anchors.fill: parent
        fillMode: Image.TileHorizontally
        source: "qrc:/image/image/background.jpg"

        //标题栏
        Rectangle {
            id: topBar
            anchors.left: parent.left
            anchors.right: parent.right
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

            SysBtnGroup {
                id: sysbtngrp
                anchors.right: parent.right
                anchors.top: parent.top
                onMin: mainWindow.showMinimized()
                onClose: mainWindow.close()
            }
        }

        //侧边栏
        Rectangle {
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

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onExited: leftBar.x = -298
                onEntered: {
                    dataCanvas.visible = true
                    leftBar.x = -200
                }

                LeftBar {
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.right: parent.right
                    anchors.rightMargin: 2
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    width: 100
                    color: "transparent"

                    onStartReadFile: {
                        //到C++处理文件内容，不直接调用，以避免阻塞运行，发信号给C++执行加载->QML显示进度条->C++执行过程中给qml发信号，构建树和富文本->C++读取文件结束，给QML发信号，完成加载
                        homePage.startReadFile( value )
                    }
                }
            }
            Behavior on x {
                //定义x属性上的行为动画
                PropertyAnimation {
                    duration: 1000
                    easing.type: Easing.InQuart //加速运动
                }
            }
        }

        //进度条    屏蔽其他所有窗体，展示进度

        //业务数据画布
        DataCanvas {
            id: dataCanvas
            visible: false

            anchors.top: leftBar.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 150

            radius: 40
            clip: true
            color: "#33858f94"
        }

    }


    //读取文件过程中，在界面构造树结构和富文本
    function addItem(){

    }

    //读取文件结束，关闭模态进度条
    function finishReadFile(str){
        console.log('qml function finishReadFile',str)
    }


    //qml构造函数
    Component.onCompleted: {
        //关联信号与信号处理函数的方式同QML中的类型
        //Cpp对象的信号关联到Qml
        //cpp_obj.onCppSignalA.connect(function(){console.log('qml signalA process')})
        //cpp_obj.onCppSignalA.connect(()=>console.log('qml signalA process')) //js的lambda
        loadBer.finishLoadFile.connect(finishReadFile)


        //Qml对象的信号关联到Cpp
        homePage.onStartReadFile.connect(loadBer.receiveReadFileReq)
    }
}
