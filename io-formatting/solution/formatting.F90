program formatting
  implicit none
  integer :: i, io_stat
  integer, parameter :: int_value = 87
  real, parameter :: real_value = 3.43e-1
  character(len=*), parameter :: string_value = 'My values are'

  open(unit=15, file='my-file.txt', iostat=io_stat)
  write(15,'(A,I3," and ",F5.3)') string_value, int_value, real_value
  close(15)

end program formatting
