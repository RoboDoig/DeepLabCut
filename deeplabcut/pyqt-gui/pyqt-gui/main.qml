import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11
import QtQuick.Dialogs 1.1

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

    FileDialog {
        id: videoFileDialog
        title: "Select Video"
        nameFilters: ["Video Files (*.mp4)"]

        onAccepted: {
            iface.load_video(videoFileDialog.fileUrl)
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
            id: projectNameLabel
            text: qsTr("Name of the project:")
            font.pointSize: 12
            horizontalAlignment: Text.AlignLeft
        }

        TextInput {
            id: projectNameEdit
            width: 80
            height: 20
            text: qsTr("Project Name")
            font.pointSize: 12
            Layout.fillWidth: true
        }

        Label {
            id: experimenterNameLabel
            text: qsTr("Name of the experimenter:")
            font.pointSize: 12
        }

        TextInput {
            id: experimenterNameEdit
            width: 80
            height: 20
            text: qsTr("Experimenter Name")
            font.pointSize: 12
            Layout.fillWidth: true
        }

        Label {
            id: chooseVideoLabel
            text: qsTr("Choose the videos:")
            font.pointSize: 12
        }

        Button {
            id: chooseVideoButton
            text: qsTr("Load Videos")
            Layout.fillWidth: false

            onClicked: {
                videoFileDialog.open()
            }
        }

        Button {
            id: okButton
            text: qsTr("OK")
            Layout.fillWidth: false

            onClicked: iface.create_new_project(projectNameEdit.text, experimenterNameEdit.text)
        }
    }

}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}D{i:4;anchors_height:434;anchors_width:640;anchors_x:0;anchors_y:46}
}
##^##*/
