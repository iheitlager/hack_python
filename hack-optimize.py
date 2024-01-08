from dataclasses import dataclass, field
from typing import Any
import pprint

class block:
    lines: list = field(default_factory=list)
    name: str = None
    previous: Any = None
    next: Any = None
    jump: Any = None


if __name__ == '__main__':
    f = open('out.asm', 'r')

    current = block()
    root = current
    target = ""
    blocks = {}
    for line in f.readlines():
        print(line)
        line = line.split("//")[0]
        if line:
            if line.startswith("("):
                old = current
                current = block(name=line[1:-1])
                if current.name not in blocks:
                    blocks[current.name] = block
                old.next = current
            elif line.startswith('@'):
                target = line[1:]
            elif ';J' in line and target:
                pass
            block.lines += [line]

    pprint.pprint(root)