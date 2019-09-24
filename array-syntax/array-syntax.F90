program array_syntax
  implicit none

  integer, parameter :: n=8
  real, dimension(n) :: a, dif

  integer :: i

  ! TODO: initialize a to 0.1, 0.2, with 'implied do'
  !       and dif to 0


  ! TODO: calculate the difference between two successive elements of a
  !       and store it in dif


  write(*,*) 'array:      ', a
  write(*,*) 'difference: ', dif

end program array_syntax

