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
! File                 : ttropo_Jacobian.f90
! Time                 : Tue Nov 29 15:38:54 2016
! Working directory    : /home/tomaschor/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_Jacobian

  USE ttropo_Parameters
  USE ttropo_JacobianSP

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
  REAL(kind=dp) :: B(23)

! B(1) = dA(1)/dV(8)
  B(1) = RCT(1)*F(2)
! B(3) = dA(2)/dV(12)
  B(3) = RCT(2)
! B(4) = dA(3)/dV(11)
  B(4) = RCT(3)*V(13)
! B(5) = dA(3)/dV(13)
  B(5) = RCT(3)*V(11)
! B(6) = dA(4)/dV(13)
  B(6) = RCT(4)
! B(7) = dA(5)/dV(13)
  B(7) = RCT(5)
! B(8) = dA(6)/dV(7)
  B(8) = RCT(6)*F(1)
! B(10) = dA(7)/dV(7)
  B(10) = RCT(7)*F(3)
! B(12) = dA(8)/dV(6)
  B(12) = RCT(8)*V(9)
! B(13) = dA(8)/dV(9)
  B(13) = RCT(8)*V(6)
! B(14) = dA(9)/dV(10)
  B(14) = RCT(9)*V(11)
! B(15) = dA(9)/dV(11)
  B(15) = RCT(9)*V(10)
! B(16) = dA(10)/dV(9)
  B(16) = RCT(10)*V(12)
! B(17) = dA(10)/dV(12)
  B(17) = RCT(10)*V(9)
! B(18) = dA(11)/dV(10)
  B(18) = RCT(11)*2*V(10)
! B(19) = dA(12)/dV(10)
  B(19) = RCT(12)*V(13)
! B(20) = dA(12)/dV(13)
  B(20) = RCT(12)*V(10)
! B(21) = dA(13)/dV(5)
  B(21) = RCT(13)
! B(22) = dA(14)/dV(5)
  B(22) = RCT(14)
! B(23) = dA(15)/dV(4)
  B(23) = RCT(15)

! Construct the Jacobian terms from B's
! JVS(1) = Jac_FULL(1,1)
  JVS(1) = 0
! JVS(2) = Jac_FULL(1,6)
  JVS(2) = B(12)
! JVS(3) = Jac_FULL(1,9)
  JVS(3) = B(13)
! JVS(4) = Jac_FULL(2,2)
  JVS(4) = 0
! JVS(5) = Jac_FULL(2,5)
  JVS(5) = B(22)
! JVS(6) = Jac_FULL(3,3)
  JVS(6) = 0
! JVS(7) = Jac_FULL(3,4)
  JVS(7) = B(23)
! JVS(8) = Jac_FULL(4,4)
  JVS(8) = -B(23)
! JVS(9) = Jac_FULL(4,9)
  JVS(9) = B(16)
! JVS(10) = Jac_FULL(4,12)
  JVS(10) = B(17)
! JVS(11) = Jac_FULL(5,5)
  JVS(11) = -B(21)-B(22)
! JVS(12) = Jac_FULL(5,10)
  JVS(12) = B(18)
! JVS(13) = Jac_FULL(6,6)
  JVS(13) = -B(12)
! JVS(14) = Jac_FULL(6,9)
  JVS(14) = -B(13)
! JVS(15) = Jac_FULL(7,7)
  JVS(15) = -B(8)-B(10)
! JVS(16) = Jac_FULL(7,13)
  JVS(16) = B(7)
! JVS(17) = Jac_FULL(8,7)
  JVS(17) = B(8)
! JVS(18) = Jac_FULL(8,8)
  JVS(18) = -B(1)
! JVS(19) = Jac_FULL(8,12)
  JVS(19) = B(3)
! JVS(20) = Jac_FULL(8,13)
  JVS(20) = B(6)
! JVS(21) = Jac_FULL(9,5)
  JVS(21) = 2*B(21)
! JVS(22) = Jac_FULL(9,6)
  JVS(22) = -B(12)
! JVS(23) = Jac_FULL(9,7)
  JVS(23) = 2*B(10)
! JVS(24) = Jac_FULL(9,9)
  JVS(24) = -B(13)-B(16)
! JVS(25) = Jac_FULL(9,10)
  JVS(25) = B(14)+B(19)
! JVS(26) = Jac_FULL(9,11)
  JVS(26) = B(15)
! JVS(27) = Jac_FULL(9,12)
  JVS(27) = -B(17)
! JVS(28) = Jac_FULL(9,13)
  JVS(28) = B(20)
! JVS(29) = Jac_FULL(10,6)
  JVS(29) = B(12)
! JVS(30) = Jac_FULL(10,9)
  JVS(30) = B(13)
! JVS(31) = Jac_FULL(10,10)
  JVS(31) = -B(14)-2*B(18)-B(19)
! JVS(32) = Jac_FULL(10,11)
  JVS(32) = -B(15)
! JVS(33) = Jac_FULL(10,12)
  JVS(33) = 0
! JVS(34) = Jac_FULL(10,13)
  JVS(34) = -B(20)
