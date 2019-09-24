## Simple array syntax

In this exercise you can practice operating with arrays without using
`do` loops.

Start with the skeleton code [array-syntax.F90](array-syntax.F90) and
initialize the provided array `a` to 0.1, 0.2, 0.3, ... and the array 
`dif` to 0.0. Do **not** use `do` loops ("implied do" is ok).

Next, calculate the difference between two successive elements of `a`
```
dif(i) = a(i+1) - a(i)
```
using array syntax, *i.e.* without a `do` loop.
