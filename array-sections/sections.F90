program sections
  implicit none

  integer, parameter :: n = 8
  integer :: a(n,n)
  integer :: i, j

  ! initialize array
  do j=1, n
     do i=1, n
        a(i, j) = i*10 + j
     end do
  end do

  write(*,*) 'Original array'
  do i = 1, n
     write(*,*) a(i, :)
  end do
  write(*,*)


end program sections
