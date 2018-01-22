SHELL := /bin/bash
RESUME_FILENAME = ccraddock_resume_$(shell date "+%m%d%Y").pdf
CV_FILENAME = ccraddock_cv_$(shell date "+%m%d%Y").pdf
RS_FILENAME = ccraddock_rs_$(shell date "+%m%d%Y").pdf
TS_FILENAME = ccraddock_ts_$(shell date "+%m%d%Y").pdf
LATEX_PATH = /Library/TeX/texbin

all: cv rs

craddock_publications.bib:
	curl -S -o craddock_publications.bib https://raw.githubusercontent.com/ccraddock/craddock_publications_bibtex/master/craddock_publications.bib

%.bib: craddock_publications.bib
	./build_bibtex_files.py

cv:	ccraddock_cv.tex ccraddock_journal_pubs.bib ccraddock_invited_talks.bib ccraddock_conf_pubs.bib
	echo "Making $(CV_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_cv
	$(LATEX_PATH)/bibtex ccraddock_cv.1
	$(LATEX_PATH)/bibtex ccraddock_cv.2
	$(LATEX_PATH)/bibtex ccraddock_cv.3
	$(LATEX_PATH)/bibtex ccraddock_cv.4
	$(LATEX_PATH)/lualatex ccraddock_cv
	$(LATEX_PATH)/lualatex ccraddock_cv
	mv ccraddock_cv.pdf $(CV_FILENAME)

resume:	ccraddock_resume.tex ccraddock_journal_pubs.bib ccraddock_invited_talks.bib ccraddock_conf_pubs.bib
	echo "Making $(RESUME_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_resume
	$(LATEX_PATH)/bibtex ccraddock_resume.1
	$(LATEX_PATH)/lualatex ccraddock_resume
	$(LATEX_PATH)/lualatex ccraddock_resume
	mv ccraddock_resume.pdf $(RESUME_FILENAME)

rs: ccraddock_rs.tex
	echo "Making $(RS_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_rs
	${LATEX_PATH}/bibtex ccraddock_rs
	$(LATEX_PATH)/lualatex ccraddock_rs
	$(LATEX_PATH)/lualatex ccraddock_rs
	mv ccraddock_rs.pdf $(RS_FILENAME)

ts: ccraddock_ts.tex
	echo "Making $(TS_FILENAME)"
	$(LATEX_PATH)/lualatex ccraddock_ts
	$(LATEX_PATH)/lualatex ccraddock_ts
	$(LATEX_PATH)/lualatex ccraddock_ts
	mv ccraddock_ts.pdf $(TS_FILENAME)

clean:
	rm -v *.aux *.bbl *.blg *.log
