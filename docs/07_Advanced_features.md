# Advanced features in Fortran{.section}

# Outline

- Language interoperability
- Object oriented programming
- Fortran coarrays

# Language interoperability issues

- The problem of language interoperability has been present for a long
  time
    - Before Fortran 2003 the standard did not specify the calling
      convention in detail
- Interoperability is becoming even more important than before
    - Steering of computation with scripting languages
    - Utilizing libraries that are written using other programming
      languages

# Before Fortran 2003

- Compilers often, but not always
    - Passed all procedure arguments by-reference (i.e. by-address)
    - Referred to functions and subroutines in lowercase letters and
      by adding an additional underscore after, e.g. **`Func`**
      becomes **`func_`** to be found by the linker
    - Passed function return values via stack
    - Passed **`character`** strings by-reference, with an additional
      hidden length argument, passed by value.
    - Note: Fortran **`character`** strings are not null-character
      terminated

# Portability

- The traditional way to have interoperability with C requires *a
  priori* knowledge of lowercase and underscore policy used by the
  compiler
- Complex cases, such as passing **character** strings or passing
  arguments by value, are generally very error prone and may lead to
  catastrophic errors at runtime
- Often a separate layer of C functions was needed for
  interoperability

# The iso_c_binding module

- Fortran 2003 provides intrinsic module **`iso_c_binding`** for
  interoperation with C.
    - Interoperability with other languages (e.g. Python) can be often
      done via C
- Module contains
    - Access to named constants that represent **kind** type
      parameters of data representations compatible with C types
    - The derived types **`c_ptr`** and **`c_funptr`** corresponding
      to C pointer and C function pointer types, respectively
    - Useful procedures: **`c_loc`**, **`c_funloc`**,
      **`c_f_pointer`**, **`c_associated`**, **`c_f_funpointer`**,
      **`c_sizeof`** (f08)

# Interoperability with Fortran 2003: example

``` fortran
function call_c_func(data, nx, ny) result(stat)
  use, intrinsic :: ISO_C_BINDING
  implicit none
  real(dp), dimension(:,:), intent(in) :: data
  integer, intent(in) :: nx, ny
  integer :: stat
  interface
     ! C-definition is: int func(double *data, const int nx, const int ny)
     function c_func(data, nx, ny) bind(C,name="func") result(stat)
       use, intrinsic :: ISO_C_BINDING
       implicit none
       real(kind=C_DOUBLE) :: data(*)
       integer(kind=C_INT), value, intent(IN) :: nx, ny
       integer(kind=C_INT) :: stat
     end function c_func
  end interface
  stat = c_func(data, nx, ny)
end function call_c_func
```

# Calling C routines

- A Fortran *subroutine* maps to a C function with *void* result
- A Fortran *function* maps to a C function returning a value
- Binding label in **`bind(c, name=<label>)`**
    - The routine is known to the C compiler as specified by the
      binding label
    - By default the Fortran name in lower case

# Mapping of C intrinsic data types


- Interoperable mappings for the most commonly used C intrinsic data
  types (note that Fortran does not support unsigned integers)

<center>
  | Fortran declaration | C data type |
  | ---                 | ---         |
  | integer(c_short)    | short int   |
  | integer(c_int)      | int         |
  | integer(c_long)     | long int    |
  | real(c_float)       | float       |
  | real(c_double)      | double      |
  | character(1,c_char) | char        |
</center>

# Value attribute

- For scalar dummy arguments, the **`value`** attribute can be used to
  pass the value to the procedure
     - Actual argument is copied
     - Dummy argument can be altered but result is not visible to
       caller
     - Argument must not be **`pointer`**, **`allocatable`**, have
       **`intent(out)`** or **`intent(inout)`**, be a procedure
- **`value`** attribute is not limited to procedures with **`binc`**
  attribute

# Other interoperability features

- There are routines that can be used to transform C pointers back and
  forth to Fortran
    - Because C does not have as versatile arrays, there are several
      restrictions on the interoperability of Fortran arrays
- Also user-defined datatypes can be mapped between C and Fortran,
  again with some restrictions

# Object oriented programming

- Object Oriented Programming (OOP) is programming paradigm where
    - Data and functionality are wrapped inside of an “object”
    - Objects provide methods which operate on (the data of) the
      object
    - Method is a procedure that is tied to the data of an object
    - Objects can be inherited from other “parent” objects
- Object oriented programming in Fortran is facilitated with type
  extensions and type- and object-bound procedures

# Fortran coarrays

- Parallel processing as part of Fortran language standard
    - Only small changes required to convert existing Fortran code to
      support a robust and potentially efficient parallelism
- A Partitioned Global Address Space (PGAS) paradigm
    - Parallelism implemented over “distributed shared memory”
- Integrated into Fortran 2008 standard
    - Compiler support is still incomplete (Cray: excellent, Intel:
      moderate, GNU: experimental)


# Summary

- Fortran is a modern language that continues to evolve
    - Support for object-oriented programming
    - Complex, generic data structures can be implemented in modern
      Fortran
    - Coarrays provide parallel programming support in the language
      itself
- Fortran remains as one of the major languages for scientific
  computation

<!--  LocalWords:  Fortran interoperability Fortran coarrays priori
 -->
<!--  LocalWords:  runtime iso interoperation OOP PGAS
 -->
