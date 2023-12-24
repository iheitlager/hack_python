from . import Segment, ReadOnlyException
import getch

class KeyboardSegment(Segment):
    def __getitem__(self, index):
        if index == self.start:
            return getch.getch()
