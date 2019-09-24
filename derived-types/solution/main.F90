program main
  use heat
  implicit none

  integer, parameter :: nx=10, ny=10

  type(field) :: field0, lap_field

  integer :: i

  ! allocate the data parts
  field0%nx = nx
  field0%ny = ny
  lap_field%nx = nx
  lap_field%ny = ny

  allocate(field0%data(0:nx+1, 0:ny+1))
  allocate(lap_field%data(0:nx+1, 0:ny+1))

  ! call procedures with proper variables
  call initialize(field0)
  call laplacian(lap_field, field0)

  ! print out the data parts of the variables
  write(*,*) "Original data:"
  do i = 1, nx
     write(*,'(*(G9.1))') field0%data(i,1:ny)
  end do

  write(*,*) "Laplacian of the data:"
  do i = 1, nx
     write(*,'(*(G9.1))') lap_field%data(i,1:ny)
  end do

  deallocate(field0%data, lap_field%data)

end program main
