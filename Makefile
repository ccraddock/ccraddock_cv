SHELL := /bin/bash
CV_FILENAME = ccraddock_cv_$(shell date "+%m%d%Y").pdf
RS_FILENAME = ccraddock_rs_$(shell date "+%m%d%Y").pdf
LATEX_PATH = /usr/local/texlive/2012/bin/x86_64-darwin

all: cv rs 
	
cv:	ccraddock_cv.tex ccraddock_journal_pubs.bib ccraddock_invited_talks.bib ccraddock_conf_pubs.bib
	echo "Making $(CV_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_cv
	$(LATEX_PATH)/bibtex ccraddock_cv.1
	$(LATEX_PATH)/bibtex ccraddock_cv.2
	$(LATEX_PATH)/bibtex ccraddock_cv.3
	$(LATEX_PATH)/lualatex ccraddock_cv
	$(LATEX_PATH)/lualatex ccraddock_cv
	mv ccraddock_cv.pdf $(CV_FILENAME)

rs: ccraddock_rs.tex
	echo "Making $(RS_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_rs
	${LATEX_PATH}/bibtex ccraddock_rs
	$(LATEX_PATH)/lualatex ccraddock_rs
	$(LATEX_PATH)/lualatex ccraddock_rs
	mv ccraddock_rs.pdf $(RS_FILENAME)

clean:
	rm -v *.aux *.bbl *.blg *.log

