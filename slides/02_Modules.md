---
theme: csc-ptc-2019
lang:  en
---

# Modules and scoping {.section}

# Outline

- Procedures
- Fortran modules
- Data scoping

# Modular programming

- By now, we have implemented the whole application in a single
  program block
- Larger applications should be divided into small, minimally
  dependent *modules*
    - Aim is to build complex behavior from simple self-contained
      components
    - Modules can be tested and debugged separately
    - Modules enable easier re-use of code

# Procedures {.section}

# Procedure definitions

- Formally, subroutines and functions are defined and used as:

<div class="column">
**Subroutine**

Definition:

```fortran
subroutine sub(dum_arg1, dum_arg2, ...)
  [declarations]
  [statements]

end subroutine sub
```
Use as:

`call sub(act_arg1, act_arg2,...)`
</div>
<div class="column">
**Function**

Definition:

```fortran
[type] function func(dum_arg1, dum_arg2, ...) &
       &  [result(val)]
  [declarations]
  [statements]
end function func
```

Use as:

`res = func(act_arg1, act_arg2,...)`
</div>

# Two formats for function definitions

- There are two ways to define a function

<div class="column">

**Either**

```fortran
real function real_func(arg1, arg2)
  real :: arg1, arg2
  real_func = arg1 + arg2
end function real_func
```

Function name is valid variable name within the function scope and
it is used to determine the return value of the function.

</div>

<div class="column">

**Or**

```fortran
function real_func(arg1, arg2) result(val)
  real :: arg1, arg2, val
  val = arg1 + arg2
end function real_func
```

Variable to be used as function return value is give with `result`.
Variable has to be declared in the variable declaration section and
the return type is same as variable type.

</div>

# Procedure arguments

- Types of arguments in procedure definition (dummy arguments)
  need to be declared
    - When calling the procedure, the types of actual arguments need
      to match the definition.

- Fortran passes arguments *by reference*
    - Only the memory addresses of the arguments are passed to the
      called procedure
    - Any change to the value of an argument changes the value at the
      calling program
        - Procedures can have *side-effects*
    - The *intent* attribute can be used to specify how argument is
      used
  
# Intent attribute

<div class="column">
```fortran
subroutine foo(x, y, z)
  implicit none
  real, intent(in) :: x
  real, intent(inout) :: y
  real, intent(out) :: z
  x = 10 ! compilation error
  y = 10 ! correct
  z = y * x ! correct
end subroutine foo
```
</div>
<div class="column">
- Declares how formal argument is intended to be used for transferring
  a value
    - **in**: the value of the argument is read-only i.e. cannot be
      changed
    - **out**: the value of the argument must be provided
    - **inout** (the default)
- Compiler uses **intent** for error checking and optimization
- Improves readability of code

# Should I use subroutine or function?

- Main difference is that functions can be used in expressions:

```fortran
r = dist(x1, y1) + dist(x2, y2)
```

- Recommendation as good programming practice:
    - Use functions for computing value based on input
    - Use subroutines for performing operation that changes some of the
      inputs

# Modules {.section}

# Fortran modules

- A Fortran module can contain procedures, variables and data
  structure definitions
- Fortran modules enable
    - Hiding *implementation details*
    - *Grouping* routines and data structures
    - Defining *generic procedures* and custom operators

# Module definition and usage

- Module is defined with the `module` keyword and used from main
  program or other modules with the `use` keyword
- Depending on the complexity of module, one file can contain a single
  or multiple module definitions
    - Only related modules should be grouped into the same file

# A simple module example

<div class="column">
**Module definition**
```fortran
module geometry
  implicit none

  real, parameter :: pi = 3.14
end module geometry
```
</div>
<div class="column">
**Usage**
```{.fortran emphasize=2-2,6:17-6:18}
program testprog
  use geometry
  implicit none

  real :: y
  y = sin(1.2 * pi)
end program testprog
```
```{.fortran emphasize=2-2,5:32-5:33}
module testmod
  use geometry
  implicit none

  real, parameter :: twopi = 2*pi
```
</div>

# Defining procedures in modules (function)

- In most cases, procedures should be defined in modules
- Procedures are defined after `contains` keyword

<div class="column">
**Function** definition in module
```{.fortran emphasize=5:1-5:8,6:8-6:20}
module geometry
  implicit none
  real, parameter :: pi = 3.14

contains
  real function dist(x, y)
    implicit none
    real :: x, y
    dist = sqrt(x**2 + y**2)
  end function dist

end module geometry
```
</div>
<div class="column">
Usage
```{.fortran emphasize=2:3-2:14,6:7-6:10}
program testprog
  use geometry
  implicit none

  real :: d
  d = dist(2.0, 3.4)

end program testprog
```
</div>

