import QtQuick 2.13
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Shapes 1.11
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    color: "#313131"

    TableView {
        id: tableView
        anchors.fill: parent

        columnWidthProvider: function (column) { return 100; }
        rowHeightProvider: function (column) { return 50; }
        topMargin: columnsHeader.implicitHeight

        rowSpacing: 1
        columnSpacing: 1

        ScrollBar.horizontal: ScrollBar {}
        ScrollBar.vertical: ScrollBar {}

        model: table_model

        delegate: Rectangle {
            id: cell
            implicitWidth: 100
            implicitHeight: 50

            color: "#414141"
            Text {
                text: display
                anchors.fill: parent
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            color: "#212121"
            y: tableView.contentY
            x: tableView.contentX
            height: tableView.topMargin
        }

        Row {
            id: columnsHeader
            y: tableView.contentY
            Repeater {
                model: tableView.columns > 0 ? tableView.columns : 1
                Label {
                    width: tableView.columnWidthProvider(modelData)
                    height: tableView.rowHeightProvider(modelData)
                    text: table_model.headerData(modelData, Qt.Horizontal)
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

}
