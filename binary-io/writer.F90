program formatdemo
  implicit none
  integer :: i, io_stat, alloc_stat
  integer, parameter :: n = 10
  integer :: values(n)
  
  values = [ (i, i = 1, n) ]

  open(unit=11, file='array.txt', iostat=io_stat)
  if (io_stat /= 0) call abort()
  ! TODO: add here a formatted write with sensible integer format
  close(11)

  ! TODO: open file in unformatted form
  open(unit=11, file='array.bin', iostat=io_stat, ...)
  if (io_stat /= 0) call abort()
  ! TODO: add correct write without formatting
  close(11)

  ! TODO: open file with unformatted stream access
  open(unit=11, file='array-stream.bin', iostat=io_stat, ...)
  if (io_stat /= 0) call abort()
  ! TOOD: add correct write call
  close(11)
  
end program formatdemo
