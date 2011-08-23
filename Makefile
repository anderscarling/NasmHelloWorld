NASM         = /usr/local/bin/nasm
LD           = ld

NASM64_FLAGS = -f macho64
NASM_FLAGS   = -f macho
LD_FLAGS     = -macosx_version_min 10.7.0 -lSystem

all: hello_world.bin hello_world64.bin

hello_world.o:
	$(NASM) $(NASM_FLAGS) hello_world.asm
hello_world.bin: hello_world.o
	$(LD) -e main $(LD_FLAGS) hello_world.o -o hello_world.bin

hello_world64.o:
	$(NASM) $(NASM64_FLAGS) hello_world64.asm
hello_world64.bin: hello_world64.o
	$(LD) -e main $(LD_FLAGS) hello_world64.o -o hello_world64.bin

clean:
	rm -f *.o
	rm -f *.bin
