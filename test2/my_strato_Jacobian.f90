! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! The ODE Jacobian of Chemical Model File
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
! File                 : my_strato_Jacobian.f90
! Time                 : Mon Nov 28 17:30:39 2016
! Working directory    : /home/tomas/ezkpp/test2
! Equation file        : my_strato.kpp
! Output root filename : my_strato
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE my_strato_Jacobian

  USE my_strato_Parameters
  USE my_strato_JacobianSP

  IMPLICIT NONE

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Jac_SP - the Jacobian of Variables in sparse matrix representation
!   Arguments :
!      V         - Concentrations of variable species (local)
!      F         - Concentrations of fixed species (local)
!      RCT       - Rate constants (local)
!      JVS       - sparse Jacobian of variables
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Jac_SP ( V, F, RCT, JVS )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! F - Concentrations of fixed species (local)
  REAL(kind=dp) :: F(NFIX)
! RCT - Rate constants (local)
  REAL(kind=dp) :: RCT(NREACT)
! JVS - sparse Jacobian of variables
  REAL(kind=dp) :: JVS(LU_NONZERO)


! Local variables
! B - Temporary array
  REAL(kind=dp) :: B(16)

! B(2) = dA(2)/dV(2)
  B(2) = RCT(2)*F(2)
! B(4) = dA(3)/dV(3)
  B(4) = RCT(3)
! B(5) = dA(4)/dV(2)
  B(5) = RCT(4)*V(3)
! B(6) = dA(4)/dV(3)
  B(6) = RCT(4)*V(2)
! B(7) = dA(5)/dV(3)
  B(7) = RCT(5)
! B(8) = dA(6)/dV(1)
  B(8) = RCT(6)*F(1)
! B(10) = dA(7)/dV(1)
  B(10) = RCT(7)*V(3)
! B(11) = dA(7)/dV(3)
  B(11) = RCT(7)*V(1)
! B(12) = dA(8)/dV(3)
  B(12) = RCT(8)*V(4)
! B(13) = dA(8)/dV(4)
  B(13) = RCT(8)*V(3)
! B(14) = dA(9)/dV(2)
  B(14) = RCT(9)*V(5)
! B(15) = dA(9)/dV(5)
  B(15) = RCT(9)*V(2)
! B(16) = dA(10)/dV(5)
  B(16) = RCT(10)

! Construct the Jacobian terms from B's
! JVS(1) = Jac_FULL(1,1)
  JVS(1) = -B(8)-B(10)
! JVS(2) = Jac_FULL(1,3)
  JVS(2) = B(7)-B(11)
! JVS(3) = Jac_FULL(2,1)
  JVS(3) = B(8)
! JVS(4) = Jac_FULL(2,2)
  JVS(4) = -B(2)-B(5)-B(14)
! JVS(5) = Jac_FULL(2,3)
  JVS(5) = B(4)-B(6)
! JVS(6) = Jac_FULL(2,5)
  JVS(6) = -B(15)+B(16)
! JVS(7) = Jac_FULL(3,1)
  JVS(7) = -B(10)
! JVS(8) = Jac_FULL(3,2)
  JVS(8) = B(2)-B(5)
! JVS(9) = Jac_FULL(3,3)
  JVS(9) = -B(4)-B(6)-B(7)-B(11)-B(12)
! JVS(10) = Jac_FULL(3,4)
  JVS(10) = -B(13)
! JVS(11) = Jac_FULL(3,5)
  JVS(11) = 0
! JVS(12) = Jac_FULL(4,2)
  JVS(12) = B(14)
! JVS(13) = Jac_FULL(4,3)
  JVS(13) = -B(12)
! JVS(14) = Jac_FULL(4,4)
  JVS(14) = -B(13)
! JVS(15) = Jac_FULL(4,5)
  JVS(15) = B(15)+B(16)
! JVS(16) = Jac_FULL(5,2)
  JVS(16) = -B(14)
! JVS(17) = Jac_FULL(5,3)
  JVS(17) = B(12)
! JVS(18) = Jac_FULL(5,4)
  JVS(18) = B(13)
! JVS(19) = Jac_FULL(5,5)
  JVS(19) = -B(15)-B(16)
      
END SUBROUTINE Jac_SP

! End of Jac_SP function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Jac_SP_Vec - function for sparse multiplication: sparse Jacobian times vector
!   Arguments :
!      JVS       - sparse Jacobian of variables
!      UV        - User vector for variables
!      JUV       - Jacobian times user vector
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Jac_SP_Vec ( JVS, UV, JUV )

! JVS - sparse Jacobian of variables
  REAL(kind=dp) :: JVS(LU_NONZERO)
! UV - User vector for variables
  REAL(kind=dp) :: UV(NVAR)
! JUV - Jacobian times user vector
  REAL(kind=dp) :: JUV(NVAR)

  JUV(1) = JVS(1)*UV(1)+JVS(2)*UV(3)
  JUV(2) = JVS(3)*UV(1)+JVS(4)*UV(2)+JVS(5)*UV(3)+JVS(6)*UV(5)
  JUV(3) = JVS(7)*UV(1)+JVS(8)*UV(2)+JVS(9)*UV(3)+JVS(10)*UV(4)
  JUV(4) = JVS(12)*UV(2)+JVS(13)*UV(3)+JVS(14)*UV(4)+JVS(15)*UV(5)
  JUV(5) = JVS(16)*UV(2)+JVS(17)*UV(3)+JVS(18)*UV(4)+JVS(19)*UV(5)
      
END SUBROUTINE Jac_SP_Vec

! End of Jac_SP_Vec function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! JacTR_SP_Vec - sparse multiplication: sparse Jacobian transposed times vector
!   Arguments :
!      JVS       - sparse Jacobian of variables
!      UV        - User vector for variables
!      JTUV      - Jacobian transposed times user vector
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE JacTR_SP_Vec ( JVS, UV, JTUV )

! JVS - sparse Jacobian of variables
  REAL(kind=dp) :: JVS(LU_NONZERO)
! UV - User vector for variables
  REAL(kind=dp) :: UV(NVAR)
! JTUV - Jacobian transposed times user vector
  REAL(kind=dp) :: JTUV(NVAR)

  JTUV(1) = JVS(1)*UV(1)+JVS(3)*UV(2)+JVS(7)*UV(3)
  JTUV(2) = JVS(4)*UV(2)+JVS(8)*UV(3)+JVS(12)*UV(4)+JVS(16)*UV(5)
  JTUV(3) = JVS(2)*UV(1)+JVS(5)*UV(2)+JVS(9)*UV(3)+JVS(13)*UV(4)+JVS(17)*UV(5)
  JTUV(4) = JVS(10)*UV(3)+JVS(14)*UV(4)+JVS(18)*UV(5)
  JTUV(5) = JVS(6)*UV(2)+JVS(15)*UV(4)+JVS(19)*UV(5)
      
END SUBROUTINE JacTR_SP_Vec

! End of JacTR_SP_Vec function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE my_strato_Jacobian

