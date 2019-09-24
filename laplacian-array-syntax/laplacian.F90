program laplacian
  implicit none
  integer, parameter :: nx = 10, ny = 10
  real, parameter :: dx = 0.01, dy=0.01

  ! arrays include also boundary layers at 0 and nx/y + 1
  real, dimension(0:nx+1, 0:ny+1) :: A, L

  real :: x, y
  integer :: i, j

  ! initialize array to x^2 + y^2 
  ! origo is in the center of the grid so we shift by (nx/y + 1) / 2
  do j = 0, ny + 1
     y = (j - (ny + 1) / 2.0) * dy
     do i = 0, nx + 1
        x = (i - (nx + 1) / 2.0) * dx
        A(i,j) = x**2 + y**2
     end do
  end do

  L = 0.0
  ! TODO evaluate the laplacian L in inner grid (1:nx, 1:ny)
  ! without do loop using the array syntax 



  ! print out the arrays
  write(*,*) "Original array:"
  do i = 1, nx
     write(*,'(*(G9.1))') A(i,1:ny)
  end do

  write(*,*) "Laplacian of the array:"
  do i = 1, nx
     write(*,'(*(G9.1))') L(i,1:ny)
  end do

end program laplacian
