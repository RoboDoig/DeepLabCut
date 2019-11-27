import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("DeepLabCut PyQt")

    GroupBox {
        id: groupBox
        x: 0
        y: 20
        width: 640
        height: 200
        title: qsTr("Group Box")
    }
}
