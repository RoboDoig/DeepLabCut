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

    MenuBar {
        x: 0
        y: 0
        width: 640
        height: 40
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
        }
    }

    GridLayout {
        id: gridLayout
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 40
        anchors.fill: parent
        columnSpacing: 20
        rowSpacing: 5
        rows: 3
        columns: 2

        Label {
            id: label
            text: qsTr("Name of the project:")
            font.pointSize: 12
            horizontalAlignment: Text.AlignLeft
        }

        TextInput {
            id: textInput
            width: 80
            height: 20
            text: qsTr("Project Name")
            font.pointSize: 12
            Layout.fillWidth: true
        }

        Label {
            id: label1
            text: qsTr("Name of the experimenter:")
            font.pointSize: 12
        }

        TextInput {
            id: textInput1
            width: 80
            height: 20
            text: qsTr("Experimenter Name")
            font.pointSize: 12
            Layout.fillWidth: true
        }

        Label {
            id: label2
            text: qsTr("Choose the videos:")
            font.pointSize: 12
        }

        Button {
            id: button
            text: qsTr("Load Videos")
            Layout.fillWidth: false
        }
    }

}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}D{i:4;anchors_height:434;anchors_width:640;anchors_x:0;anchors_y:46}
}
##^##*/
