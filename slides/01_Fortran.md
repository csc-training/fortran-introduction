---
lang:   en
theme:  csc-ptc-2019
---

# Fortran Programming for Scientific Computing {.title}

Prace Training Center / CSC, November 2020

# Getting started with Fortran {.section}

# Outline

- Fortran as a language
    - Look and feel
    - From code to program
- Variables and operators
    - Declare, assign
    - Arrays
- Control structures
    - Branches
    - Loops
- Procedures

# Fortran as a language {.section}

# Why learn Fortran?

- Well suited for **numerical computations**
    - Likely over 50% of scientific applications are written in
      Fortran
- **Fast** code (compilers can optimize well)
- Handy **array data types**
- **Clarity** of code
- **Portability** of code
- Optimized **numerical libraries** available

# Short history of Fortran

- John W. Backus et al (1954): The IBM Mathematical **For**mula
  **Tran**slating System
- Early years development: Fortran II (1958), Fortran IV (1961)
  Fortran 66 & Basic Fortran (1966)
- Fortran 77 (1978)
- Fortran 90 (1991) a major revision and Fortran 95 (1997) a minor
  revision to it

# Short history of Fortran

- Fortran 2003 (2004): a major revision, adding e.g. object-oriented
  features, C-bindings
    - ”Fortran 95/2003” is the current *de facto* standard
- Fortran 2008: a minor revision, adding clarifications and
  corrections to 2003
    - Parallel computing using coarrays
- The latest standard is Fortran 2018: a minor revision
    - Fortran coarray improvements
    - C interoperability improvements

# Transition from source code to executable program

<center>
![](img/fortran_compile.svg)
</center>

# Transition from source code to executable program

- Simple programs can be compiled and linked in one go: 
```console
$ gfortran -o hello hello.f90
$ ./hello
Hello from Fortran
```

- More complex cases will be discussed later on
 
# Look and feel

```fortran
program square_root_example
  ! comments start with an exclamation point.
  ! you will find data type declarations, couple arithmetic operations
  ! and an interface that will ask a value for these computations. 
  implicit none
  real :: x, y 
  intrinsic sqrt ! fortran standard provides many commonly used functions 
 
  ! command line interface. ask a number and read it in 
  write (*,*) 'give a value (number) for x:'
  read (*,*) x

  y = x**2+1 ! power function and addition arithmetic 

  write (*,*) 'given value for x:', x 
  write (*,*) 'computed value of x**2 + 1:', y 
  ! print the square root of the argument y to screen 
  write (*,*) 'computed value of sqrt(x**2 + 1):', sqrt(y)
end program square_root_example
```

# Source code remarks

- Free format source code, but
    - A variable name can be no longer than 31 characters containing
      only letters, digits or underscore, and must start with a letter
    - Maximum row length is 132 characters
- No distinction between lower and upper case characters
    - Character strings are case sensitive
- Line break is the statement separator
    - If a line is ended with an ampersand (&), the line continues
      onto the next line (max. 39 continuation lines allowed)
    - Semicolon (;) is the separator between statements on a single
      line

# Variables and operators {.section}

# Variables

- *Variables* must be *declared* at the beginning of the program or
  procedure where they are used
    - They can also be given a value at declaration (not recommended)
- *Constants* are defined with the `PARAMETER` attribute – they cannot
  be altered after their declaration
    - Value *must* be given at declaration
- The *intrinsic* data types in Fortran are `integer`, `real`,
  `complex`, `character` and `logical`

# Variables

<div class=column>
**Numbers** and **logical** 
```fortran
integer :: n
real :: a, b  ! Multiple variables of same type
complex :: imag_number
logical :: test0, test1
real, parameter :: pi = 3.14159

n = 42
a = 2.2
imag_number = (0.1, 1.0)
test0 = .true.
test1 = .false.

! Automatic conversion between numeric types
b = n + a
! floor operation in real to integer conversion
n = b + 3
```
</div>
<div class=column>
**Strings**
```fortran
character :: my_char  ! string with length one
character(len=80) :: my_str
character(len=*), parameter :: name = 'james bond'

! Only first character stored
my_char = 'too long!'

! ' ' and " " are equivalent delimiters
my_str = 'simple string'
! or
my_str = "simple string" 

! including ' and " characters inside a string
my_str = "this isn't so simple"
my_str = 'is this "complex" string?'

```
</div>

# Operators

```fortran
real :: x, y; integer :: i = 10; logical :: a, b
! Arithmetic operators
x = 2.0**(-i)  ! power function and negation precedence: first
x = x*real(i)  ! multiplication and type change precedence: second
x = x / 2.0    ! division precedence: second
i = i + 1      ! addition precedence: third
i = i - 1      ! subtraction precedence: third
! Relational operators
a < b   ! or (f77) a.lt.b -- less than
a <= b  ! or (f77) a.le.b -- less than or equal to
a == b  ! or (f77) a.eq.b -- equal to
a /= b  ! or (f77) a.ne.b -- not equal to
a > b   ! or (f77) a.gt.b -- greater than
a >= b  ! or (f77) a.ge.b -- greater than or equal to
! Logical operators
.not.b ! logical negation precedence: first
a.and.b ! logical conjunction precedence: second
a.or.b  ! logical inclusive disjunction precedence: third
```

# Arrays

```fortran
! Arrays
integer, parameter :: m = 100, n = 500
integer :: idx(m)
real :: vector(-n:n)
real :: matrix(m, n)
character(len=80) :: screen(24)
! or
integer, dimension(m) :: idx
real, dimension(-n:n) :: vector
real, dimension(m, n) :: matrix
character(len=80), dimension(24) :: screen

matrix(3, 4) = idx(3) * 2.0
vector(-3) = 4.2
```
- By default, Fortran indexing starts from 1
    - Programmer can define arbitrary (integer) starting and ending indices

