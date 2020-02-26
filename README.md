Compiler behavior:

(1) PGI compiler: pgi/19.4
 - compile the code with command `pgf90 test1.F90` or similar.
 - All cases can be compiled.
 - `test1.F90` is giving the correct answer: `option 3`
 - `test2.F90` is giving the wrong answer: `option 1`
 - `test3.F90` is giving the correct answer: `option 3`
 - The test is run on ORNL Summit login node.

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


(3) Intel compiler: intel/19.0.3.199
 - compile the code with command `ftn test1.F90` or similar on NERSC Cori.
 - All cases can be compiled.
 - `test1.F90` is giving the correct answer: `option 3`
 - `test2.F90` is giving the wrong answer: `option 1`
 - `test3.F90` is giving the correct answer: `option 3`
 - The behavior is the same as PGI compiler. 
 - To run the code on NERSC Cori, need to request job allocation. 

(4) IBM XL compiler: `IBM XL Fortran for Linux, V16.1.0 (5725-C75, 5765-J15) Version: 16.01.0000.0000`
 - compile the code with command `xlf_r test1.F90` or similar.
 - `test1.F90` compile error
```
"test1.F90", line 6.20: 1511-165 (I) When replacing the .EQ. operator with the .EQV. operator, extra parentheses might be required to maintain operator precedence.  The .EQ. operator ha
s higher precedence than the .EQV. operator.
"test1.F90", line 6.20: 1511-025 (S) Logical expressions must only be compared using EQV and NEQV operators.
"test1.F90", line 6.27: 1511-165 (I) When replacing the .EQ. operator with the .EQV. operator, extra parentheses might be required to maintain operator precedence.  The .EQ. operator ha
s higher precedence than the .EQV. operator.
"test1.F90", line 6.27: 1511-025 (S) Logical expressions must only be compared using EQV and NEQV operators.
"test1.F90", line 8.25: 1511-165 (I) When replacing the .EQ. operator with the .EQV. operator, extra parentheses might be required to maintain operator precedence.  The .EQ. operator ha
s higher precedence than the .EQV. operator.
"test1.F90", line 8.25: 1511-025 (S) Logical expressions must only be compared using EQV and NEQV operators.
"test1.F90", line 8.32: 1511-165 (I) When replacing the .EQ. operator with the .EQV. operator, extra parentheses might be required to maintain operator precedence.  The .EQ. operator ha
s higher precedence than the .EQV. operator.
"test1.F90", line 8.32: 1511-025 (S) Logical expressions must only be compared using EQV and NEQV operators.
** test   === End of Compilation 1 ===
1501-511  Compilation failed for file test1.F90.
```
 - `test2.F90` and `test3.F90` can be compiled
 - `test2.F90` is giving the wrong answer: `option 1`
 - `test3.F90` is giving the correct answer: `option 3`
