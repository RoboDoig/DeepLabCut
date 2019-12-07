import QtQuick 2.13
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1920
    height: 1080
    color: "#313131"
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
        nameFilters: ["Video Files (*.mp4 *.avi)"]

        onAccepted: {
            iface.load_video(videoFileDialog.fileUrl)
        }
    }

    GridLayout {
        id: mainGridLayout
        rowSpacing: 5
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 40
        anchors.fill: parent
        rows: 3
        columns: 1


        Rectangle {
            id: parameterSetPane
            color: "#414141"
            Layout.rowSpan: 1
            border.color: "#414141"
            Layout.fillHeight: true
            Layout.fillWidth: true

            GridLayout {
                id: parameterSetGridLayout
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.fill: parent
                columnSpacing: 20
                rowSpacing: 5
                rows: 1
                columns: 3

                Rectangle {
                    id: projectCreationPane
                    width: 200
                    height: 200
                    color: "#525252"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    GridLayout {
                        id: projectCreationGridLayout
                        rowSpacing: 20
                        columnSpacing: 20
                        rows: 4
                        columns: 2
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        anchors.top: parent.top
                        anchors.topMargin: 20

                        Label {
                            id: projectNameLabel
                            color: "#fdfdfd"
                            text: qsTr("Name of the project:")
                            font.family: "Verdana"
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignLeft
                        }

                        Rectangle {
                            id: projectNamePane
                            width: 200
                            height: 200
                            color: "#525252"
                            radius: 0
                            Layout.preferredWidth: 300
                            Layout.fillWidth: true
                            border.width: 2
                            Layout.preferredHeight: 30

                            TextInput {
                                id: projectNameEdit
                                color: "#fdfdfd"
                                text: qsTr("Project")
                                transformOrigin: Item.Center
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.top: parent.top
                                anchors.topMargin: 0
                                font.family: "Verdana"
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 12
                                Layout.fillWidth: true
                                verticalAlignment: TextInput.AlignVCenter
                            }
                        }

                        Label {
                            id: experimenterNameLabel
                            color: "#ffffff"
                            text: qsTr("Experiment name:")
                            font.family: "Verdana"
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignLeft
                        }

                        Rectangle {
                            id: experimenterNamePane
                            width: 200
                            height: 200
                            color: "#525252"
                            Layout.fillWidth: true
                            border.width: 2
                            Layout.preferredWidth: 300
                            Layout.preferredHeight: 30

                            TextInput {
                                id: experimenterNameEdit
                                color: "#fdfdfd"
                                text: qsTr("Experimenter")
                                anchors.fill: parent
                                font.family: "Verdana"
                                horizontalAlignment: Text.AlignHCenter
                                font.pointSize: 12
                                Layout.fillWidth: true
                                verticalAlignment: TextInput.AlignVCenter
                            }
                        }


                        Button {
                            id: chooseVideoButton
                            Layout.columnSpan: 2
                            Layout.rowSpan: 1
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            Layout.preferredHeight: 30
                            Layout.fillWidth: true
                            font.pointSize: 12
                            background: Rectangle {
                                color: chooseVideoButton.down ? "#414141" : "#313131"
                            }

                            contentItem: Text {
                                color: "#ffffff"
                                text: "Load Video"
                                anchors.bottomMargin: 5
                                anchors.topMargin: 5
                                anchors.fill: parent
                                font.family: "Verdana"
                                font.pointSize: 12
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: {
                                videoFileDialog.open()
                            }
                        }

                        Button {
                            id: okButton
                            Layout.preferredHeight: 30
                            Layout.fillWidth: true
                            font.pointSize: 12
                            Layout.columnSpan: 2
                            Layout.rowSpan: 1
                            background: Rectangle {
                                color: okButton.down ? "#414141" : "#313131"
                            }

                            contentItem: Text {
                                color: "#ffffff"
                                text: "Create Project"
                                anchors.bottomMargin: 5
                                anchors.topMargin: 5
                                anchors.fill: parent
                                font.family: "Verdana"
                                font.pointSize: 12
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: iface.create_new_project(projectNameEdit.text, experimenterNameEdit.text)
                        }
                    }
                }

                Rectangle {
                    id: extractFramesPane
                    width: 200
                    height: 200
                    color: "#525252"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    GridLayout {
                        id: extractFramesGridLayout
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20
                        anchors.fill: parent

                        Button {
                            id: extractFramesButton
                            Layout.preferredHeight: 30
                            Layout.columnSpan: 2
                            Layout.fillWidth: true
                            font.pointSize: 12

                            background: Rectangle {
                                color: extractFramesButton.down ? "#414141" : "#313131"
                            }

                            contentItem: Text {
                                color: "#ffffff"
                                text: "Extract Frames"
                                anchors.bottomMargin: 5
                                anchors.topMargin: 5
                                anchors.fill: parent
                                font.family: "Verdana"
                                font.pointSize: 12
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: iface.extract_frames()
                        }
                    }
                }

                Rectangle {
                    id: otherParametersPane
                    width: 200
                    height: 200
                    color: "#525252"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
            }
        }
        Rectangle {
            id: viewerPane
            color: "#414141"
            Layout.columnSpan: 1
            Layout.rowSpan: 2
            border.color: "#414141"
            Layout.fillHeight: true
            Layout.fillWidth: true

            GridLayout {
                id: viewerGridLayout
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.fill: parent
                columnSpacing: 20
                rowSpacing: 5
                rows: 1
                columns: 3


                Rectangle {
                    id: infoPane
                    width: 200
                    height: 200
                    color: "#525252"
                    border.color: "#525252"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    GridLayout {
                        id: infoPaneGridLayout
                        columns: 2
                        rows: 2
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20
                        anchors.fill: parent

                        Label {
                            id: label
                            color: "#fdfdfd"
                            text: qsTr("Videos")
                            font.family: "Verdana"
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            Layout.fillWidth: true
                            Layout.fillHeight: false
                            Layout.columnSpan: 2
                        }
                    }
                }

                Rectangle {
                    id: previewPane
                    width: 200
                    height: 200
                    color: "#525252"
                    border.color: "#525252"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    GridLayout {
                        id: previewPaneGridLayout
                        anchors.bottomMargin: 5
                        anchors.topMargin: 5
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5
                        rows: 2
                        columns: 3
                        columnSpacing: 5
                        rowSpacing: 5
                        anchors.fill: parent

                        Label {
                            id: currentImageLabel
                            objectName: "currentImageLabel"
                            color: "#fdfdfd"
                            text: qsTr("Image")
                            font.family: "Verdana"
                            font.pointSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            Layout.columnSpan: 3
                            Layout.fillHeight: false
                            Layout.fillWidth: true
                            Layout.rowSpan: 1
                        }

                        Button {
                            id: previewImageBackButton
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 40
                            Layout.fillHeight: false
                            Layout.fillWidth: false

                            background: Rectangle {
                                color: previewImageBackButton.down ? "#414141" : "#313131"
                            }

                            contentItem: Text {
                                color: "#ffffff"
                                text: "<"
                                font.pointSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                            }

                            onClicked: iface.preview_image_back()
                        }

                        Rectangle {
                            id: previewImageRectangle
                            width: 200
                            height: 200
                            color: "#525252"
                            border.color: "#525252"
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Image {
                                objectName: "previewImage"
                                id: previewImage
                                x: -45
                                y: 0
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                anchors.fill: parent
                                source: "../../gui/media/dlc_1-01-crop.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        Button {
                            id: previewImageForwardButton
                            Layout.preferredHeight: 40
                            Layout.preferredWidth: 40
                            Layout.fillWidth: false
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                            background: Rectangle {
                                color: previewImageForwardButton.down ? "#414141" : "#313131"
                            }

                            contentItem: Text {
                                color: "#ffffff"
                                text: ">"
                                font.pointSize: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                            }

                            onClicked: iface.preview_image_forward()
                        }



                    }

                }

                Rectangle {
                    id: rectangle2
                    width: 200
                    height: 200
                    color: "#525252"
                    border.color: "#525252"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}D{i:4;anchors_height:434;anchors_width:640;anchors_x:0;anchors_y:46}
D{i:12;anchors_height:100;anchors_width:100;anchors_x:205;anchors_y:"-126"}D{i:15;anchors_height:19;anchors_width:272;anchors_x:205;anchors_y:"-126"}
D{i:21;anchors_height:100;anchors_width:100}D{i:20;anchors_height:100;anchors_width:100}
D{i:19;anchors_height:100;anchors_width:100}D{i:9;anchors_height:100;anchors_width:100}
D{i:22;anchors_height:100;anchors_width:100}D{i:33;anchors_height:100;anchors_width:100}
D{i:31;anchors_height:100;anchors_width:100}D{i:30;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:36;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}D{i:39;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:38;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}D{i:37;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:41;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}D{i:40;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:43;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}D{i:42;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:35;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}D{i:34;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
}
##^##*/
