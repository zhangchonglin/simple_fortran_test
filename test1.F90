program test
  implicit none

  integer :: i1
  logical :: j1


  i1 = 0
  j1 = .false.

  if (i1 == 1 .and. j1 .eq. .false.) then
    write(*,*)"option 1"
  else if (i1 == 2 .and. j1 .eq. .true.) then
    write(*,*)"option 2"
  else
    write(*,*)"option 3"
  end if

end program test


