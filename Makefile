.PHONY: examples nikki resume.pdf cv.pdf coverletter.pdf test clean distclean

LATEXMK = latexmk
PYTHON = python3

examples:
	$(LATEXMK)

nikki:
	$(LATEXMK) -outdir=build/nikki nikki/coverletter.tex nikki/cv.tex nikki/resume.tex

resume.pdf cv.pdf coverletter.pdf:
	$(LATEXMK) examples/$(@:.pdf=.tex)

test: examples
	$(LATEXMK) -outdir=build/tests tests/fixtures/*.tex
	$(PYTHON) tests/check_pdfs.py

clean:
	$(LATEXMK) -c

distclean:
	$(LATEXMK) -C
