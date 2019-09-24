module coulomb

  implicit none

  type particletype
     real :: x, y, z
     integer :: charge
  end type particletype

contains

  function calculate_force(ion1, ion2) result(force)
      implicit none
      type(particletype), intent(in) :: ion1, ion2
      real :: force

      real :: distance

      ! calculate the distance between the particles

      distance = (ion1%x - ion2%x)**2 + (ion1%y - ion2%y)**2 + (ion1%z - ion2%z)**2
      force = ion1%charge * ion2%charge / distance

    end function calculate_force
end module coulomb
