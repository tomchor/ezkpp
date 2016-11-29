MODULE my_strato_Model

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!  Completely defines the model my_strato
!    by using all the associated modules
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  USE my_strato_Precision
  USE my_strato_Parameters
  USE my_strato_Global
  USE my_strato_Function
  USE my_strato_Integrator
  USE my_strato_Rates
  USE my_strato_Jacobian
  USE my_strato_Hessian
  USE my_strato_Stoichiom
  USE my_strato_LinearAlgebra
  USE my_strato_Monitor
  USE my_strato_Util

END MODULE my_strato_Model

