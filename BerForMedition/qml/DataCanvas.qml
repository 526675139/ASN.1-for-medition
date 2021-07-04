import QtQuick 2.0
import "qrc:/widget"

Rectangle  {
    id : dataHomePage

    width:100
    height: 100
    color: "red"


    //两个复选框，跳过50+4
    SkewingByte{
        id: skewingBar
        anchors.left: searchBar.left
        anchors.bottom: searchBar.top
        anchors.bottomMargin: 20
        width:searchBar.width
    }

    //搜索框
    SearchString{
        id: searchBar
        y: 80
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
    }

    //树状图 ，右键可以插入节点
    PkgStruct{
        id: treeStruct
        anchors.left: searchBar.left
        anchors.top: searchBar.bottom
        anchors.topMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        width : searchBar.width/3
    }


    //富文本
    RichInfomation{
        id: richTextArea
        anchors.top: treeStruct.top
        anchors.left: treeStruct.right
        anchors.leftMargin: 30
        height : treeStruct.height/3*2
        width : treeStruct.width


    }

    //节点详细信息，框内提供保存按钮，在信息框内修改保存
    NodeInfomation{
        id : nodeInfo
        anchors.left: richTextArea.left
        anchors.right: richTextArea.right
        anchors.bottom: treeStruct.bottom
        anchors.top: richTextArea.bottom
        anchors.topMargin: 30
    }

    Rectangle{
        anchors.left: nodeInfo.right
        anchors.leftMargin: 30
        anchors.right: searchBar.right
        anchors.top: treeStruct.top
        anchors.bottom: treeStruct.bottom

        color: "transparent"
        border.color: "gray"
        radius: 10
        border.width: 3
        Text {
            anchors.fill: parent
            anchors.margins: 10
            text: qsTr("text")
        }
    }
}
