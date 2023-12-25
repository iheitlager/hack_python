from . import Segment, ReadOnlyException
import getch
import sys

from tkinter import *
from tkinter import ttk


class KeyboardSegment(Segment):
    def __getitem__(self, index):
        if index == self.start:
            return getch.getch()


class SimpleDisplaySegment(Segment):
    def __getitem__(self, index):
        if index == self.start:
            return getch.getch()


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