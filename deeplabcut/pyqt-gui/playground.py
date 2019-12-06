from pathlib import Path
import os

path = os.path.normpath('C:/Users/shires/PycharmProjects/DeepLabCut/deeplabcut/pyqt-gui/Project-Experimenter-2019-12-06/labeled-data/reachingvideo1/img000.png')

head_tail = os.path.split(path)
tail = head_tail[1]
print(tail)
head = os.path.split(head_tail[0])[1]

print(os.path.join(head, tail))