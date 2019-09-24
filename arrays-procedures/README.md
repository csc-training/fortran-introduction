## Passing arrays to procedures

In this exercise you can practice passing arrays to procedures.

Implement the array initialization and evaluation of Laplacian in
exercise [finite-difference Laplacian](../finite-difference) in module
subroutines. If you did not finish the exercise, you can utilize the 
[model solution](../finite-difference/solution/laplacian.F90).

You can use the full main program in [main.F90](main.F90) and skeleton
code for the module in [heat.F90](heat.F90). 

When passing actual array arguments to procedures, information about
the lower and upper bounds is not passed along, i.e. `arr(-5:5)` is
seen in procedure as `arr(1:11)` if dummy argument is declared as
assumed shape array (`dimension(:)`). One can either include the lower
bound in the declaration (`dimension(-5:)` or implement the procedure
so that it does not depend on the absolute values of lower and upper
bounds, utilizing for example the
[lbound](http://fortranwiki.org/fortran/show/lbound) and
[ubound](http://fortranwiki.org/fortran/show/ubound) intrinsic functions.
