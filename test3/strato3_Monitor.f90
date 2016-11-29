! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Utility Data Module File
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
! File                 : strato3_Monitor.f90
! Time                 : Mon Nov 28 17:45:59 2016
! Working directory    : /home/tomas/ezkpp/test3
! Equation file        : strato3.kpp
! Output root filename : strato3
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE strato3_Monitor


  CHARACTER(LEN=15), PARAMETER, DIMENSION(7) :: SPC_NAMES = (/ &
     'O1D            ','O              ','O3             ', &
     'NO             ','NO2            ','M              ', &
     'O2             ' /)

  INTEGER, PARAMETER, DIMENSION(3) :: LOOKAT = (/ &
       3,  4,  5 /)

  INTEGER, PARAMETER, DIMENSION(6) :: MONITOR = (/ &
       1,  2,  3,  4,  5,  7 /)

  CHARACTER(LEN=15), PARAMETER, DIMENSION(1) :: SMASS = (/ &
     'N              ' /)

  CHARACTER(LEN=100), PARAMETER, DIMENSION(10) :: EQN_NAMES = (/ &
     '      O2 --> 2 O                                                                                    ', &
     '  O + O2 --> O3                                                                                     ', &
     '      O3 --> O + O2                                                                                 ', &
     '  O + O3 --> 2 O2                                                                                   ', &
     '      O3 --> O1D + O2                                                                               ', &
     ' O1D + M --> O + M                                                                                  ', &
     'O1D + O3 --> 2 O2                                                                                   ', &
     ' O3 + NO --> NO2 + O2                                                                               ', &
     ' O + NO2 --> NO + O2                                                                                ', &
     '     NO2 --> O + NO                                                                                 ' /)

! INLINED global variables

! End INLINED global variables


END MODULE strato3_Monitor
