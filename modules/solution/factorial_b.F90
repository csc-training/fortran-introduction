program factorial_b
  implicit none
  integer, parameter :: n = 10
  integer :: numbers(n), facts(n)
  
  integer :: i

  numbers(1:n) = [ (i, i=1,n) ]

  call factorial(n, numbers, facts)

  write (*,*) 'Factorials:'
  do i = 1, n
     write (*,'(2I10)') numbers(i), facts(i)
  end do
  
contains 

  subroutine factorial(n, numbers, factorials)
    implicit none
    integer, intent(in) :: n, numbers(n)
    integer, intent(out) :: factorials(n)
    integer :: i, number, prev
    
    do number = 1, n
       prev = 1
       do i = 1, numbers(number)
          factorials(number) = prev * i
          prev = factorials(number)
       end do
    end do
  end subroutine factorial
  
end program factorial_b
