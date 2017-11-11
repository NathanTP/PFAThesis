BUILD_DIR=build
LATEX_ARGS=--output-directory=${BUILD_DIR}
#TEXMFOUTPUT="${BUILD_DIR}"

all:
	mkdir -p build
	pdflatex ${LATEX_ARGS} main.tex
	TEXMFOUTPUT="${BUILD_DIR}:" bibtex ${BUILD_DIR}/main.aux
	pdflatex ${LATEX_ARGS} main.tex
	pdflatex ${LATEX_ARGS} main.tex
	mv build/main.pdf .

.PHONY: clean
clean:
	rm -rf build

.PHONY: cleanall
cleanall: clean
	rm -f main.pdf
#clean:
# 	rm -f *.aux *.blg *.out *.bbl *.log *.tdo *.toc
# cleanall: clean
# 	rm -f main.pdf
