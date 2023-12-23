from hack_python import CPU, RO, RAM

rom = ROM(
    [
        '0b0000000000010000',
        '0b1110101010000111'
    ]
)
def main():
    ram = RAM.RAM(length=0x3FFF)
    cpu = CPU.CPU(rom=rom, ram=ram)
    cpu.run()

if __name__ == '__main__':
    main()