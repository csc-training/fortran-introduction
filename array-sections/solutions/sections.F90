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

  write(*,*) 'Every element from second row'
  write(*,*) a(2, :)
  write(*,*)

  write(*,*) 'Every element from third column'
  write(*,*) a(:, 3)
  write(*,*)

  a(:2, :2) = 99
  write(*,*) 'Assignment to subarray'
  do i = 1, n
     write(*,*) a(i, :)
  end do
  write(*,*)

  a = 0
  a(::2, ::2) = 1
  a(2::2, 2::2) = 1

  write(*,*) 'Checkerboard'
  do i = 1, n
     write(*,*) a(i, :)
  end do
  write(*,*)

end program sections
