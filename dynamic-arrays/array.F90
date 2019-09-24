program array
  implicit none
  integer :: nx, ny
  integer :: i, alloc_stat
  ! TODO: define allocatable matrix A

  write (*,*) 'Give x and y dimensions of matrix A:'
  read (*,*) nx, ny

  ! TODO: Allocate A

  ! TODO: Fill A with random numbers

  do i = 1, ny
     write(*,'(*(F5.2))') A(i,:)
  end do

  ! TODO: Fill in the missing parts
  write (*,'(A,(*(F5.2,:,", ")))') &
       & 'Sum of elements across 2nd dimension of A: ',

  write (*,'(A,(*(I0,:,", ")))') &
       & 'Coordinates of maximum element: ',

  write (*,'(A,G0)') 'Absolute minimum value: ',

  write (*,'(A,L)') &
       & 'Are elements of A greater than or equal to 0: ',

  write (*,'(A,I0)') &
       & 'Number of elements greater than or equal to 0.5: ',

end program array
