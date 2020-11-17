program main
  use math
  implicit none

  real :: x, y, r, phi, a

  write(*,*) 'Give radius: '
  read(*,*) r

  a = circle_area(r)

  write(*,*) 'Area of circle is: ', a

  write(*,*) 'Converting polar coordinates to cartesian'
  write(*,*) 'Give r and phi (in degrees): '
  read(*,*) r, phi

  ! convert phi to radians
  phi = pi * phi / 180.0
  call polar2cart(r, phi, x, y)

  write(*,*) 'x, y: ', x, y

  write(*,*) 'Converting cartesian coordinates to polar'
  write(*,*) 'Give x and y: '
  read(*,*) x, y

  call cart2polar(x, y, r, phi)
  ! convert phi to degrees
  phi = phi * 180.0 / pi

  write(*,*) 'r, phi: ', r, phi

end program main
