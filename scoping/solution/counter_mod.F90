module counter
  implicit none

  ! Counter value
  integer, private :: count

contains

  ! Initialize to given value
  subroutine counter_init(val)
    implicit none
    integer, intent(in) :: val

    count = val
  end subroutine counter_init

  ! Increment by one
  subroutine counter_increment()
    implicit none

    count = count + 1
  end subroutine counter_increment

  ! Print counter value
  subroutine counter_print()
    implicit none

    write(*, '(A,I4)') 'Counter value: ', count
  end subroutine counter_print

end module counter
