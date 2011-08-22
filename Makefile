NASM=/usr/local/bin/nasm
LD=ld

all: hello_world.bin hello_world64.bin

hello_world.o:
	$(NASM) -f macho hello_world.asm
hello_world.bin: hello_world.o
	$(LD) -e main -macosx_version_min 10.7.0 -lSystem  -o hello_world.bin hello_world.o

hello_world64.o:
	$(NASM) -f macho64 hello_world64.asm
hello_world64.bin: hello_world64.o
	$(LD) -e main -macosx_version_min 10.7.0 -lSystem -o hello_world64.bin hello_world64.o

clean:
	rm -f *.o
	rm -f *.bin
