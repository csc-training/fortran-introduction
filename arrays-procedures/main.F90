program arrays_procedures
  use heat
  implicit none

  integer, parameter :: nx = 10, ny = 10
  real(kind=dp), dimension(0:nx+1, 0:ny+1) :: A, L

  integer :: i

  L = 0.0_dp

  call initialize(A)
  call laplacian(L, A)

  ! print out the arrays
  write(*,*) "Original array:"
  do i = 1, nx
     write(*,'(*(G9.1))') A(i,1:ny)
  end do

  write(*,*) "Laplacian of the array:"
  do i = 1, nx
     write(*,'(*(G9.1))') L(i,1:ny)
  end do  

end program arrays_procedures
