import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11
import QtQuick.Dialogs 1.1

ApplicationWindow {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("DeepLabCut PyQt")

    MenuBar {
        x: 0
        y: 0
        height: 40
        width: parent.width
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
        id: mainGridLayout
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 40
        anchors.fill: parent
        rows: 2
        columns: 1

        Rectangle {
            id: createProjectPane
            border.color: "black"
            Layout.fillHeight: true
            Layout.fillWidth: true

            GridLayout {
                id: createProjectGridLayout
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
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
                    text: qsTr("Project")
                    font.pointSize: 12
                    Layout.fillWidth: true
                }

                Label {
                    id: experimenterNameLabel
                    text: qsTr("Experiment name:")
                    font.pointSize: 12
                    horizontalAlignment: Text.AlignLeft
                }

                TextInput {
                    id: experimenterNameEdit
                    text: qsTr("Experimenter")
                    font.pointSize: 12
                    Layout.fillWidth: true
                }

                Label {
                    id: chooseVideoLabel
                    text: qsTr("Choose videos")
                    font.pointSize: 12
                }

                Button {
                    id: chooseVideoButton
                    text: qsTr("Load Videos")
                    Layout.preferredHeight: 30
                    Layout.fillWidth: false
                    font.pointSize: 12

                    onClicked: {
                        videoFileDialog.open()
                    }
                }
            }
        }

        Rectangle {
            id: extractFramesPane
            border.color: "black"
            Layout.fillHeight: true
            Layout.fillWidth: true

            GridLayout {
                id: extractFramesGridLayout
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.fill: parent
                columnSpacing: 20
                rowSpacing: 5
                rows: 3
                columns: 2
             }
        }
    }

    /*
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
            font.pointSize: 8
            horizontalAlignment: Text.AlignLeft
        }

        TextInput {
            id: projectNameEdit
            width: 80
            height: 20
            text: qsTr("Project")
            font.pointSize: 8
            Layout.fillWidth: true
        }

        Label {
            id: experimenterNameLabel
            text: qsTr("Name of the experimenter:")
            font.pointSize: 8
        }

        TextInput {
            id: experimenterNameEdit
            width: 80
            height: 20
            text: qsTr("Experimenter")
            font.pointSize: 8
            Layout.fillWidth: true
        }

        Label {
            id: chooseVideoLabel
            text: qsTr("Choose the videos:")
            font.pointSize: 8
        }

        Button {
            id: chooseVideoButton
            text: qsTr("Load Videos")
            Layout.preferredHeight: 30
            Layout.fillWidth: false
            font.pointSize: 8

            onClicked: {
                videoFileDialog.open()
            }
        }

        Button {
            id: okButton
            text: qsTr("Create Project")
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.preferredHeight: 30
            Layout.fillHeight: false
            Layout.fillWidth: false

            onClicked: iface.create_new_project(projectNameEdit.text, experimenterNameEdit.text)
        }

        Button {
            id: extractFramesButton
            text: qsTr("Extract Frames")
            Layout.preferredHeight: 30

            onClicked: iface.extract_frames()
        }

        BusyIndicator {
            id: busyIndicator
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
        }
    }
    */


}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}D{i:4;anchors_height:434;anchors_width:640;anchors_x:0;anchors_y:46}
}
##^##*/
