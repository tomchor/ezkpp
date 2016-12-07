! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Initialization File
! 
! Generated by KPP-2.2.3 symbolic chemistry Kinetics PreProcessor
!       (http://www.cs.vt.edu/~asandu/Software/KPP)
! KPP is distributed under GPL, the general public licence
!       (http://www.gnu.org/copyleft/gpl.html)
! (C) 1995-1997, V. Damian & A. Sandu, CGRER, Univ. Iowa
! (C) 1997-2005, A. Sandu, Michigan Tech, Virginia Tech
!     With important contributions from:
!        M. Damian, Villanova University, USA
!        R. Sander, Max-Planck Institute for Chemistry, Mainz, Germany
! 
! File                 : ttropo_Initialize.f90
! Time                 : Wed Dec  7 13:43:04 2016
! Working directory    : /home/tomas/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_Initialize

  USE ttropo_Parameters, ONLY: dp, NVAR, NFIX
  IMPLICIT NONE

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Initialize - function to initialize concentrations
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Initialize ( )


  USE ttropo_Global

  INTEGER :: i
  REAL(kind=dp) :: x

  CFACTOR = 1.000000e+00_dp

  x = (0.)*CFACTOR
  DO i = 1, NVAR
    VAR(i) = x
  END DO

  x = (0.)*CFACTOR
  DO i = 1, NFIX
    FIX(i) = x
  END DO

  VAR(2) = (0.)*CFACTOR
  VAR(3) = (0.)*CFACTOR
  VAR(4) = (0.)*CFACTOR
  VAR(5) = (0.)*CFACTOR
  VAR(6) = (2.55E13)*CFACTOR
  VAR(7) = (0.)*CFACTOR
  VAR(8) = (0.)*CFACTOR
  VAR(9) = (0.)*CFACTOR
  VAR(10) = (0.)*CFACTOR
  VAR(11) = (0.0E+09)*CFACTOR
  VAR(12) = (2.55E+10)*CFACTOR
  VAR(13) = (7.65E+11)*CFACTOR
  FIX(1) = (2.550E+19)*CFACTOR
  FIX(2) = (1.697E+19)*CFACTOR
  FIX(3) = (3.0E+17)*CFACTOR
! constant rate coefficients
! END constant rate coefficients

! INLINED initializations

       TSTART = (12*3600)
       TEND = TSTART + (15*24*3600)
       DT = 0.2*3600
       TEMP = 270

! End INLINED initializations

      
END SUBROUTINE Initialize

! End of Initialize function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE ttropo_Initialize

