#!/bin/sh

# Requirements:
# nasm 
# $ sudo apt install nasm

# Usage:
# 1. Give this script execute permission:
# 	$ chmod +x compile.sh
# 2. Use it passing the asm filename (without extension) as argument:
# 	$ ./compile.sh my_asm
# 3. It will compile the code into an object file (.o) and link the
#    file using the GNU linker

nasm -f elf64 -o $1.o $1.asm \
&& ld $1.o -o $1

