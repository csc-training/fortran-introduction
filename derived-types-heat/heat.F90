module heat
  use iso_fortran_env
  implicit none

  integer, parameter :: dp = real64
  real, parameter :: dx = 0.01, dy=0.01

contains
  subroutine initialize(A)
    implicit none
    real(kind=dp), intent(inout) :: A(:,:)

    real :: x, y
    integer :: i, j, lnx, unx, lny, uny

    lny = lbound(A,2)
    uny = ubound(A,2)
    lnx = lbound(A,1)
    unx = ubound(A,1)

    write(*,*) lnx, unx, lny, uny

    ! initialize array to x^2 + y^2 
    ! origo is in the center of the grid so we shift by (nx/y + 1) / 2
    do j = lny, uny
       y = (j - (uny - lny + 2) / 2.0) * dy
       do i = lnx, uny
          x = (i - (unx - lnx + 2) / 2.0) * dx
          A(i,j) = x**2 + y**2
       end do
    end do

  end subroutine initialize

  subroutine laplacian(L, A)
    implicit none
    real(kind=dp), intent(out) :: L(:,:)
    real(kind=dp), intent(in) :: A(:,:)

    integer :: lnx, unx, lny, uny

    lny = lbound(A,2) + 1
    uny = ubound(A,2) - 1
    lnx = lbound(A,1) + 1
    unx = ubound(A,1) - 1

    ! evaluate the laplacian excluding the boundaries with array syntax
    L(lnx:unx, lny:uny) = &
         (A(lnx-1:unx-1, lny:uny) - 2*A(lnx:unx, lny:uny) + A(lnx+1:unx+1, lny:uny)) / dx**2 + &
         (A(lnx:unx, lny-1:uny-1) - 2*A(lnx:unx, lny:uny) + A(lnx:unx, lny+1:uny+1)) / dy**2

  end subroutine laplacian

end module heat
