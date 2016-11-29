! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Hessian File
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
! File                 : ttropo_Hessian.f90
! Time                 : Tue Nov 29 09:15:36 2016
! Working directory    : /home/tomas/ezkpp/test4
! Equation file        : ttropo.kpp
! Output root filename : ttropo
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE ttropo_Hessian

  USE ttropo_Parameters
  USE ttropo_HessianSP

  IMPLICIT NONE

CONTAINS


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Hessian - function for Hessian (Jac derivative w.r.t. variables)
!   Arguments :
!      V         - Concentrations of variable species (local)
!      F         - Concentrations of fixed species (local)
!      RCT       - Rate constants (local)
!      HESS      - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Hessian ( V, F, RCT, HESS )

! V - Concentrations of variable species (local)
  REAL(kind=dp) :: V(NVAR)
! F - Concentrations of fixed species (local)
  REAL(kind=dp) :: F(NFIX)
! RCT - Rate constants (local)
  REAL(kind=dp) :: RCT(NREACT)
! HESS - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
  REAL(kind=dp) :: HESS(NHESS)

! --------------------------------------------------------
! Note: HESS is represented in coordinate sparse format:
!       HESS(m) = d^2 f_i / dv_j dv_k = d Jac_{i,j} / dv_k
!       where i = IHESS_I(m), j = IHESS_J(m), k = IHESS_K(m).
! --------------------------------------------------------
! Note: d^2 f_i / dv_j dv_k = d^2 f_i / dv_k dv_j,
!       therefore only the terms d^2 f_i / dv_j dv_k
!       with j <= k are computed and stored in HESS.
! --------------------------------------------------------

! Local variables
! D2A - Second derivatives of equation rates
  REAL(kind=dp) :: D2A(6)

! Computation of the second derivatives of equation rates
! D2A(1) = d^2 A(3) / dV(8)dV(10)
  D2A(1) = RCT(3)
! D2A(2) = d^2 A(8) / dV(4)dV(7)
  D2A(2) = RCT(8)
! D2A(3) = d^2 A(9) / dV(8)dV(9)
  D2A(3) = RCT(9)
! D2A(4) = d^2 A(10) / dV(7)dV(11)
  D2A(4) = RCT(10)
! D2A(5) = d^2 A(11)/{dV(9)dV(9)}
  D2A(5) = RCT(11)*2
! D2A(6) = d^2 A(12) / dV(9)dV(10)
  D2A(6) = RCT(12)

! Computation of the Jacobian derivative
! HESS(1) = d^2 Vdot(1)/{dV(7)dV(11)} = d^2 Vdot(1)/{dV(11)dV(7)}
  HESS(1) = D2A(4)
! HESS(2) = d^2 Vdot(2)/{dV(4)dV(7)} = d^2 Vdot(2)/{dV(7)dV(4)}
  HESS(2) = D2A(2)
! HESS(3) = d^2 Vdot(3)/{dV(9)dV(9)} = d^2 Vdot(3)/{dV(9)dV(9)}
  HESS(3) = D2A(5)
! HESS(4) = d^2 Vdot(4)/{dV(4)dV(7)} = d^2 Vdot(4)/{dV(7)dV(4)}
  HESS(4) = -D2A(2)
! HESS(5) = d^2 Vdot(7)/{dV(4)dV(7)} = d^2 Vdot(7)/{dV(7)dV(4)}
  HESS(5) = -D2A(2)
! HESS(6) = d^2 Vdot(7)/{dV(7)dV(11)} = d^2 Vdot(7)/{dV(11)dV(7)}
  HESS(6) = -D2A(4)
! HESS(7) = d^2 Vdot(7)/{dV(8)dV(9)} = d^2 Vdot(7)/{dV(9)dV(8)}
  HESS(7) = D2A(3)
! HESS(8) = d^2 Vdot(7)/{dV(9)dV(10)} = d^2 Vdot(7)/{dV(10)dV(9)}
  HESS(8) = D2A(6)
! HESS(9) = d^2 Vdot(8)/{dV(8)dV(9)} = d^2 Vdot(8)/{dV(9)dV(8)}
  HESS(9) = -D2A(3)
