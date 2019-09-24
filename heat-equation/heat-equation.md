## Two dimensional heat equation

Heat (or diffusion) equation is a partial differential equation that describes
the variation of temperature in a given region over time

<!-- Equation
\frac{\partial u}{\partial t} = \alpha \nabla^2 u
--> 
![img](https://latex.codecogs.com/gif.latex?\frac{\partial&space;u}{\partial&space;t}&space;=&space;\alpha&space;\nabla^2&space;u)

where **u(x, y, t)** is the temperature field that varies in space and time,
and α is thermal diffusivity constant. 

We limit ourselvels to two dimensions (plane) where Laplacian can be
discretized in a grid with finite differences as

<!-- Equation
\begin{align*}
\nabla^2 u  &= \frac{u(i-1,j)-2u(i,j)+u(i+1,j)}{(\Delta x)^2} \\
 &+ \frac{u(i,j-1)-2u(i,j)+u(i,j+1)}{(\Delta y)^2}
\end{align*}
--> 
![img](https://latex.codecogs.com/gif.latex?\begin{align*}&space;\nabla^2&space;u&space;&=&space;\frac{u(i-1,j)-2u(i,j)&plus;u(i&plus;1,j)}{(\Delta&space;x)^2}&space;\\&space;&&plus;&space;\frac{u(i,j-1)-2u(i,j)&plus;u(i,j&plus;1)}{(\Delta&space;y)^2}&space;\end{align*})

where ∆x and ∆y are the grid spacing of the temperature grid *u*.

Given an initial condition (u(t=0) = u0) one can follow the time dependence of
the temperature field with explicit time evolution method:

<!-- Equation
u^{m+1}(i,j) = u^m(i,j) + \Delta t \alpha \nabla^2 u^m(i,j) 
--> 
![img](https://latex.codecogs.com/gif.latex?u^{m&plus;1}(i,j)&space;=&space;u^m(i,j)&space;&plus;&space;\Delta&space;t&space;\alpha&space;\nabla^2&space;u^m(i,j))

Note: Algorithm is stable only when

<!-- Equation
\Delta t < \frac{1}{2 \alpha} \frac{(\Delta x \Delta y)^2}{(\Delta x)^2 (\Delta y)^2}
-->
![img](https://latex.codecogs.com/gif.latex?\Delta&space;t&space;<&space;\frac{1}{2&space;\alpha}&space;\frac{(\Delta&space;x&space;\Delta&space;y)^2}{(\Delta&space;x)^2&space;(\Delta&space;y)^2})

There is a solver for the 2D equation implemented with Fortran (including
some C for printing out the images). You can compile the program by adjusting
the Makefile as needed and typing “make”.

The solver carries out the time development of the 2D heat equation over the
number of time steps provided by the user. The default geometry is a flat
rectangle (with grid size provided by the user), but other shapes may be used
via input files - a bottle is give as an example. Examples on how to run the
binary:
 - ./heat  (no arguments - the program will run with the default
arguments: 256x256 grid and 500 time steps)
 - ./heat bottle.dat (one argument - start from a temperature grid
provided in the file bottle.dat for the default number of time steps)
 - ./heat bottle.dat 1000 (two arguments - will run the program starting
from a temperature grid provided in the file bottle.dat for 1000 time steps)
 - ./heat 1024 2048 1000 (three arguments - will run the program in a
1024x2048 grid for 1000 time steps)

The program will produce a .png image of the temperature field after every 100
iterations. You can change that from the parameter image_interval. You can
visualize the images using the command animate:  animate heat_*.png.
