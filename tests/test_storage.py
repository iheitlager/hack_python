import pytest
from hack_python import Storage, parse_rom, RamSegment
from hack_python import ReadOnlyException


def test_rom_segment():
    raw = [
        '0000000000010000',
        '1110101010000111'
    ]
    rom = parse_rom(raw, 0x7FFF)
    assert str(rom) == ".RomSegment start=0x0000 length=0x7fff (32k, 2b)"
    assert rom[0:2] == [0x10, 0xEA87]
    assert len(rom) == 0x7FFF
    with pytest.raises(ReadOnlyException) as excinfo:
        rom[0] = 10
    assert str(excinfo.value) == 'Memory segment write disabled'



def test_ram_segment():
    ram = RamSegment(0x3FFF, values=[1,2,3])
    assert ram[0:3] == [0, 0, 0]  # ram memory will be refreshed
    assert len(ram) == 0x3FFF
    assert str(ram) == ".RamSegment start=0x0000 length=0x3fff (16k, 2b)"
    ram[0] = 1
    assert ram[0:3] == [1, 0, 0]


def test_ram_segment2():
    ram = RamSegment(0x3FFF, start=0x7FFF, values=[1,2,3])
    assert ram[0x7FFF:0x8002] == [0, 0, 0]  # ram memory will be refreshed
    assert len(ram) == 0x3FFF
    assert str(ram) == ".RamSegment start=0x7fff length=0x3fff (16k, 2b)"
    ram[0x7FFF] = 1
    assert ram[0x7FFF:0x8002] == [1, 0, 0]
    with pytest.raises(IndexError) as excinfo:
        a = ram[0]
    assert str(excinfo.value) == 'list index out of range'

def test_rom_storage():
    raw = [
        '0000000000010000',
        '1110101010000111'
    ]
    rom_segment = parse_rom(raw, 0x7FFF)
    rom = Storage([rom_segment])
    assert str(rom) == ".RomSegment start=0x0000 length=0x7fff (32k, 2b)"
    assert rom[0:2] == [0x10, 0xEA87]
    with pytest.raises(ReadOnlyException) as excinfo:
        rom[0x8000] = 10
    assert str(excinfo.value) == 'Memory segment write disabled'


def test_ram_storage():
    ram1 = RamSegment(0x3FFF)
    ram2 = RamSegment(0x3FFF, start=0x4000)
    mem = Storage([ram1, ram2])
    assert str(mem) == ".RamSegment start=0x0000 length=0x3fff (16k, 2b)\n.RamSegment start=0x4000 length=0x3fff (16k, 2b)"
    assert len(mem) == 0x3FFF + 0x3FFF
    mem[0] = 1
    mem[0x4000] = 2
    assert mem[0:3] == [1, 0, 0]
    assert mem[0x4000:0x4003] == [2, 0, 0]

