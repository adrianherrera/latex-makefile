#
# Simple Makefile for LaTeX projects.
# 
# Copyright (c) 2017 Adrian Herrera
#

### Start user-modifiable section ###

# The name of the main tex file (without the `.tex` extension)
PROJECT = 

# The path to the directory where the final pdf (and all the intermediate
# files) will be written to
OUTPUT_DIR ?= output

# The name of the LaTeX executable to use (e.g. pdflatex, xelatex, etc.)
LATEX ?= xelatex

### End user-modifiable section ###

TEX_FILES = $(shell find . -name '*.tex' -or -name '*.sty' -or -name '*.cls')
BIB_FILES = $(shell find . -name '*.bib')
IMG_FILES = $(shell find . -name '*.png' -or -name '*.jpg' -or -name '*.eps')
TEX_FLAGS = -halt-on-error -output-directory $(OUTPUT_DIR)

.phony: clean

default: $(OUTPUT_DIR)/$(PROJECT).pdf

clean:
	rm -rf $(OUTPUT_DIR)

$(OUTPUT_DIR):
	mkdir -p $@

$(OUTPUT_DIR)/$(PROJECT).pdf: $(OUTPUT_DIR) $(TEX_FILES) $(BIB_FILES) $(IMG_FILES)
	$(LATEX) $(TEX_FLAGS) $(PROJECT)
