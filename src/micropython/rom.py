ROM = [
# Program:
# #+++[>+++++<-]>@
# #----[---->+<]>++    # a = "A"   (idea reserve 0 and 1 for 0 and 1 >+>)
# ++++++++[>++++++++<-]>+ # a = "A"
# >+++++[>+++++<-]>+      # b = 26
# [<<.+>>-]               # repeat print a; a++ ; b-- until b==0
# >++++++++++. # print newline (use 5 for that
# Preamble
	0x2000, 0xEC10, 0x0005, 0xE308, 0x00FF, 0xEC10, 0x0005, 0xFC20, 
	0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 
	0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 
	0x0005, 0xFC20, 0xFC10, 0x003D, 0xE302, 0x0005, 0xFDC8, 0x00FF, 
	0xEC10, 0x0005, 0xFC20, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0x0005, 0xFC88, 0x00FF, 0xEC10, 0x0005, 
	0xFC20, 0xFC88, 0xF008, 0x0018, 0xEA87, 0x0005, 0xFDC8, 0x00FF, 
	0xEC10, 0x0005, 0xFC20, 0xFDC8, 0xF008, 0x0005, 0xFDC8, 0x00FF, 
	0xEC10, 0x0005, 0xFC20, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0x0005, 0xFC20, 0xFC10, 
	0x0074, 0xE302, 0x0005, 0xFDC8, 0x00FF, 0xEC10, 0x0005, 0xFC20, 
	0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 
	0xFDC8, 0xF008, 0x0005, 0xFC88, 0x00FF, 0xEC10, 0x0005, 0xFC20, 
	0xFC88, 0xF008, 0x0055, 0xEA87, 0x0005, 0xFDC8, 0x00FF, 0xEC10, 
	0x0005, 0xFC20, 0xFDC8, 0xF008, 0x0005, 0xFC20, 0xFC10, 0x0099, 
	0xE302, 0x0005, 0xFC88, 0xFC88, 0xFC20, 0xFC10, 0x4000, 0xE308, 
	0x00FF, 0xEC10, 0x0005, 0xFC20, 0xFDC8, 0xF008, 0x0005, 0xFDC8, 
	0xFDC8, 0x00FF, 0xEC10, 0x0005, 0xFC20, 0xFC88, 0xF008, 0x007C, 
	0xEA87, 0x0005, 0xFDC8, 0x00FF, 0xEC10, 0x0005, 0xFC20, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 0xF008, 0xFDC8, 
	0xF008, 0xFDC8, 0xF008, 0xFC10, 0x4000, 0xE308, 0x00B6, 0xEA87, 

]
