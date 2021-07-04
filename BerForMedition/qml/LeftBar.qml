import QtQuick 2.0
import QtQuick.Dialogs 1.2
import Qt.labs.platform 1.1
import "qrc:/widget"

Rectangle {
    id: leftBarPage

    property var spaceSize: 30
    property var buttonWidth: 100
    property var buttonHeight: 100

    signal startReadFile(string value)


    InkButton {
        id: inputFile
        x: 0
        y: 0
        width: buttonWidth
        height: buttonHeight
        buttonText: "导入"
        onButtonClicked: {
            openFileDialog.open()
        }
    }

    InkButton {
        id: outputFile
        x: 0
        anchors.top: inputFile.bottom
        anchors.topMargin: spaceSize
        width: buttonWidth
        height: buttonHeight
        buttonText: "导出"
        onButtonClicked: {
            outFileDialog.open()
        }
    }

    FileDialog {
        id: openFileDialog
        title: qsTr("Please choose a BER file")
        nameFilters: ["*.*"]
        onAccepted: {
            //var filepath = new String(openFileDialog.file)
            //console.log(filepath)

            //到C++处理文件内容，不直接调用，以避免阻塞运行，发信号给C++执行加载->QML显示进度条->C++执行过程中给qml发信号，构建树和富文本->C++读取文件结束，给QML发信号，完成加载
            leftBarPage.startReadFile( openFileDialog.file )

            //模态显示进度条

        }
    }
    FileDialog{
        id: outFileDialog
        fileMode: FileDialog.SaveFile
        onAccepted: {
            //var filepath = new String(fileUrl)
            console.log(outFileDialog.file)
            //将内存数据写入硬盘

        }
    }




}