! HESS(10) = d^2 Vdot(8)/{dV(8)dV(10)} = d^2 Vdot(8)/{dV(10)dV(8)}
  HESS(10) = -D2A(1)
! HESS(11) = d^2 Vdot(9)/{dV(4)dV(7)} = d^2 Vdot(9)/{dV(7)dV(4)}
  HESS(11) = D2A(2)
! HESS(12) = d^2 Vdot(9)/{dV(8)dV(9)} = d^2 Vdot(9)/{dV(9)dV(8)}
  HESS(12) = -D2A(3)
! HESS(13) = d^2 Vdot(9)/{dV(9)dV(9)} = d^2 Vdot(9)/{dV(9)dV(9)}
  HESS(13) = -2*D2A(5)
! HESS(14) = d^2 Vdot(9)/{dV(9)dV(10)} = d^2 Vdot(9)/{dV(10)dV(9)}
  HESS(14) = -D2A(6)
! HESS(15) = d^2 Vdot(10)/{dV(8)dV(10)} = d^2 Vdot(10)/{dV(10)dV(8)}
  HESS(15) = -D2A(1)
! HESS(16) = d^2 Vdot(10)/{dV(9)dV(10)} = d^2 Vdot(10)/{dV(10)dV(9)}
  HESS(16) = -D2A(6)
! HESS(17) = d^2 Vdot(11)/{dV(7)dV(11)} = d^2 Vdot(11)/{dV(11)dV(7)}
  HESS(17) = -D2A(4)
! HESS(18) = d^2 Vdot(11)/{dV(8)dV(9)} = d^2 Vdot(11)/{dV(9)dV(8)}
  HESS(18) = D2A(3)
! HESS(19) = d^2 Vdot(11)/{dV(8)dV(10)} = d^2 Vdot(11)/{dV(10)dV(8)}
  HESS(19) = D2A(1)
      
END SUBROUTINE Hessian

! End of Hessian function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! HessTR_Vec - Hessian transposed times user vectors
!   Arguments :
!      HESS      - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
!      U1        - User vector
!      U2        - User vector
!      HTU       - Transposed Hessian times user vectors: (Hess x U2)^T * U1 = [d (Jac^T*U1)/d Var] * U2
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE HessTR_Vec ( HESS, U1, U2, HTU )

! HESS - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
  REAL(kind=dp) :: HESS(NHESS)
! U1 - User vector
  REAL(kind=dp) :: U1(NVAR)
! U2 - User vector
  REAL(kind=dp) :: U2(NVAR)
! HTU - Transposed Hessian times user vectors: (Hess x U2)^T * U1 = [d (Jac^T*U1)/d Var] * U2
  REAL(kind=dp) :: HTU(NVAR)

! Compute the vector HTU =(Hess x U2)^T * U1 = d (Jac^T*U1)/d Var * U2
  HTU(1) = 0
  HTU(2) = 0
  HTU(3) = 0
  HTU(4) = HESS(2)*(U1(2)*U2(7))+HESS(4)*(U1(4)*U2(7))+HESS(5)*(U1(7)*U2(7))+HESS(11)*(U1(9)*U2(7))
  HTU(5) = 0
  HTU(6) = 0
  HTU(7) = HESS(1)*(U1(1)*U2(11))+HESS(2)*(U1(2)*U2(4))+HESS(4)*(U1(4)*U2(4))+HESS(5)*(U1(7)*U2(4))+HESS(6)*(U1(7)&
             &*U2(11))+HESS(11)*(U1(9)*U2(4))+HESS(17)*(U1(11)*U2(11))
  HTU(8) = HESS(7)*(U1(7)*U2(9))+HESS(9)*(U1(8)*U2(9))+HESS(10)*(U1(8)*U2(10))+HESS(12)*(U1(9)*U2(9))+HESS(15)*(U1(10)&
             &*U2(10))+HESS(18)*(U1(11)*U2(9))+HESS(19)*(U1(11)*U2(10))
  HTU(9) = HESS(3)*(U1(3)*U2(9))+HESS(7)*(U1(7)*U2(8))+HESS(8)*(U1(7)*U2(10))+HESS(9)*(U1(8)*U2(8))+HESS(12)*(U1(9)&
             &*U2(8))+HESS(13)*(U1(9)*U2(9))+HESS(14)*(U1(9)*U2(10))+HESS(16)*(U1(10)*U2(10))+HESS(18)*(U1(11)*U2(8))
  HTU(10) = HESS(8)*(U1(7)*U2(9))+HESS(10)*(U1(8)*U2(8))+HESS(14)*(U1(9)*U2(9))+HESS(15)*(U1(10)*U2(8))+HESS(16)*(U1(10)&
              &*U2(9))+HESS(19)*(U1(11)*U2(8))
  HTU(11) = HESS(1)*(U1(1)*U2(7))+HESS(6)*(U1(7)*U2(7))+HESS(17)*(U1(11)*U2(7))
      
