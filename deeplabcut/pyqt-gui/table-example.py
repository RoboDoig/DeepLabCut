import sys
import os

from PyQt5 import QtCore
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QUrl


class DataModel(QtCore.QAbstractTableModel):
    DtypeRole = QtCore.Qt.UserRole + 1000

    def __init__(self, parent=None):
        super(DataModel, self).__init__(parent)

        self.header_data = ['index', 'value']
        self.data = [[1, 'test1'], [2, 'test2']]

    def rowCount(self, parent=None, *args, **kwargs):
        return len(self.data)

    def columnCount(self, parent=None, *args, **kwargs):
        return len(self.data[0])

    def headerData(self, col, orientation, role=None):
        if orientation == QtCore.Qt.Horizontal and role == QtCore.Qt.DisplayRole:
            return QtCore.QVariant(self.header_data[col])
        if orientation == QtCore.Qt.Vertical and role == QtCore.Qt.DisplayRole:
            return int(col)
        return QtCore.QVariant()

    def data(self, QModelIndex, role=None):
        if not QModelIndex.isValid() or not (0 <= QModelIndex.row() < self.rowCount() and 0 <= QModelIndex.column() < self.columnCount()):
            return QtCore.QVariant()
        entry = self.data[QModelIndex.row()][QModelIndex.column()]

        if role == QtCore.Qt.DisplayRole:
            return str(entry)
        elif role == DataModel.ValueRole:
            return entry
        return QtCore.QVariant()


if __name__ == '__main__':
    # os.environ["QT_DEBUG_PLUGINS"] = "1"
    app = QApplication(sys.argv)

    appEngine = QQmlApplicationEngine()

    context = appEngine.rootContext()

    appEngine.load(QUrl('pyqt-gui/table-example.qml'))

    win = appEngine.rootObjects()[0]

    # Register Python classes with qml
    table_model = DataModel()

    context.setContextProperty('table_model', table_model)

    win.show()
    try:
        apcode = app.exec_()
    except:
        print('there was an issue')
    finally:
        sys.exit(apcode)