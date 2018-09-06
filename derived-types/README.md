## Derived types

a) Define a derived type for a temperature field. Do the definition within a
module (let’s call it heat). The type contains the following elements: 

 - Number of grid points nx (=number of rows) and ny (=number of columns) (integers)
 - The grid spacings dx and dy in the x- and in the y-directions (real numbers)
 - An allocatable two-dimensional, real-valued array containing the data points 
  of the field. 

Define the real-valued variables into double precision, using the 
`ISO_FORTRAN_ENV` intrinsic module. 

b) Let us extend the module started by adding the initialization
of the two-dimensional array (item a) in
[control-structures](../control-structures)) and finite-difference Laplacian (in
[loops-array](../loops-arrays)) into their own functions, which now take the type 
representing the temperature field as an input.



