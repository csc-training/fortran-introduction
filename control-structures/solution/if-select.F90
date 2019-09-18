program condition

  implicit none

  integer :: i

  write(*,*) 'Please give integer: '
  read(*,*) i

  ! Check with if structure
  write(*,*) 'With if-structure:'

  if (i < 0) then
     write(*,*) 'Number is negative'
  else if (i == 0) then
     write(*,*) 'Number is zero'
  else if (i > 100) then
     write(*,*) 'Number is larger than 100'
  else
     write(*,*) 'Number is something different'
  end if

  ! Check with select case
  write(*,*) 'With select case-structure:'

  select case (i)
  case (:-1)
     write(*,*) 'Number is negative'
  case (0)
     write(*,*) 'Number is zero'
  case (100:)
     write(*,*) 'Number is larger than 100'
  case default
     write(*,*) 'Number is something different'
  end select

end program condition
