run-helloworld:
	nasm -f elf64 -o hello.o ./1_helloworld/helloworld.asm
	ld hello.o -o hello
run-conditions:
	nasm -f elf64 -o conditions.o ./2_conditional/conditions.asm
	ld conditions.o -o conditions
run-input:
	nasm -f elf64 -o input.o ./3_input/input.asm
	ld input.o -o input
run-math:
	nasm -f elf64 -o math.o ./4_math/math.asm
	ld math.o -o math
run-subroutine:
	nasm -f elf64 -o subroutine.o ./5_subroutine/subroutine.asm
	ld subroutine.o -o subroutine
run-macros:
	nasm -f elf64 -o macros.o ./6_macros/macros.asm
	ld macros.o -o macros