program hello
  integer :: a, b
  real :: r
  complex :: c
  logical :: l
  character(len=80) :: msg

  msg = 'Hello world!'
  write(*,*) msg

  a = 1
  b = 2
  r = a+b
  write(*,*) 'a=', a, 'b=', b, 'a+b=', r, 'sqrt(a+b)', sqrt(r)

  r = 3.6
  a = r
  write(*,*) 'Real to integer conversion:'
  write(*,*) r, '-> ', a

  c = (2.2, 2.3)
  r = c
  write(*,*) 'Complex to real conversion:'
  write(*,*) c, '-> ', r

end program hello
