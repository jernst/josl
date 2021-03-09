#
# Not a standalone Makefile.
# Included by those directories that have OpenSCAD models to be converted to other formats
#

OPENSCAD_FLAGS=-q --render -m make -d $(shell basename $@.deps)

SCAD_FILES=$(wildcard *.scad)
STL_FILES=$(SCAD_FILES:.scad=.stl)
PNG_FILES=$(patsubst %.scad,%.png,$(SCAD_FILES))

default : all

all : stl png

stl : $(STL_FILES)

png : $(PNG_FILES)

clean :
	touch .safe
	rm .safe $(wildcard *.stl *.png *.deps)

%.stl: %.scad
	openscad $(OPENSCAD_FLAGS) -o $@ $<
	sed -i "s,$(shell pwd)/,,g" $(shell basename $@.deps)

%.png: %.scad
	openscad $(OPENSCAD_FLAGS) -o $@ $<
	sed -i "s,$(shell pwd)/,,g" $(shell basename $@.deps)

# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

.PHONY: default all stl png clean
