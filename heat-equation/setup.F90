! Setup routines for heat equation solver
module setup

contains

  subroutine initialize(previous, current, nsteps)

    use heat
    use utilities
    use io

    implicit none

    type(field), intent(out) :: previous, current
    integer, intent(out) :: nsteps

    integer :: rows, cols
    logical :: using_input_file
    character(len=85) :: input_file, arg  ! Input file name and command line arguments


    ! Default values for grid size and time steps
    rows = 200
    cols = 200
    nsteps = 500
    using_input_file = .false.

    ! Read in the command line arguments and
    ! set up the needed variables
    select case(command_argument_count())
    case(0) ! No arguments -> default values
    case(1) ! One argument -> input file name
       using_input_file = .true.
       call get_command_argument(1, input_file)
    case(2) ! Two arguments -> input file name and number of steps
       using_input_file = .true.
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
       call usage()
       stop
    end select

    ! Initialize the fields according the command line arguments
    if (using_input_file) then
       call read_field(previous, input_file)
       call copy_fields(previous, current)
    else
       call set_field_dimensions(previous, rows, cols)
       call set_field_dimensions(current, rows, cols)
       call generate_field(previous)
       call generate_field(current)
    end if

  end subroutine initialize

  ! Generate initial the temperature field.  Pattern is x**2 + y**2
  ! with the origo in the center of the grid.

  subroutine generate_field(field0)
    use heat

    implicit none

    type(field), intent(inout) :: field0

    real(dp) :: x, y
    integer :: i, j 

    ! The arrays for field contain also a halo region
    allocate(field0%data(0:field0%nx+1, 0:field0%ny+1))

    do j = 0, field0%ny + 1
       y = (j - (field0%ny + 1) / 2.0) * field0%dy
       do i = 0, field0%nx + 1
          x = (i - (field0%nx + 1) / 2.0) * field0%dx
          field0%data(i,j) = 100 - (x**2 + y**2)*50
       end do
    end do

  end subroutine generate_field


  ! Clean up routine for field type
  ! Arguments:
  !   field0 (type(field)): field variable to be cleared
  subroutine finalize(field0, field1)
    use heat

    implicit none

    type(field), intent(inout) :: field0, field1

    deallocate(field0%data)
    deallocate(field1%data)

  end subroutine finalize

  ! Helper routine that prints out a simple usage if
  ! user gives more than three arguments
  subroutine usage()
    implicit none
    character(len=256) :: buf

    call get_command_argument(0, buf)
    write (*,'(A)') 'Usage:'
    write (*,'(A, " (default values will be used)")') trim(buf)
    write (*,'(A, " <filename>")') trim(buf)
    write (*,'(A, " <filename> <nsteps>")') trim(buf)
    write (*,'(A, " <rows> <cols> <nsteps>")') trim(buf)
  end subroutine usage

end module setup
