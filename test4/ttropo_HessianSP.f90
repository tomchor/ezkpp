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
! File                 : ttropo_HessianSP.f90
! Time                 : Tue Nov 29 13:15:32 2016
! Working directory    : /home/tomaschor/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_HessianSP

  PUBLIC
  SAVE


! Hessian Sparse Data
! 

  INTEGER, PARAMETER, DIMENSION(3) :: IHESS_I = (/ &
       6,  7,  8 /)

  INTEGER, PARAMETER, DIMENSION(3) :: IHESS_J = (/ &
       7,  7,  7 /)

  INTEGER, PARAMETER, DIMENSION(3) :: IHESS_K = (/ &
       8,  8,  8 /)


END MODULE ttropo_HessianSP

