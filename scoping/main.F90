program counter_test
  use counter
  implicit none

  integer :: count

  ! Initialize the counter to 10
  call counter_init(10)

  ! Increment the counter six times
  do count = 1, 6
     call counter_increment()
  end do

  ! Print counter value
  call counter_print()

  ! Print count variable for comparison
  write (*,'(A,I3)') 'Main program count variable: ', count
  
end program counter_test
