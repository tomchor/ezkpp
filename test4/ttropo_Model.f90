MODULE ttropo_Model

!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!  Completely defines the model ttropo
!    by using all the associated modules
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  USE ttropo_Precision
  USE ttropo_Parameters
  USE ttropo_Global
  USE ttropo_Function
  USE ttropo_Integrator
  USE ttropo_Rates
  USE ttropo_Jacobian
  USE ttropo_Hessian
  USE ttropo_Stoichiom
  USE ttropo_LinearAlgebra
  USE ttropo_Monitor
  USE ttropo_Util

END MODULE ttropo_Model

