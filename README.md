Compiler behavior:

(1) PGI compiler: pgi/19.4
 - compile the code with command `pgf90 test1.F90` or similar.
 - All cases can be compiled.
 - `test1.F90` is giving the correct answer: `option 3`
 - `test2.F90` is giving the wrong answer: `option 1`
 - `test3.F90` is giving the correct answer: `option 3`

(2) GCC compiler: gcc/7.3.0-bt47fwr 
 - compile the code with command `gfortran test2.F90` or similar.
 - error compile `test1.F90`
  ```
  test1.F90:11:19:

   if (i1 == 1 .and. j1 .eq. .false.) then
                   1
Error: Logicals at (1) must be compared with .eqv. instead of .eq.
test1.F90:13:24:

   else if (i1 == 2 .and. j1 .eq. .true.) then
                        1
Error: Logicals at (1) must be compared with .eqv. instead of .eq.
  ```
 - `test2.F90` and `test3.F90` can be compiled, `test1.F90` cannot be compiled
 - `test2.F90` is giving the wrong answer: `option 1`
 - `test3.F90` is giving the correct answer: `option 3`



