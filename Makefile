NASM64       = /usr/local/bin/nasm
LD           = ld

NASM64_FLAGS = -f macho64
LD_FLAGS     = -static

BINARIES     = $(basename $(wildcard *.asm))
BINARIES64   = $(basename $(wildcard *64.asm))

.PHONY: all
all: $(addsuffix .bin, $(BINARIES))

.PHONY: clean
clean:
	rm -f $(addsuffix .bin, $(BINARIES))
	rm -f $(addsuffix .o,   $(BINARIES))

$(addsuffix .o, $(BINARIES64)): %.o: %.asm
	$(NASM64) $(NASM64_FLAGS) $<

$(addsuffix .bin, $(BINARIES)): %.bin:   %.o
	$(LD) $(LD_FLAGS) $< -o $@
