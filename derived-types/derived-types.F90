program derived_types
  use coulomb

  implicit none

  ! TODO: instead of variables x1, ... charge2 implement a derived
  ! type for charged particle in module coulomb and utilize that
  real :: x1, y1, z1, x2, y2, z2
  integer :: charge1, charge2
  real :: force

  x1 = 2.2
  y1 = 3.4
  z1 = 4.5
  charge1 = 1
  x2 = -1.9
  y2 = 4.4
  z2 = -3.3
  charge2 = -2

  force = calculate_force(x1, y1, z1, charge1, x2, y2, z2, charge2)

  write(*,*) 'Force: ', force

end program derived_types
