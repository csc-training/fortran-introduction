## Control structures

In this exercise you can practice the various control structures that 
Fortran provides. No skeleton codes are provided, so you should implement 
the whole program yourself.

1. Write an `if` structure which checks whether an integer is negative, 
   zero, or larger than 100 and performs corresponding write. Investigate 
   the behavior with different integer values.

2. Implement the above logic with `select case`. (Tip: check
   [Fortran Wiki](http://fortranwiki.org/fortran/show/case) for specifying
   range of integers in `case`)

3. Fibonacci numbers are a sequence of integers defined by the recurrence 
   relation 
   
   F<sub>n</sub> = F<sub>n-1</sub> + F<sub>n-2</sub>
 
   with the initial values F<sub>0</sub>=0, F<sub>1</sub>=1.

   Write a `do` loop with integer counter that prints out Fibonacci numbers up
   to n=15

4. Print out Fibonacci numbers F<sub>n</sub> < 650 first using `do while` loop 
   and then finally with `do` loop with explicit `exit` statement.
   Which form suits better this particular case?

5. Write a program that determines the sum of squares of even numbers
   up to 10: s = 0<sup>2</sup> + 2<sup>2</sup> + 4<sup>2</sup> + ... + 10<sup>2</sup>