# Defining procedures in modules (subroutine)

- In most cases, procedures should be defined in modules
- Procedures are defined after `contains` keyword

<div class="column">
**Subroutine** definition in module
```{.fortran emphasize=5:1-5:8,6:3-6:17}
module geometry
  implicit none
  real, parameter :: pi = 3.14

contains
  subroutine dist(x, y, d)
    implicit none
    real :: x, y, d
    d = sqrt(x**2 + y**2)
  end subroutine dist

end module geometry
```
</div>
<div class="column">
Usage
```{.fortran emphasize=2:3-2:14,6:3-6:11}
program testprog
  use geometry
  implicit none

  real :: d
  call dist(2.0, 3.4, d)

end program testprog
```
</div>


# Scoping{.section}

# Scoping of variables

- Scope is the region of the program where a particular variable is
  defined and can be used
- A variable with the same name can be defined in multiple scopes and
  have different value in them
- In Fortran, variables are normally only available within the program
  unit that defines them

# Local variables in procedures

- Local variables can be declared in the procedure
- Local variables are not visible outside the procedure
- By default, local variables do not retain their values through
  successive calls of the procedure

```fortran
subroutine foo(x, y)
  implicit none
  real, intent(in) :: x
  real, intent(out) :: y
  integer :: i ! Local variable
  ...
```

# Local variables in procedures

- If local variable is given **SAVE** attribute, its value is retained
  through successive calls
- Initialization in declaration is done only in the first call to
  procedure, and implicit SAVE is applied

<div class="column">
```fortran
subroutine no_save(x)
  ...
  integer :: i
  i = 0
  i = i + 1
```
- variable **i** starts always from 0 and gets value 1

</div>

<div class="column">
```fortran
subroutine implicit_save(x)
  ...
  integer :: i = 0
  i = i + 1
```
- variable **i** gets values 1, 2, 3, … in each successive call

</div>


# Variables in modules

- Variables declared in the module definition section are global
    - Can be accessed from any program unit that **use**s the module.
- Modifications in one program unit are seen also elsewhere

<div class="column">
``` fortran
module globals
  integer :: var
end module commons
...
subroutine foo()
  use globals
  var = 47
end subroutine
```
</div>
<div class="column">
``` fortran
...
subroutine bar()
  use globals
  write(*,*) var
end subroutine
...
program myprog
...
  call foo()   ! var is modified
  call bar()   ! The new value is written out
```
</div>

- Generally, use of global variables is not recommended

# Limiting visibility of module objects

- Variables and procedures in *modules* can be **private** or **public**
    - **public** visible for all program units using the module (the
    default)
    - **private** will hide the objects from other program units

``` fortran
module visibility
   real :: x,y
   private :: x
   public :: y ! public declaration is not in principle needed but can improve readability
   real, private :: z ! Visibility can be declared together with type

   private :: foo ! foo can be called only inside this module

 contains

   subroutine foo()
      ...
```

# Protected module variables

- Module variables can also be **protected**
    - Values of protected variables can be accessed is use-associated
      scope, but modifications are prohibited

<div class="column">
```fortran
module protect_demo
   implicit none
   integer, protected :: my_value

 contains

   subroutine modify(val)
     integer :: val
     my_value = val  ! This is ok
   end subroutine modify
end module protect_demo
```
</div>
<div class="column">
```fortran
program demo
  use protect_demo
  implicit none

  call modify(42)
  write(*,*) 'my_value:', my_value
  my_value = 43  ! This fails
  ...
```
</div>


# Building modules {.section}

# Building modules

- Each source file needs to be compiled separately

```console
$ gfortran -c mymod.f90
$ gfortran -c myprog.f90
```
- When compiling the module, a `.mod` is produced for each module
  defined in `mymod.f90`.
- When compiling the main program compiler aborts with error if `.mod`
  is not found for each module **use**d
- In order to produce executable, the object files of module and main
  program need to be linked

```console
$ gfortran -o myexe mymod.o myprog.o
```

# Building modules

- Normally **make** (or similar build system) is utilized when working
  with multiple source files

```console
$ make
gfortran -c mymod.f90
gfortran -c myprog.f90
gfortran -o myexe mymod.o myprog.o
```

- By defining dependencies between program units only those units that
  are affected by changes need to be compiled

```console
$ emacs myprog.f90
$ make
gfortran -c myprog.f90
gfortran -o myexe mymod.o myprog.o
```

# Intrinsic modules{.section}

# Intrinsic modules

- Fortran standard defines several **intrinsic** modules that are part
  of the Fortran language
    - Most commonly used are `iso_fortran_env` and `iso_c_binding`
