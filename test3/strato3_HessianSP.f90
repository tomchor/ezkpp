! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Sparse Hessian Data Structures File
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
! File                 : strato3_HessianSP.f90
! Time                 : Mon Nov 28 17:45:59 2016
! Working directory    : /home/tomas/ezkpp/test3
! Equation file        : strato3.kpp
! Output root filename : strato3
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE strato3_HessianSP

  PUBLIC
  SAVE


! Hessian Sparse Data
! 

  INTEGER, PARAMETER, DIMENSION(10) :: IHESS_I = (/ &
       1,  2,  2,  3,  3,  3,  4,  4,  5,  5 /)

  INTEGER, PARAMETER, DIMENSION(10) :: IHESS_J = (/ &
       1,  2,  2,  1,  2,  3,  2,  3,  2,  3 /)

  INTEGER, PARAMETER, DIMENSION(10) :: IHESS_K = (/ &
       3,  3,  5,  3,  3,  4,  5,  4,  5,  4 /)


END MODULE strato3_HessianSP

