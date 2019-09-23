module math
  implicit none

  real, parameter :: pi = 3.14159
  real, parameter :: e = exp(1.0)

contains

  function circle_area(r) result(area)
    implicit none
    real :: r, area

    area = pi * r**2

  end function circle_area

  subroutine polar2cart(r, phi, x, y)
    implicit none

    real, intent(in) :: r, phi
    real, intent(out) :: x, y

    x = r * cos(phi)
    y = r * sin(phi)

  end subroutine polar2cart

  subroutine cart2polar(x, y, r, phi)
    implicit none

    real, intent(in) :: x, y
    real, intent(out) :: r, phi

    r = sqrt(x**2 + y**2)
    phi = atan2(y, x)

  end subroutine cart2polar

end module math
