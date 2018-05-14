.SUFFIXES:
.PHONY: all compare clean
.PRECIOUS: %.2bpp %.o %.gb
.SECONDEXPANSION:

includes := python3 scan_includes.py

all: sml2.gb compare
compare: baserom.gb sml2.gb
	cmp $^

%.2bpp: %.png
	rgbgfx -o $@ $<

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -h -L -o $@ $<

sml2.gb: main.o
	rgblink -o $@ -n sml2.sym $^
	sort sml2.sym -o sml2.sym
	rgbfix -jv -l 0x01 -m 0x03 -n 0x00 -r 0x02 -p 0x00 -t MARIOLAND2 $@

clean:
	rm -f sml2.gb *.o $(shell find . -name '*.2bpp')
