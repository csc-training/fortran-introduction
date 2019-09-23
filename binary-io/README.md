# Formatted and unformatted IO

Start from the provided skeleton [writer.F90](writer.F90) and
implement writes for the integer array `values`. Write the same data
using three different formatting and file access combinations:

1. Formatted IO, integer with field width of three, output 
   file `array.txt`
2. Unformatted write, output file `array.bin`
3. Unformatted stream write `array-stream.bin`

Compile the provided C reader using command `gcc -o reader reader.c`
and check how C would interpret the files written by the writer.
