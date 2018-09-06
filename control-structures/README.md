## Control structures

a) Define a two-dimensional (nx-by-ny) array of real numbers with an
additional boundary of one column/row to each direction, i.e., let the array
bounds range from 0 to nx+1 and from 0 to ny+1, respectively. Let nx=ny=16. By
using loops, initialize the array such that elements with indices i+j < 16
have a value of 5.0. Initialize the rest of the array to a value of 1.0
Exercise skeleton is available in 
[do-loop.F90](do-loop.F90).


b) Fibonacci numbers are a sequence of integers defined by the recurrence 
relation 
 F<sub>n</sub> = F<sub>n-1</sub> + F<sub>n-2</sub>
with the initial values F<sub>0</sub>=0, F<sub>1</sub>=1. Print out Fibonacci numbers F<sub>n</sub> < 100 using a `do while` loop.
