BUILD_DIR=build
LATEX_ARGS=--output-directory=${BUILD_DIR}
#TEXMFOUTPUT="${BUILD_DIR}"

all:
	mkdir -p build
	pdflatex ${LATEX_ARGS} NPThesis.tex
	TEXMFOUTPUT="${BUILD_DIR}:" bibtex ${BUILD_DIR}/NPThesis.aux
	TEXMFOUTPUT="${BUILD_DIR}:" makeglossaries -d ${BUILD_DIR} NPThesis
	pdflatex ${LATEX_ARGS} NPThesis.tex
	pdflatex ${LATEX_ARGS} NPThesis.tex
	mv build/NPThesis.pdf .

.PHONY: clean
clean:
	rm -rf build

.PHONY: cleanall
cleanall: clean
	rm -f NPThesis.pdf