- To make sure that the standard defined version is loaded, you can
  specify the `intrinsic` on `use` clause:

``` fortran
use, intrinsic :: iso_fortran_env
```

# Precision of built-in numeric types

- Fortran standard does not specify the precision of numeric types
  (`integer`, `real`, `complex`) i.e.  how many bits are used for 
  representing the number
    - Default is often 32 bits (`real` has then 7 significant digits)
- The numerical precision can be controlled through the `kind`
  parameter:
    - `real(kind=dp) :: number`
    - Value of `kind` is integer which determines the precision
    - Before Fortran 2003, the precision was typically defined with
      the help of `selected_int_kind` and `selected_real_kind`
      functions
    - Nowadays one should use the standard precision types defined in
      the intrinsic **iso_fortran_env** module

# Precision of built-in numeric types
  
- The **iso_fortran_env** module contains several standard precision
  types
    - real32, real64, real128, int16, int32, ...
- It is often a good practice to specify precision in a constant
  module variable
    - Precision can be changed with single modification


```fortran
module precision
   use, intrinsic :: iso_fortran_env, only : real64, int16 
   integer, parameter :: rp=real64, ip=int16
end module
...
use precision
real(kind=rp):: double_precision_number
integer(kind=ip) :: short_integer_number
```

# Note on precision of constants

- Unlike in C, Fortran floating point constants are *single precision*
  by default
- When double precision constant is needed, use underline suffix with
  kind, for example:

```fortran
use, intrinsic :: iso_fortran_env, only : real64
real(kind=real64) :: value32, value64
value32 = 0.1
value64 = 0.1_real64 ! you may see 0.1D0 in old codes
write(*,'(G0)') value32
write(*,'(G0)') value64
! Result:
! 0.10000000149011612
! 0.10000000000000001
```

# Compiler version and options

- In order to make results produced by an application more
  reproducible, it can be useful to include in the output information
  on how the application was compiled
- The **iso_fortran_env** module contains two functions for that:
  `compiler_version` and `compiler_options`
  
```fortran
use, intrinsic :: iso_fortran_env
write(*,*) 'Compiler: ', compiler_version()
write(*,*) 'Options: ', compiler_options()
```

```console
$ gfortran -o test test.f90 -O3 -ffast-math
$ ./test
 Compiler: GCC version 4.8.5 20150623 (Red Hat 4.8.5-36)
 Options: -mtune=generic -march=x86-64 -O3 -ffast-math
```

# Other procedure types and interfaces{.section}

# Internal procedures

- Each program unit (program/subroutine/function) may contain internal
  procedures

``` fortran
subroutine mySubroutine
   ...
   call myInternalSubroutine
   ...
 contains
   subroutine myInternalSubroutine
     ...
   end subroutine myInternalSubroutine
end subroutine mySubroutine
```

# Internal procedures

- Declared at the end of a program unit after the **contains**
  statement
    - Nested **contains** statements are not allowed
- Variable scoping:
    - Parent unit’s variables and objects are accessible
    - Parent unit’s variables are overlapped by local variables with
      the same name
- Can be called only from declaring program unit
- Often used for ”small and local, convenience” procedures

# External procedures

- Procedures that are defined in a separate non-module program unit are called
  **external procedures**
    - Old Fortran77 subruotines (e.g. BLAS, LAPACK)
    - Procedures written with different programming languages
- Avoid writing any external procedures in you own code
    - Module procedures provide much better compile time error
      checking

# Interfaces 

- It is possible to define separate **interfaces** to external
  procedures
    - Requirement for interfacing procedures written in C
- Interfaces are defined by an **interface block** that can be added
  to procedure or module variable declaration section of caller
- Interface block consists of one or more procedure declarations with
  dummy argument types
    - No actual executable statements or internal variable
      declarations

# Interface example

<div class="column">
```fortran
! This function is declared outside any modules

function adder(first, second) result(summed)
  real, intent(in) :: first, second
  real :: summed
  
  summed = first + second
  
end function adder
```
</div>
<div class="column">
```fortran
program addertest
  implicit none
  real :: value1, value2, summed
  
  interface
     function adder(val1, val2) result(added)
       real, intent(in) :: val1, val2
       real :: added
     end function adder
  end interface

  value1 = 1.0
  value2 = 2.0
  summed = adder(value1, value2)
  print *, summed

end program addertest
```
</div>

# Summary

- Diving program into modules makes it easier to develop and debug
- Fortran modules can contain procedures, variables and type
  definitions
- Procedures should in most cases be implemented in modules
- By default, Fortran procedures can modify arguments
    - Intent attributes can be used for avoiding unwanted side effects

<!--  LocalWords:  Fortran inout BLAS LAPACK
 -->
