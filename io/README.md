## File I/O

We implement here a program that reads data from a text file [bottle.dat](bottle.dat) and writes a png-image file. The program consists of a main program and a module (`io`) which contains the actual read and write routines. Your task is to implement the reading of the data, *i.e.* the function `read_field`. 

The text file contains a header line: “# nx ny”, followed by lines representing the rows of the field. Read first the header line, allocate then enough space for the `field` array and finally read the actual data. A skeleton code is provided in
[io.F90](io.F90). Once you have completed the implementation, you can
build the full program (io) with the provided [Makefile](Makefile) by
executing
```
$ make
```
The program can then be executes as
```
$ ./io
```

The .png output file can be investigated with a image viewer program (e.g. eog in Linux). 
