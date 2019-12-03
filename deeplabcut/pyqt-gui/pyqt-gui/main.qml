import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3
import QtMultimedia 5.10

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
        nameFilters: ["Video Files (*.mp4)"]

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
                    id: videoViewerPane
                    width: 200
                    height: 200
                    color: "#525252"
                    border.color: "#525252"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    PolarChartView {
                        id: line
                        anchors.fill: parent
                        LineSeries {
                            name: "LineSeries"
                            XYPoint {
                                x: 0
                                y: 4.3
                            }

                            XYPoint {
                                x: 2
                                y: 4.7
                            }

                            XYPoint {
                                x: 4
                                y: 5.2
                            }

                            XYPoint {
                                x: 6
                                y: 6.1
                            }

                            XYPoint {
                                x: 8
                                y: 12.9
                            }

                            XYPoint {
                                x: 9
                                y: 19.2
                            }
                            axisAngular: ValueAxis {
                                tickCount: 9
                            }
                            axisRadial: CategoryAxis {
                                max: 20
                                min: 0
                            }
                        }
                    }
                }

                Rectangle {
                    id: vidRectangle
                    width: 200
                    height: 200
                    color: "#525252"
                    border.color: "#525252"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
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
D{i:18;anchors_height:100;anchors_width:100}D{i:17;anchors_height:100;anchors_width:100}
D{i:16;anchors_height:100;anchors_width:100}D{i:9;anchors_height:100;anchors_width:100}
D{i:22;anchors_height:100;anchors_width:100}D{i:31;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
D{i:41;anchors_height:300;anchors_width:300;anchors_x:0;anchors_y:0}
}
##^##*/
