from . import Segment, WriteOnlyException
import getch
import sys

from tkinter import *
from tkinter import ttk


class KeyboardSegment(Segment):
    def __init__(self, start=0x6000, length=0x1):
       super(KeyboardSegment, self).__init__(length, start=start)

    def __getitem__(self, index):
        if index == self.start:
            return getch.getch()


class SimpleDisplaySegment(Segment):
    def __init__(self, start=0x4000, length=0x1):
        super(SimpleDisplaySegment, self).__init__(length, start=start)
        
    def __getitem__(self, index):
        raise WriteOnlyException

    def __setitem__(self, key, value):
        if key != self.start:
            raise IndexError('Single address IO device')
        else:
            sys.stdout.write(chr(value))

class HexDisplaySegment(Segment):
    def __init__(self, start=0x4000, length=0x1):
        super(HexDisplaySegment, self).__init__(length, start=start)
        
    def __getitem__(self, index):
        raise WriteOnlyException

    def __setitem__(self, key, value):
        if key != self.start:
            raise IndexError('Single address IO device')
        else:
            sys.stdout.write("0x{value:04X}\n".format(value=value))

class PingSegment(Segment):
    def __init__(self, start=0x5000, length=0x1):
        super(PingSegment, self).__init__(length, start=start)
        
    def __getitem__(self, index):
        raise WriteOnlyException

    def __setitem__(self, key, value):
        if key != self.start:
            raise IndexError('Single address IO device')
        else:
            sys.stdout.write('\a')

def screen():
    root = Tk()

    def stop():
        nonlocal root
        root.destroy()
        sys.exit(0)

    frm = ttk.Frame(root, padding=10)
    frm.grid()
    ttk.Label(frm, text="Hello World!").grid(column=0, row=0)
    ttk.Button(frm, text="Quit", command=stop).grid(column=1, row=0)
    root.mainloop()