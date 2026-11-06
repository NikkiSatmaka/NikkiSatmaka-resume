.PHONY: nikki resume.pdf cv.pdf coverletter.pdf test clean distclean

LATEXMK = latexmk
PYTHON = python3

nikki:
	$(LATEXMK)

resume.pdf cv.pdf coverletter.pdf:
	$(LATEXMK) examples/$(@:.pdf=.tex)

test: examples
	$(LATEXMK) -outdir=build/tests tests/fixtures/*.tex
	$(PYTHON) tests/check_pdfs.py

clean:
	$(LATEXMK) -c

distclean:
	$(LATEXMK) -C