! JVS(35) = Jac_FULL(11,10)
  JVS(35) = -B(14)
! JVS(36) = Jac_FULL(11,11)
  JVS(36) = -B(4)-B(15)
! JVS(37) = Jac_FULL(11,12)
  JVS(37) = B(3)
! JVS(38) = Jac_FULL(11,13)
  JVS(38) = -B(5)
! JVS(39) = Jac_FULL(12,9)
  JVS(39) = -B(16)
! JVS(40) = Jac_FULL(12,10)
  JVS(40) = B(14)
! JVS(41) = Jac_FULL(12,11)
  JVS(41) = B(4)+B(15)
! JVS(42) = Jac_FULL(12,12)
  JVS(42) = -B(3)-B(17)
! JVS(43) = Jac_FULL(12,13)
  JVS(43) = B(5)
! JVS(44) = Jac_FULL(13,8)
  JVS(44) = B(1)
! JVS(45) = Jac_FULL(13,10)
  JVS(45) = -B(19)
! JVS(46) = Jac_FULL(13,11)
  JVS(46) = -B(4)
! JVS(47) = Jac_FULL(13,12)
  JVS(47) = 0
! JVS(48) = Jac_FULL(13,13)
  JVS(48) = -B(5)-B(6)-B(7)-B(20)
      
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

  JUV(1) = JVS(1)*UV(1)+JVS(2)*UV(6)+JVS(3)*UV(9)
  JUV(2) = JVS(4)*UV(2)+JVS(5)*UV(5)
  JUV(3) = JVS(6)*UV(3)+JVS(7)*UV(4)
  JUV(4) = JVS(8)*UV(4)+JVS(9)*UV(9)+JVS(10)*UV(12)
  JUV(5) = JVS(11)*UV(5)+JVS(12)*UV(10)
  JUV(6) = JVS(13)*UV(6)+JVS(14)*UV(9)
  JUV(7) = JVS(15)*UV(7)+JVS(16)*UV(13)
  JUV(8) = JVS(17)*UV(7)+JVS(18)*UV(8)+JVS(19)*UV(12)+JVS(20)*UV(13)
  JUV(9) = JVS(21)*UV(5)+JVS(22)*UV(6)+JVS(23)*UV(7)+JVS(24)*UV(9)+JVS(25)*UV(10)+JVS(26)*UV(11)+JVS(27)*UV(12)+JVS(28)&
             &*UV(13)
  JUV(10) = JVS(29)*UV(6)+JVS(30)*UV(9)+JVS(31)*UV(10)+JVS(32)*UV(11)+JVS(34)*UV(13)
  JUV(11) = JVS(35)*UV(10)+JVS(36)*UV(11)+JVS(37)*UV(12)+JVS(38)*UV(13)
  JUV(12) = JVS(39)*UV(9)+JVS(40)*UV(10)+JVS(41)*UV(11)+JVS(42)*UV(12)+JVS(43)*UV(13)
  JUV(13) = JVS(44)*UV(8)+JVS(45)*UV(10)+JVS(46)*UV(11)+JVS(48)*UV(13)
      
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

  JTUV(1) = JVS(1)*UV(1)
  JTUV(2) = JVS(4)*UV(2)
  JTUV(3) = JVS(6)*UV(3)
  JTUV(4) = JVS(7)*UV(3)+JVS(8)*UV(4)
  JTUV(5) = JVS(5)*UV(2)+JVS(11)*UV(5)+JVS(21)*UV(9)
  JTUV(6) = JVS(2)*UV(1)+JVS(13)*UV(6)+JVS(22)*UV(9)+JVS(29)*UV(10)
  JTUV(7) = JVS(15)*UV(7)+JVS(17)*UV(8)+JVS(23)*UV(9)
  JTUV(8) = JVS(18)*UV(8)+JVS(44)*UV(13)
  JTUV(9) = JVS(3)*UV(1)+JVS(9)*UV(4)+JVS(14)*UV(6)+JVS(24)*UV(9)+JVS(30)*UV(10)+JVS(39)*UV(12)
  JTUV(10) = JVS(12)*UV(5)+JVS(25)*UV(9)+JVS(31)*UV(10)+JVS(35)*UV(11)+JVS(40)*UV(12)+JVS(45)*UV(13)
  JTUV(11) = JVS(26)*UV(9)+JVS(32)*UV(10)+JVS(36)*UV(11)+JVS(41)*UV(12)+JVS(46)*UV(13)
  JTUV(12) = JVS(10)*UV(4)+JVS(19)*UV(8)+JVS(27)*UV(9)+JVS(37)*UV(11)+JVS(42)*UV(12)
  JTUV(13) = JVS(16)*UV(7)+JVS(20)*UV(8)+JVS(28)*UV(9)+JVS(34)*UV(10)+JVS(38)*UV(11)+JVS(43)*UV(12)+JVS(48)*UV(13)
      
END SUBROUTINE JacTR_SP_Vec

! End of JacTR_SP_Vec function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE ttropo_Jacobian

