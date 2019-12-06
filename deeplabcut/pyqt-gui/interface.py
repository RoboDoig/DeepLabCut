from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, QVariant, QTimer, QThread, QUrl
import deeplabcut
from deeplabcut.utils import auxiliaryfunctions
from pathlib import Path
import os
# At the moment, the data model is functionally the config yaml file, may want to port to model class later


class Interface(QObject):
    def __init__(self, app, context, parent):
        QObject.__init__(self, parent)
        self.cfg = None
        self.file_list = []
        self.win = parent

        self.imagePreview = self.win.findChild(QObject, "previewImage")
        self.currentImageLabel = self.win.findChild(QObject, "currentImageLabel")

        self.image_paths = list()
        self.current_image = 0

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
        self.get_extracted_frame_list()
        self.display_image_at_index(0)

    def display_image_at_index(self, idx):
        self.imagePreview.setProperty("source", QUrl.fromLocalFile(self.image_paths[idx]))
        image_path = self.image_paths[idx]
        head_tail = os.path.split(image_path)
        image_path = os.path.join(os.path.split(head_tail[0])[1], head_tail[1])
        self.currentImageLabel.setProperty("text", image_path)

    @pyqtSlot()
    def preview_image_forward(self):
        if self.current_image == len(self.image_paths)-1:
            self.current_image = 0
        else:
            self.current_image += 1

        self.display_image_at_index(self.current_image)

    @pyqtSlot()
    def preview_image_back(self):
        if self.current_image == 0:
            self.current_image = len(self.image_paths)-1
        else:
            self.current_image -= 1

        self.display_image_at_index(self.current_image)

    def get_extracted_frame_list(self):
        config = auxiliaryfunctions.read_config(self.cfg)
        video_paths = config['video_sets'].keys()
        image_paths = list()
        for vindex, video in enumerate(video_paths):
            directory = os.path.join(Path(video).parents[1], 'labeled-data', Path(video).stem)
            image_paths += [os.path.join(directory, f) for f in os.listdir(directory)]

        self.image_paths = image_paths
