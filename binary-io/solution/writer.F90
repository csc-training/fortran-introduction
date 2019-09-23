program formatdemo
  implicit none
  integer :: i, io_stat, alloc_stat
  integer, parameter :: n = 10
  integer :: values(n)
  
  values = [ (i, i = 1, n) ]

  open(unit=11, file='array.txt', iostat=io_stat)
  if (io_stat /= 0) call abort()
  close(11)

  open(unit=11, file='array.bin', form='unformatted', iostat=io_stat)
  if (io_stat /= 0) call abort()
  write(11) values
  close(11)

  open(unit=11, file='array-stream.bin', form='unformatted', &
       & access='stream', iostat=io_stat)
  if (io_stat /= 0) call abort()
  write(11) values
  close(11)
  
end program formatdemo
