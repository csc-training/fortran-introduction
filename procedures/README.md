## Procedures and modules

a) Write a function to compute the factorial n!=1\*2\*...\*n  of a given
integer number n (we can fix this number, say n=10). A starting point is
provided in [factorial_a.F90](factorial_a.F90)

b) Starting from the previous part, rewrite the function to be an
internal subroutine that takes in an array of integers as an input and compute
the elementwise factorial of the elements as an output

c) Move the subroutine in a separate module, located in a separate file,
and call it from the main program. The compilation line is then
```
gfortran -o factorial factmod.F90 factorial_c.F90
```

