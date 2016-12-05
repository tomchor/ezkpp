! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! 
! Parameter Module File
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
! File                 : my_strato_Parameters.f90
! Time                 : Mon Dec  5 09:01:37 2016
! Working directory    : /home/tomas/ezkpp/test2
! Equation file        : my_strato.kpp
! Output root filename : my_strato
! 
! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



MODULE my_strato_Parameters

  USE my_strato_Precision
  PUBLIC
  SAVE


! NSPEC - Number of chemical species
  INTEGER, PARAMETER :: NSPEC = 7 
! NVAR - Number of Variable species
  INTEGER, PARAMETER :: NVAR = 5 
! NVARACT - Number of Active species
  INTEGER, PARAMETER :: NVARACT = 5 
! NFIX - Number of Fixed species
  INTEGER, PARAMETER :: NFIX = 2 
! NREACT - Number of reactions
  INTEGER, PARAMETER :: NREACT = 10 
! NVARST - Starting of variables in conc. vect.
  INTEGER, PARAMETER :: NVARST = 1 
! NFIXST - Starting of fixed in conc. vect.
  INTEGER, PARAMETER :: NFIXST = 6 
! NONZERO - Number of nonzero entries in Jacobian
  INTEGER, PARAMETER :: NONZERO = 18 
! LU_NONZERO - Number of nonzero entries in LU factoriz. of Jacobian
  INTEGER, PARAMETER :: LU_NONZERO = 19 
! CNVAR - (NVAR+1) Number of elements in compressed row format
  INTEGER, PARAMETER :: CNVAR = 6 
! CNEQN - (NREACT+1) Number stoicm elements in compressed col format
  INTEGER, PARAMETER :: CNEQN = 11 
! NHESS - Length of Sparse Hessian
  INTEGER, PARAMETER :: NHESS = 10 
! NLOOKAT - Number of species to look at
  INTEGER, PARAMETER :: NLOOKAT = 3 
! NMONITOR - Number of species to monitor
  INTEGER, PARAMETER :: NMONITOR = 6 
! NMASS - Number of atoms to check mass balance
  INTEGER, PARAMETER :: NMASS = 1 

! Index declaration for variable species in C and VAR
!   VAR(ind_spc) = C(ind_spc)

  INTEGER, PARAMETER :: ind_O1D = 1 
  INTEGER, PARAMETER :: ind_O = 2 
  INTEGER, PARAMETER :: ind_O3 = 3 
  INTEGER, PARAMETER :: ind_NO = 4 
  INTEGER, PARAMETER :: ind_NO2 = 5 

! Index declaration for fixed species in C
!   C(ind_spc)

  INTEGER, PARAMETER :: ind_M = 6 
  INTEGER, PARAMETER :: ind_O2 = 7 

! Index declaration for fixed species in FIX
!    FIX(indf_spc) = C(ind_spc) = C(NVAR+indf_spc)

  INTEGER, PARAMETER :: indf_M = 1 
  INTEGER, PARAMETER :: indf_O2 = 2 

! NJVRP - Length of sparse Jacobian JVRP
  INTEGER, PARAMETER :: NJVRP = 13 

! NSTOICM - Length of Sparse Stoichiometric Matrix
  INTEGER, PARAMETER :: NSTOICM = 22 

END MODULE my_strato_Parameters

