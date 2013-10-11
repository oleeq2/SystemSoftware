ASM=nasm
SRC=main.asm proc.asm
LST=bin/$(SRC:.asm=.lst)
EXEC=bin/main
OPTIONS=-f elf -g -l

all: $(EXEC)

$(EXEC): bin/proc.o bin/main.o
	gcc -m32 -g -o $(EXEC) bin/main.o bin/proc.o
bin/main.o:
	$(ASM) $(OPTIONS) bin/main.lst -o bin/main.o main.asm
bin/proc.o:
	$(ASM) $(OPTIONS) bin/proc.lst -o bin/proc.o proc.asm
clear: 
	rm -rf bin/*
debug: $(EXEC) 
	gdb $(EXEC) 
