LECTURES=01_Fortran.md \
02_Modules.md \
03_Arrays_in_fortran.md \
04_File_IO.md \
05_Fortran_data_types.md \
06_Further_useful_features.md \
07_Advanced_features.md

SINGULARITY=singularity run ../../slide-template/slidefactory.simg

HTMLS:=$(patsubst %.md,%.html,$(LECTURES))

all: $(HTMLS)

%.html:%.md
	$(SINGULARITY) $<

.PHONY: clean

clean:
	-/bin/rm -f $(HTMLS) *~
