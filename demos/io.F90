program iodemo
  use, intrinsic :: iso_fortran_env, only : int16
  implicit none
  integer, parameter :: nelem = 10
  integer(kind=int16) :: array(nelem), i

  array = [ (i, i=1,nelem) ]

  open(10, file='sequential.txt', access='sequential', &
       & form='formatted', status='replace')
  write(10, '(*(I3))') array
  close(10)

  open(10, file='sequential.bin', access='sequential', &
       & form='unformatted', status='replace')
  write(10) array
  close(10)

  open(10, file='stream.bin', access='stream', &
       & form='unformatted', status='replace')
  write(10) array
  close(10)

end program iodemo
