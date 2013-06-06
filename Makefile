SHELL := /bin/bash
CV_FILENAME = ccraddock_cv_$(shell date "+%m%d%Y").pdf

all: ccraddock_cv.tex ccraddock_journal_pubs.bib ccraddock_invited_talks.bib ccraddock_conf_pubs.bib
	echo "Making $(CV_FILENAME)"
	lualatex ccraddock_cv
	bibtex ccraddock_cv.1
	bibtex ccraddock_cv.2
	bibtex ccraddock_cv.3
	lualatex ccraddock_cv
	lualatex ccraddock_cv
	mv ccraddock_cv.pdf $(CV_FILENAME)

clean:
	rm -v *.aux *.bbl *.blg *.log

