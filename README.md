# hack_python
This is a Hack implementation in Python, a full Hack machine language assembler, disassembler and interpreter. At this moment the screen and keyboard are not yet implemented, but all the complete ISA (instruction set architecture is implemented). To get started just create a virtualenv and deploy in dev mode (you can just run `make virutalenv` and `make dev`, see `make help` for more)

To get started, assemble a file first and use:

`python hack-ass.py examples/cnt.asm -v -d`

and more specifically:

`python hack-ass.py examples/cnt.asm -b -o cnt.bin`

to reverse, use the disassembler:

`python hack-dis.py cnt.bin -b -v`

To use the simulator use

`python hack-sim.py --rom cnt.bin -v`

You can set breakpoints `b 0009` and mem watches `m 0010`. Single step through the machine with `s` or have it run till next breakpoint `g`. Use `d` to disassemble code or `i` to watch a ram block. (use `h` for help and `q` for quit. CTRL-C / KeyboardInterrupt is caught to stop the simulator and go back into interactive mode)
