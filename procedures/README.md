## Modules and procedures

### Simple module

Implement a module called `math` which defines mathematical constats
**pi** (~ 3.1416...) and **e** (base of natural logarithm, exp(1) ~
2.7183).

Utilize the module from a main program and print out the constants.

The program can be build as
```
gfortran -o math_test math.F90 main.F90
```

### Module procedures

1. Add to your `math` module a function that takes as input the radius of
   circle and returns the area of the circle.
   
2. Add to your `math` module a subroutine that converts a polar
   coordinate representation (**r**, **phi**) into cartesian
   representation (**x**, **y**). Implement also a subroutine which
   does the reverse transformation. The formulas are: 

	x = r * cos(phi), y = r * sin(phi), r<sup>2</sup> =
    x<sup>2</sup> + y<sup>2</sup>
