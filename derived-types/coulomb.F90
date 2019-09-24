module coulomb

  implicit none

contains

  function calculate_force(x1, y1, z1, charge1, x2, y2, z2, charge2) result(force)
      implicit none
      real, intent(in) :: x1, y1, z1, x2, y2, z2
      integer, intent(in) :: charge1, charge2
      real :: force

      real :: distance

      ! calculate the distance between the particles

      distance = (x1 - x2)**2 + (y1 - y2)**2 + (z1 - z2)**2
      force = charge1 * charge2 / distance

    end function calculate_force
end module coulomb
