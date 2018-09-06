## Loops, arrays, and array syntax

a) Write a double do loop for evaluating the Laplacian using the
finite-difference approximation

![](http://quicklatex.com/cache3/2d/ql_b0e3418f715db7b7865384d6ebd6a42d_l3.png)

As an input, use the array with the same initial values as in item a) in
[control-structures](../control-structures) (or start from the skeleton
[loops_a.F90](loops_a.F90). Evaluate the Laplacian only at the inner 16x16
points, as the outer points are used as boundary condition. As a grid spacing,
use Δx=Δy=0.01.

b) Instead of using a double do-loop, use array syntax to compute the
values of the Laplacian.

