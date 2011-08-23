NASM64       = /usr/local/bin/nasm
NASM         = /usr/local/bin/nasm
LD           = ld

NASM64_FLAGS = -f macho64
NASM_FLAGS   = -f macho
LD_FLAGS     = -macosx_version_min 10.7.0 -lSystem

BINARIES     = $(basename $(wildcard *.asm))
BINARIES64   = $(basename $(wildcard *64.asm))
BINARIES32   = $(filter-out $(BINARIES64),$(BINARIES))

.PHONY: all
all: $(addsuffix .bin, $(BINARIES))

.PHONY: clean
clean:
	rm -f $(addsuffix .bin, $(BINARIES))
	rm -f $(addsuffix .o,   $(BINARIES))

$(addsuffix .o, $(BINARIES64)): %.o: %.asm
	$(NASM64) $(NASM64_FLAGS) $<

$(addsuffix .o, $(BINARIES32)): %.o: %.asm
	$(NASM) $(NASM_FLAGS) $<

$(addsuffix .bin, $(BINARIES)): %.bin:   %.o
	$(LD) $(LD_FLAGS) $< -o $@
