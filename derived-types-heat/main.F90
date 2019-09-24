program main
  use heat
  implicit none

  ! TODO declare two derived type variables (e.g. field0, and lap_field)

  integer :: i

  ! TODO allocate the data parts

  ! TODO call procedures with proper variables
  call initialize(...)
  call laplacian(...)

  ! TODO print out the data parts of the variables
  write(*,*) "Original data:"

  write(*,*) "Laplacian of the data:"

end program main
