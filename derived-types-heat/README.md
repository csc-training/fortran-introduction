## Derived type for heat equation

Starting from your solution to exercise [Passing arrays to
procedures](../arrays-procedures) or from the provided skeleton code, define
a derived type for a temperature field. Do the definition within module `heat` 
in [heat.F90](heat.F90). The type contains the following elements: 

 - Number of grid points nx (=number of rows) and ny (=number of columns) (integers)
 - The grid spacings dx and dy in the x- and in the y-directions (double
   precision real numbers)
 - An allocatable two-dimensional, (double precision) real-valued array containing the data points 
   of the field. 

Next, modify the `initialize` and `laplacian` procedures so that instead of
arrays they take as input the derived type. In your main program, declare a
variables of type `field`, allocate the data part, and call the `initialize`
and `laplacian` procedures.




