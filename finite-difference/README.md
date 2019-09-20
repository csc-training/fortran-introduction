## Laplacian

Write a double do loop for evaluating the Laplacian using the
finite-difference approximation

<!-- Equation
\begin{align*}
\nabla^2 u  &= \frac{u(i-1,j)-2u(i,j)+u(i+1,j)}{(\Delta x)^2} \\
 &+ \frac{u(i,j-1)-2u(i,j)+u(i,j+1)}{(\Delta y)^2}
 \end{align*}
 --> 
![img](https://latex.codecogs.com/gif.latex?\begin{align*}&space;\nabla^2&space;u&space;&=&space;\frac{u(i-1,j)-2u(i,j)&plus;u(i&plus;1,j)}{(\Delta&space;x)^2}&space;\\&space;&&plus;&space;\frac{u(i,j-1)-2u(i,j)&plus;u(i,j&plus;1)}{(\Delta&space;y)^2}&space;\end{align*})

Start from the skeleton [laplacian.F90](laplacian.F90) where the input array
is initialized to u(x,y)=x<sup>2</sup>+y<sup>2</sup>.

The analytic solution for that function is
<!-- Equation
\nabla^2 u(x,y)  = 4 
 --> 
![img](https://quicklatex.com/cache3/f2/ql_1133b1a8877ffd0acf814919818995f2_l3.png)
for checking the correctness of your implementation.

