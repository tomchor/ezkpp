! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Auxiliary Routines File
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
! File                 : ttropo_Util.f90
! Time                 : Tue Dec  6 22:11:34 2016
! Working directory    : /home/tomas/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_Util

  USE ttropo_Parameters
  IMPLICIT NONE

CONTAINS



! User INLINED Utility Functions

! End INLINED Utility Functions

! Utility Functions from KPP_HOME/util/util
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! UTIL - Utility functions
!   Arguments :
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

! ****************************************************************
!                            
! InitSaveData - Opens the data file for writing
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE InitSaveData ()

      USE ttropo_Parameters

      open(10, file='ttropo.dat')

      END SUBROUTINE InitSaveData

! End of InitSaveData function
! ****************************************************************

! ****************************************************************
!                            
! SaveData - Write LOOKAT species in the data file 
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE SaveData ()

      USE ttropo_Global
      USE ttropo_Monitor

      INTEGER i

      WRITE(10,999) (TIME-TSTART)/3600.D0,  &
                   (C(LOOKAT(i))/CFACTOR, i=1,NLOOKAT)
999   FORMAT(E24.16,100(1X,E24.16))

      END SUBROUTINE SaveData

! End of SaveData function
! ****************************************************************

! ****************************************************************
!                            
! CloseSaveData - Close the data file 
!   Parameters :                                                  
!
! ****************************************************************

      SUBROUTINE CloseSaveData ()

      USE ttropo_Parameters

      CLOSE(10)

      END SUBROUTINE CloseSaveData

! End of CloseSaveData function
! ****************************************************************

! ****************************************************************
!                            
! GenerateMatlab - Generates MATLAB file to load the data file 
!   Parameters : 
!                It will have a character string to prefix each 
!                species name with.                                                 
!
! ****************************************************************

      SUBROUTINE GenerateMatlab ( PREFIX )

      USE ttropo_Parameters
      USE ttropo_Global
      USE ttropo_Monitor

      
      CHARACTER(LEN=8) PREFIX 
      INTEGER i

      open(20, file='ttropo.m')
      write(20,*) 'load ttropo.dat;'
      write(20,990) PREFIX
990   FORMAT(A1,'c = ttropo;')
      write(20,*) 'clear ttropo;'
      write(20,991) PREFIX, PREFIX
991   FORMAT(A1,'t=',A1,'c(:,1);')
      write(20,992) PREFIX
992   FORMAT(A1,'c(:,1)=[];')

      do i=1,NLOOKAT
        write(20,993) PREFIX, SPC_NAMES(LOOKAT(i)), PREFIX, i
993     FORMAT(A1,A6,' = ',A1,'c(:,',I2,');')
      end do
      
      CLOSE(20)

      END SUBROUTINE GenerateMatlab

! End of GenerateMatlab function
! ****************************************************************


! End Utility Functions from KPP_HOME/util/util
! End of UTIL function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Shuffle_user2kpp - function to copy concentrations from USER to KPP
!   Arguments :
!      V_USER    - Concentration of variable species in USER's order
!      V         - Concentrations of variable species (local)
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Shuffle_user2kpp ( V_USER, V )

! V_USER - Concentration of variable species in USER's order
  REAL(kind=dp) :: V_USER(NVAR)
! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)

  V(8) = V_USER(1)
  V(7) = V_USER(2)
  V(13) = V_USER(3)
  V(11) = V_USER(4)
  V(12) = V_USER(5)
  V(4) = V_USER(6)
  V(5) = V_USER(7)
  V(1) = V_USER(8)
  V(6) = V_USER(9)
  V(9) = V_USER(10)
  V(10) = V_USER(11)
  V(2) = V_USER(12)
  V(3) = V_USER(13)
      
END SUBROUTINE Shuffle_user2kpp

! End of Shuffle_user2kpp function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Shuffle_kpp2user - function to restore concentrations from KPP to USER
!   Arguments :
!      V         - Concentrations of variable species (local)
!      V_USER    - Concentration of variable species in USER's order
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Shuffle_kpp2user ( V, V_USER )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! V_USER - Concentration of variable species in USER's order
  REAL(kind=dp) :: V_USER(NVAR)

  V_USER(1) = V(8)
  V_USER(2) = V(7)
  V_USER(3) = V(13)
  V_USER(4) = V(11)
  V_USER(5) = V(12)
  V_USER(6) = V(4)
  V_USER(7) = V(5)
  V_USER(8) = V(1)
  V_USER(9) = V(6)
  V_USER(10) = V(9)
  V_USER(11) = V(10)
  V_USER(12) = V(2)
  V_USER(13) = V(3)
      
END SUBROUTINE Shuffle_kpp2user

! End of Shuffle_kpp2user function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! GetMass - compute total mass of selected atoms
!   Arguments :
!      CL        - Concentration of all species (local)
!      Mass      - value of mass balance
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE GetMass ( CL, Mass )

! CL - Concentration of all species (local)
  REAL(kind=dp) :: CL(NSPEC)
! Mass - value of mass balance
  REAL(kind=dp) :: Mass(1)

  Mass(1) = CL(4)+CL(11)+CL(12)+CL(14)+CL(14)
      
END SUBROUTINE GetMass

! End of GetMass function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE ttropo_Util

