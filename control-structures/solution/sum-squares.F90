program sumofsquares
  implicit none
  integer :: sum
  integer :: i

  sum = 0
  do i = 2, 10, 2
     sum = sum + i**2
  end do

  write(*,*) 'Sum is ', sum

end program sumofsquares
