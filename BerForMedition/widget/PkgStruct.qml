import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
import QtQml.Models 2.2

Rectangle {
    color: "transparent"
    border.color: "gray"
    radius: 10
    border.width: 3

    property variant nodePic: ["qrc:/pic/pan.png", "qrc:/pic/dir.png", "qrc:/pic/file.png"]

    TreeView {
        id: myTree
        anchors.fill: parent
        style: treeViewStyle
        selection: sel
        //headerVisible: false
        Component.onCompleted: {
            model = TreeModel.model() //从TreeModel获取model
        }

        itemDelegate: Item {
            //节点代理
            id: treeItem
            Image {
                //节点前的图片
                id: nodeImg
                height: parent.height
                width: parent.height
                source: {
                    //不同级的节点图片不一样
                    if (styleData.depth == 0) {
                        return nodePic[0]
                    } else if (styleData.depth == 1) {
                        return nodePic[1]
                    } else if (styleData.depth == 2) {
                        return nodePic[2]
                    }
                }
            }
            Text {
                id: itemText
                anchors.left: nodeImg.right
                anchors.leftMargin: 4
                anchors.bottom: parent.bottom
                // elide: styleData.elideMode
                text: styleData.value //显示来自model的文本
                color: styleData.selected ? "#007dff" : "white" //选中时字体颜色切换
                font.pointSize: styleData.selected ? 10 : 9 //选中时字体大小改变

//                Drag.active: styleData.depth <= 1 ? false : itemMosue.drag.active //一级节点不可拖动
//                Drag.supportedActions: Qt.CopyAction //选择复制数据到DropArea
//                Drag.dragType: Drag.Automatic //选择自动开始拖动
//                Drag.mimeData: {
//                    "text": text
//                } //选择要传的数据，这里传文本

                MouseArea {
                    //节点代理的鼠标事件
                    id: itemMosue
                    hoverEnabled: true
                    anchors.fill: parent
                    drag.target: itemText

//                    Drag.onDragStarted: {
//                        //控制台打印开始拖动
//                        console.log("start")
//                    }
//                    onPressed: {
//                        sel.setCurrentIndex(styleData.index,
//                                            0x0010) //点击了文字，选中该节点
//                        if (styleData.isExpanded) {
//                            //切换节点的展开状态
//                            myTree.collapse(styleData.index)
//                        } else {
//                            myTree.expand(styleData.index)
//                        }
//                    }
                }
            }
        }
        TableViewColumn {
            //列
            title: qsTr("所有通道")
            role: "text" //显示的元素
            width: 200 //列的宽
        }
    }
    ItemSelectionModel {
        //自定义添加选中
        id: sel
        model: TreeModel.model()
    }
    Component {
        id: treeViewStyle //树的自定义样式
        TreeViewStyle {
            indentation: 30 //节点间隔
            branchDelegate: Image {
                //节点的展开标记图
                id: image
                source: styleData.isExpanded ? "qrc:/pic/collapse.png" : "qrc:/pic/expansion.png"
                width: 9
                height: 9
                anchors.top: parent.top
                anchors.topMargin: 2
            }
            rowDelegate: Rectangle {
                //行代理
                height: 16
                color: styleData.selected ? "#e9fffd" : "#323232" //这里决定了节点选中的颜色和背景颜色
            }
        }
    }
}
