ASM=nasm
SRC=main_32bit.asm 
LST=bin/$(SRC:.asm=.lst)
OBJ=bin/$(SRC:.asm=.o)
EXEC=bin/$(SRC:.asm=)
OPTIONS=-f elf -o $(OBJ) $(SRC) -g -l $(LST)

all: $(EXEC)

$(EXEC): $(OBJ)
	ld -o $(EXEC) $(OBJ)
$(OBJ): $(SRC)
	$(ASM) $(OPTIONS)
clear: 
	rm -rf bin/*
