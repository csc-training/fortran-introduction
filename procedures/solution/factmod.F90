module factmod
  implicit none

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
  
end module factmod
