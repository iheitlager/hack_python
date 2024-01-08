from CPU import Segment, WriteOnlyException
# import getch
import sys


# class KeyboardSegment(Segment):
#     def __init__(self, start=0x6000, length=0x1):
#        super(KeyboardSegment, self).__init__(length, start=start)

#     def __getitem__(self, index):
#         if index == self.start:
#             return getch.getch()


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

