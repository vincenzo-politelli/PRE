# Makefile for LaTeX documents with biblatex using biber

# Name of the main LaTeX file (without the .tex extension)
TEX = report

# Path to the bibliography file in the parent directory
BIB = ../ref

# Default target: Build the PDF
all: $(TEX).pdf

# Rule to create the .pdf from the .tex file
$(TEX).pdf: $(TEX).tex $(BIB).bib
	pdflatex $(TEX).tex    # First LaTeX pass to generate .aux file
	biber $(TEX)           # Run biber to process the bibliography
	pdflatex $(TEX).tex    # Second LaTeX pass to incorporate bibliography
	pdflatex $(TEX).tex    # Third pass to resolve references

# Clean up auxiliary files (e.g., .aux, .bbl, .log, etc.)
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk

.PHONY: all clean  # Declares that "all" and "clean" are not actual files

