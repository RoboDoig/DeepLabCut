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
        file = file_url.split('file:///')[1]
        self.file_list.append(file)

    @pyqtSlot(str, str)
    def create_new_project(self, experimenter, task):
        self.cfg = deeplabcut.create_new_project(experimenter, task, self.file_list, copy_videos=True)

    @pyqtSlot()
    def extract_frames(self):
        deeplabcut.extract_frames(self.cfg, mode='automatic', algo='kmeans', userfeedback=False)
        print(self.cfg)
        print('extract frames')
