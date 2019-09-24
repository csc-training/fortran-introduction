module heat
  use iso_fortran_env
  implicit none

  integer, parameter :: dp = real64

  type :: field
     integer :: nx
     integer :: ny
     real(dp) :: dx = 1.0_dp
     real(dp) :: dy = 1.0_dp
     real(dp), dimension(:,:), allocatable :: data
  end type field

contains
  subroutine initialize(field0)
    implicit none
    type(field), intent(inout) :: field0

    real(kind=dp) :: x, y
    integer :: i, j, lnx, unx, lny, uny

    lny = lbound(field0%data,2)
    uny = ubound(field0%data,2)
    lnx = lbound(field0%data,1)
    unx = ubound(field0%data,1)

    ! initialize array to x^2 + y^2 
    ! origo is in the center of the grid so we shift by (nx/y + 1) / 2
    do j = lny, uny
       y = (j - (uny + lny) / 2.0) * field0%dy
       do i = lnx, uny
          x = (i - (unx + lny) / 2.0) * field0%dx
          field0%data(i,j) = x**2 + y**2
       end do
    end do

  end subroutine initialize

  subroutine laplacian(lap_field, field0)
    implicit none
    type(field), intent(inout) :: lap_field, field0
    integer :: lnx, unx, lny, uny

    lny = lbound(field0%data,2) + 1
    uny = ubound(field0%data,2) - 1
    lnx = lbound(field0%data,1) + 1
    unx = ubound(field0%data,1) - 1

    ! evaluate the laplacian excluding the boundaries with array syntax
    lap_field%data(lnx:unx, lny:uny) = &
         (field0%data(lnx-1:unx-1, lny:uny) - 2*field0%data(lnx:unx, lny:uny) + & 
         field0%data(lnx+1:unx+1, lny:uny)) / field0%dx**2 + &
         (field0%data(lnx:unx, lny-1:uny-1) - 2*field0%data(lnx:unx, lny:uny) + & 
         field0%data(lnx:unx, lny+1:uny+1)) / field0%dy**2

  end subroutine laplacian

end module heat
