program cmdargs
  implicit none

  character(len=80) :: input_file, arg
  integer :: nsteps, rows, cols

  input_file = 'default_input_file_name'
  nsteps = 0
  rows = 0
  cols = 0

  ! Read in the command line arguments and
  ! set up the needed variables
  select case(command_argument_count())
  case(0) ! No arguments -> default values
     write(*,'(A)') 'No command line arguments!'
     stop
  case(1) ! One argument -> input file name
     call get_command_argument(1, input_file)
  case(2) ! Two arguments -> input file name and number of steps
     call get_command_argument(1, input_file)
     call get_command_argument(2, arg)
     read(arg, *) nsteps
  case(3) ! Three arguments -> rows, cols and nsteps
     call get_command_argument(1, arg)
     read(arg, *) rows
     call get_command_argument(2, arg)
     read(arg, *) cols
     call get_command_argument(3, arg)
     read(arg, *) nsteps
  case default
     write(*,'(A)') 'More than three command line arguments.'
     stop
  end select

  write(*, '(A)') 'Values of variables after command line processing:'
  write(*,'(A,A)') '  input_file: ', input_file
  write(*,'(A,I0)') '  nsteps: ', nsteps
  write(*,'(A,I0)') '  rows:   ', rows
  write(*,'(A,I0)') '  cols:   ', cols

end program cmdargs
