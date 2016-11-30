! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Sparse Stoichiometric Data Structures File
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
! File                 : ttropo_StoichiomSP.f90
! Time                 : Wed Nov 30 11:03:15 2016
! Working directory    : /home/tomaschor/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_StoichiomSP

  USE ttropo_Precision
  PUBLIC
  SAVE


! Row-compressed sparse data for the Jacobian of reaction products JVRP

  INTEGER, PARAMETER, DIMENSION(16) :: CROW_JVRP = (/ &
       1,  2,  3,  5,  6,  7,  8,  9, 11, 13, 15, 16, &
      18, 19, 20, 21 /)

  INTEGER, PARAMETER, DIMENSION(20) :: ICOL_JVRP = (/ &
       8, 12, 11, 13, 13, 13,  7,  7,  6,  9, 10, 11, &
       9, 12, 10, 10, 13,  5,  5,  4 /)

  INTEGER, PARAMETER, DIMENSION(20) :: IROW_JVRP = (/ &
       1,  2,  3,  3,  4,  5,  6,  7,  8,  8,  9,  9, &
      10, 10, 11, 12, 12, 13, 14, 15 /)



!  Stoichiometric Matrix in Compressed Column Sparse Format


  INTEGER, PARAMETER, DIMENSION(16) :: CCOL_STOICM = (/ &
       1,  3,  6,  9, 11, 13, 15, 17, 21, 25, 28, 30, &
      33, 35, 37, 39 /)

  INTEGER, PARAMETER, DIMENSION(38) :: IROW_STOICM = (/ &
       8, 13,  8, 11, 12, 11, 12, 13,  8, 13,  7, 13, &
       7,  8,  7,  9,  1,  6,  9, 10,  9, 10, 11, 12, &
       4,  9, 12,  5, 10,  9, 10, 13,  5,  9,  2,  5, &
       3,  4 /)

  INTEGER, PARAMETER, DIMENSION(38) :: ICOL_STOICM = (/ &
       1,  1,  2,  2,  2,  3,  3,  3,  4,  4,  5,  5, &
       6,  6,  7,  7,  8,  8,  8,  8,  9,  9,  9,  9, &
      10, 10, 10, 11, 11, 12, 12, 12, 13, 13, 14, 14, &
      15, 15 /)

  REAL(kind=dp), PARAMETER, DIMENSION(38) :: STOICM = (/ &
       -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp, &
       2.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp, &
       1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  1.000000e+00_dp,  -2.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  -1.000000e+00_dp,  -1.000000e+00_dp,  2.000000e+00_dp,  1.000000e+00_dp, &
       -1.000000e+00_dp,  1.000000e+00_dp,  -1.000000e+00_dp /)


END MODULE ttropo_StoichiomSP

