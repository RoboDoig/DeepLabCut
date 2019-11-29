from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, QVariant, QTimer, QThread
import deeplabcut

### At the moment, the data model is functionally the config yaml file, may want to port to model class later ###

class Interface(QObject):
    def __init__(self, app, context, parent):
        QObject.__init__(self, parent)
        self.cfg = None
        self.file_list = []

    @pyqtSlot(str)
    def load_video(self, file_url):
        self.file_list.append(file_url)

    @pyqtSlot(str, str)
    def create_new_project(self, experimenter, task):
        self.cfg = deeplabcut.create_new_project(experimenter, task, self.file_list)