# Control structures {.section}

# Conditionals (if-else)

- Conditionals allow the program to execute different code based on
  some condition(s)
- Condition can be anything from a simple comparison to a complex
  combination using logical operators

```fortran
if (condition) then
  ! do something
else if (condition2) then
  ! .. or maybe alternative something else
else
  ! .. or at least this
end if
```

# Conditionals example

```fortran
program placetest
  implicit none
  logical :: in_square1, in_square2
  real :: x, y
  write(*,*) ’give point coordinates x and y’
  read (*,*) x, y
  in_square1 = (x >= 0. .and. x <= 2. .and. y >= 0. .and. y <= 2.)
  in_square2 = (x >= 1. .and. x <= 3. .and. y >= 1. .and. y <= 3.)
  if (in_square1 .and. in_square2) then ! inside both
    write(*,*) ’point within both squares’
  else if (in_square1) then ! inside square 1 only
    write(*,*) ’point inside square 1’
  else if (in_square2) then ! inside square 2 only
    write(*,*) ’point inside square 2’
  else ! both are .false.
    write(*,*) ’point outside both squares’
  end if
end program placetest
```

# Select case

<div class=column>
- `select case` statement allows a variable to be tested for equality
against a list of values
    - Only one match is allowed
    - Usually arguments are character strings or integers
	- each `case` block can contain multiple statements
    - `default` branch if no match found
</div>
<div class=column>
```fortran
integer :: i; logical :: is_prime, & 
                         test_prime_number
! ...
select case (i)
  case (2,3,5,7)
    is_prime = .true.
  case (1,4,6,8:10)
    is_prime = .false.
  case default
    is_prime = test_prime_number(i)
end select
```
</div>

# Loops

- Three loop formats available in Fortran
    - integer counter (fixed number of iterations)
    - condition controlled (do until condition is false)
    - explicit exit statement

```fortran
do {control clause}
  ! execute something again and again until stopped
end do

! where the control clause (optional) is either of the form
! i = init_value, max_value, increment
! or a condition to execute while true
! while (condition)
```

# Loops example

```fortran
 integer :: i, stepsize, numberofpoints 
 integer, parameter :: max_points = 100000
 real :: x_coodinate(max_points), x, totalsum
 
 ! a do-loop with an integer counter (count controlled)
 stepsize = 2
 do i = 1, max_points, stepsize 
   x_coordinate(i) = i*stepsize*0.05 
 end do
 ! condition controlled loop (do while) totalsum = 0.0
 read(*,*) x
 do while (x > 0) 
   totalsum = totalsum + x 
   read(*,*) x 
 end do
```

# Loops example 2

```fortran
 real :: x, totalsum, eps
 totalsum = 0.0
 
 ! do loop without loop control
 do
   read(*,*) x
   if (x < 0) then
     exit ! = exit the loop
   else if (x > upperlimit) then
     cycle ! = do not execute any further statements, but
           ! instead cycle back to the beginning of the loop
   end if
   totalsum = totalsum + x
 end do
```

# Construct names

<div class=column>
- All the control structures (`if`, `select`, `do`) can be given names
- Construct names can make long or nested `if` and `select` blocks
  more readable
- `cycle` and `exit` can refer to name
    - Possible to e.g. cycle back to outer loop from inner loop
</div>

<div class=column>


```fortran
test: if (m > 0) then
    ...
    ...
end if test
```


```fortran
!...
outer: do i=1, 100
   do j = 1, 100
      ...
      if (condition) cycle outer
   end do
end do outer
```
</div>

# Construct names: example

- Snippet from [FLEUR](http://www.flapw.de/site/) code
<small>
```fortran
...
naloop:DO na2 = na + 1,nat2
            DO i = 1,3
               sum_taual(i) = atoms%taual(i,na) + atoms%taual(i,na2)
            END DO
            DO ix = -2,2
              sum_tau_lat(1) = sum_taual(1) + real(ix)
              DO iy = -2,2
                sum_tau_lat(2) = sum_taual(2) + real(iy)
                DO iz = -2,2
                  sum_tau_lat(3) = sum_taual(3) + real(iz)
                  norm = sqrt(dot_product(matmul(sum_tau_lat,aamat),sum_tau_lat))
                  IF (norm.LT.del) THEN
                     atoms%invsat(na) = 1
                     atoms%invsat(na2) = 2
                     sym%invsatnr(na)  = na2
                     sym%invsatnr(na2) = na
                     WRITE (6,FMT=9000) n,na,na2
                     cycle naloop
                  END IF
               END DO
             END DO
           END DO
END DO naloop
```
</small>

# Procedures {.section}

# Procedures

- Procedure is block of code that can be called from other code.
- Calling code passes data to procedure via arguments
- Fortran has two types of procedures: *subroutines* and *functions*
    - Subroutines pass data back via arguments
    - Functions return a value
- Fortran has both user defined and intrinsic procedures

```fortran
call random_number(x)   ! Subroutine is preceded by "call" statement, 
                        ! input and output is provided via the arguments
z = sin(x)              ! Function returns value(s) based on the input arguments
```

# Summary

- Fortran is – despite its long history – a modern programming
  language designed especially for scientific computing
    - Versatile, quite easy to learn, powerful
- In our first encounter, we discussed
    - Variables, data types, operators
    - Control structures: loops and conditionals
    - Fortran has two types of procedures: subroutines and functions

<!--  LocalWords:  Fortran al mula de facto coarray interoperability
 -->
