from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, QVariant, QTimer, QThread


class Interface(QObject):
    def __init__(self, app, context, parent):
        QObject.__init__(self, parent)