END SUBROUTINE HessTR_Vec

! End of HessTR_Vec function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Hess_Vec - Hessian times user vectors
!   Arguments :
!      HESS      - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
!      U1        - User vector
!      U2        - User vector
!      HU        - Hessian times user vectors: (Hess x U2) * U1 = [d (Jac*U1)/d Var] * U2
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE Hess_Vec ( HESS, U1, U2, HU )

! HESS - Hessian of Var (i.e. the 3-tensor d Jac / d Var)
  REAL(kind=dp) :: HESS(NHESS)
! U1 - User vector
  REAL(kind=dp) :: U1(NVAR)
! U2 - User vector
  REAL(kind=dp) :: U2(NVAR)
! HU - Hessian times user vectors: (Hess x U2) * U1 = [d (Jac*U1)/d Var] * U2
  REAL(kind=dp) :: HU(NVAR)

! Compute the vector HU =(Hess x U2) * U1 = d (Jac*U1)/d Var * U2
  HU(1) = HESS(1)*(U1(7)*U2(11))+HESS(1)*(U1(11)*U2(7))
  HU(2) = HESS(2)*(U1(4)*U2(7))+HESS(2)*(U1(7)*U2(4))
  HU(3) = HESS(3)*(U1(9)*U2(9))
  HU(4) = HESS(4)*(U1(4)*U2(7))+HESS(4)*(U1(7)*U2(4))
  HU(5) = 0
  HU(6) = 0
  HU(7) = HESS(5)*(U1(4)*U2(7))+HESS(5)*(U1(7)*U2(4))+HESS(6)*(U1(7)*U2(11))+HESS(6)*(U1(11)*U2(7))+HESS(7)*(U1(8)&
            &*U2(9))+HESS(7)*(U1(9)*U2(8))+HESS(8)*(U1(9)*U2(10))+HESS(8)*(U1(10)*U2(9))
  HU(8) = HESS(9)*(U1(8)*U2(9))+HESS(9)*(U1(9)*U2(8))+HESS(10)*(U1(8)*U2(10))+HESS(10)*(U1(10)*U2(8))
  HU(9) = HESS(11)*(U1(4)*U2(7))+HESS(11)*(U1(7)*U2(4))+HESS(12)*(U1(8)*U2(9))+HESS(12)*(U1(9)*U2(8))+HESS(13)*(U1(9)&
            &*U2(9))+HESS(14)*(U1(9)*U2(10))+HESS(14)*(U1(10)*U2(9))
  HU(10) = HESS(15)*(U1(8)*U2(10))+HESS(15)*(U1(10)*U2(8))+HESS(16)*(U1(9)*U2(10))+HESS(16)*(U1(10)*U2(9))
  HU(11) = HESS(17)*(U1(7)*U2(11))+HESS(17)*(U1(11)*U2(7))+HESS(18)*(U1(8)*U2(9))+HESS(18)*(U1(9)*U2(8))+HESS(19)*(U1(8)&
             &*U2(10))+HESS(19)*(U1(10)*U2(8))
      
END SUBROUTINE Hess_Vec

! End of Hess_Vec function
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



END MODULE ttropo_Hessian

