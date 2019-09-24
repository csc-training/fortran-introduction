program array_syntax
  implicit none

  integer, parameter :: n=8
  real, dimension(n) :: a, dif

  integer :: i

  a = [(i*0.1, i=1, n)]
  dif = 0
  dif(1:n-1) = a(2:) - a(1:n-1)

  write(*,*) 'array:      ', a
  write(*,*) 'difference: ', dif

end program array_syntax
