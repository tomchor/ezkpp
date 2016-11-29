
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 SUBROUTINE mexFunction( nlhs, plhs, nrhs, prhs )
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!                  Matlab Gateway for the Function Hessian
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 USE ttropo_Model

      INTEGER nlhs, nrhs
      INTEGER plhs(*), prhs(*)
      INTEGER mxGetPr, mxCreateFull, mxGetM, mxgetN
      INTEGER VPtr, FPtr, RPtr, HESSPtr
      REAL(kind=dp) V(8), F(6), RCT(13)
      REAL(kind=dp) HESS(3)

! Check for the right number of input arguments
      IF ( nrhs .ne. 3 ) THEN
         CALL mexErrMsgTxt('Hessian requires 3 input vectors: &
     &V(8), F(6), RCT(13)')
      END IF 
! Check for the right number of output arguments
      IF ( nlhs .ne. 1 ) THEN
         CALL mexErrMsgTxt('Hessian requires 1 output vector: &
     &HESS(3)')
      END IF 

      plhs(1) = mxCreateDoubleMatrix(3,1,0)

      VPtr = mxGetPr(prhs(1));
      CALL mxCopyPtrToReal8(VPtr,V,8)
      
      FPtr = mxGetPr(prhs(2));
      CALL mxCopyPtrToReal8(FPtr,F,6)
      
      RPtr = mxGetPr(prhs(3));
      CALL mxCopyPtrToReal8(RPtr,RCT,13)

      HESSPtr = mxGetPr(plhs(1))

      CALL Hessian( V, F, RCT, HESS )

      CALL mxCopyReal8ToPtr(HESS, HESSPtr, 3)

 END SUBROUTINE mexFunction
