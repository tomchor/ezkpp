! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! The ODE Function of Chemical Model File
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
! File                 : ttropo_Function.f90
! Time                 : Wed Dec  7 13:43:04 2016
! Working directory    : /home/tomas/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_Function

  USE ttropo_Parameters
  IMPLICIT NONE

! A - Rate for each equation
  REAL(kind=dp) :: A(NREACT)

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Fun - time derivatives of variables - Agregate form
!   Arguments :
!      V         - Concentrations of variable species (local)
!      F         - Concentrations of fixed species (local)
!      RCT       - Rate constants (local)
!      Vdot      - Time derivative of variable species concentrations
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Fun ( V, F, RCT, Vdot )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! F - Concentrations of fixed species (local)
  REAL(kind=dp) :: F(NFIX)
! RCT - Rate constants (local)
  REAL(kind=dp) :: RCT(NREACT)
! Vdot - Time derivative of variable species concentrations
  REAL(kind=dp) :: Vdot(NVAR)


! Computation of equation rates
  A(1) = RCT(1)*V(8)*F(2)
  A(2) = RCT(2)*V(11)
  A(3) = RCT(3)*V(12)*V(13)
  A(4) = RCT(4)*V(13)
  A(5) = RCT(5)*V(13)
  A(6) = RCT(6)*V(7)*F(1)
  A(7) = RCT(7)*V(7)*F(3)
  A(8) = RCT(8)*V(6)*V(9)
  A(9) = RCT(9)*V(10)*V(12)
  A(10) = RCT(10)*V(9)*V(11)
  A(11) = RCT(11)*V(10)*V(10)
  A(12) = RCT(12)*V(10)*V(13)
  A(13) = RCT(13)*V(5)
  A(14) = RCT(14)*V(5)
  A(15) = RCT(15)*V(4)

! Aggregate function
  Vdot(1) = A(8)
  Vdot(2) = A(14)
  Vdot(3) = A(15)
  Vdot(4) = A(10)-A(15)
  Vdot(5) = A(11)-A(13)-A(14)
  Vdot(6) = -A(8)
  Vdot(7) = A(5)-A(6)-A(7)
  Vdot(8) = -A(1)+A(2)+A(4)+A(6)
  Vdot(9) = 2*A(7)-A(8)+A(9)-A(10)+A(12)+2*A(13)
  Vdot(10) = A(8)-A(9)-2*A(11)-A(12)
  Vdot(11) = -A(2)+A(3)+A(9)-A(10)
  Vdot(12) = A(2)-A(3)-A(9)
  Vdot(13) = A(1)-A(3)-A(4)-A(5)-A(12)
      
END SUBROUTINE Fun

! End of Fun function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE ttropo_Function

