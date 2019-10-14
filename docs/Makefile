LECTURES=01_Fortran.md \
02_Modules.md \
03_Arrays_in_fortran.md \
04_File_IO.md \
05_Fortran_data_types.md \
06_Further_useful_features.md \
07_Advanced_features.md

TITLE=0_Title.pdf

PRESS=fortran-press.pdf
HANDOUT=fortran-handout.pdf

SINGULARITY=singularity run ../../slide-template/slidefactory.simg

HTMLS:=$(patsubst %.md,%.html,$(LECTURES))
PDFS:=$(patsubst %.md,%.pdf,$(LECTURES))

all: $(PDFS)
	./mess_nup -c $(TITLE) -o $(PRESS) -h $(HANDOUT) -- $(PDFS)

%.html:%.md
	$(SINGULARITY) $<

%.pdf:%.html
	./conv2pdf.sh $<

.PHONY: clean

clean:
	-/bin/rm -f $(HTMLS) $(PDFS) $(PRESS) $(HANDOUT) *~
