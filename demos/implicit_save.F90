program implicit_save
  implicit none

  integer, parameter :: n = 1000000
  real :: pi

  pi = estimate_pi(n)
  write(*,*) 'First trial: ', pi

  pi = estimate_pi(n)
  write(*,*) 'Second trial: ', pi

  pi = estimate_pi(n)
  write(*,*) 'Third trial: ', pi

contains

  function estimate_pi(n) result(pi)
    implicit none
    integer, intent(in) :: n
    real :: pi

    integer :: i, count = 0
    real, dimension(n) :: x, y

    call random_number(x)
    call random_number(y)

    do i = 1, n
       if (x(i)**2 + y(i)**2 < 1.0) then
          count = count + 1
       end if
    end do

    pi = 4 * real(count) / n

  end function estimate_pi

end program
