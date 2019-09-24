program derived_types
  use coulomb

  implicit none

  type(particletype) :: ion1, ion2
  real :: force

  ion1 = particletype(2.2, 3.4, 4.5, 1)
  ion2 = particletype(-1.9, 4.4, -3.3, -2)

  force = calculate_force(ion1, ion2)

  write(*,*) 'Force: ', force

end program derived_types
