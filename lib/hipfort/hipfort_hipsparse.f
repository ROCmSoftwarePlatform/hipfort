!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2021 Advanced Micro Devices, Inc. All rights reserved.
! [MITx11 License]
! 
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
! 
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
! 
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          
           
module hipfort_hipsparse
  use hipfort_hipsparse_enums
  implicit none

 
  !>  hipSPARSE initialization and management routines 
  interface hipsparseCreate
#ifdef USE_CUDA_NAMES
    function hipsparseCreate_orig(handle) bind(c, name="cusparseCreate")
#else
    function hipsparseCreate_orig(handle) bind(c, name="hipsparseCreate")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreate_orig
      type(c_ptr) :: handle
    end function


  end interface
  
  interface hipsparseDestroy
#ifdef USE_CUDA_NAMES
    function hipsparseDestroy_orig(handle) bind(c, name="cusparseDestroy")
#else
    function hipsparseDestroy_orig(handle) bind(c, name="hipsparseDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroy_orig
      type(c_ptr),value :: handle
    end function


  end interface
  
  interface hipsparseGetVersion
#ifdef USE_CUDA_NAMES
    function hipsparseGetVersion_orig(handle,version) bind(c, name="cusparseGetVersion")
#else
    function hipsparseGetVersion_orig(handle,version) bind(c, name="hipsparseGetVersion")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetVersion_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: version
    end function


  end interface
  
  interface hipsparseGetGitRevision
#ifdef USE_CUDA_NAMES
    function hipsparseGetGitRevision_orig(handle,rev) bind(c, name="cusparseGetGitRevision")
#else
    function hipsparseGetGitRevision_orig(handle,rev) bind(c, name="hipsparseGetGitRevision")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetGitRevision_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: rev
    end function


  end interface
  
  interface hipsparseSetStream
#ifdef USE_CUDA_NAMES
    function hipsparseSetStream_orig(handle,streamId) bind(c, name="cusparseSetStream")
#else
    function hipsparseSetStream_orig(handle,streamId) bind(c, name="hipsparseSetStream")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetStream_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function


  end interface
  
  interface hipsparseGetStream
#ifdef USE_CUDA_NAMES
    function hipsparseGetStream_orig(handle,streamId) bind(c, name="cusparseGetStream")
#else
    function hipsparseGetStream_orig(handle,streamId) bind(c, name="hipsparseGetStream")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetStream_orig
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function


  end interface
  !>  hipSPARSE type creation, destruction, set and get routines 
  interface hipsparseSetPointerMode
#ifdef USE_CUDA_NAMES
    function hipsparseSetPointerMode_orig(handle,mode) bind(c, name="cusparseSetPointerMode")
#else
    function hipsparseSetPointerMode_orig(handle,mode) bind(c, name="hipsparseSetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetPointerMode_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_POINTER_MODE_HOST)),value :: mode
    end function


  end interface
  
  interface hipsparseGetPointerMode
#ifdef USE_CUDA_NAMES
    function hipsparseGetPointerMode_orig(handle,mode) bind(c, name="cusparseGetPointerMode")
#else
    function hipsparseGetPointerMode_orig(handle,mode) bind(c, name="hipsparseGetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetPointerMode_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function


  end interface
  
  interface hipsparseCreateMatDescr
#ifdef USE_CUDA_NAMES
    function hipsparseCreateMatDescr_orig(descrA) bind(c, name="cusparseCreateMatDescr")
#else
    function hipsparseCreateMatDescr_orig(descrA) bind(c, name="hipsparseCreateMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateMatDescr_orig
      type(c_ptr) :: descrA
    end function


  end interface
  
  interface hipsparseDestroyMatDescr
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyMatDescr_orig(descrA) bind(c, name="cusparseDestroyMatDescr")
#else
    function hipsparseDestroyMatDescr_orig(descrA) bind(c, name="hipsparseDestroyMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyMatDescr_orig
      type(c_ptr),value :: descrA
    end function


  end interface
  
  interface hipsparseCopyMatDescr
#ifdef USE_CUDA_NAMES
    function hipsparseCopyMatDescr_orig(dest,src) bind(c, name="cusparseCopyMatDescr")
#else
    function hipsparseCopyMatDescr_orig(dest,src) bind(c, name="hipsparseCopyMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCopyMatDescr_orig
      type(c_ptr),value :: dest
      type(c_ptr),value :: src
    end function


  end interface
  
  interface hipsparseSetMatType
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatType_orig(descrA,myType) bind(c, name="cusparseSetMatType")
#else
    function hipsparseSetMatType_orig(descrA,myType) bind(c, name="hipsparseSetMatType")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatType_orig
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_MATRIX_TYPE_GENERAL)),value :: myType
    end function


  end interface
  
  interface hipsparseSetMatFillMode
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatFillMode_orig(descrA,fillMode) bind(c, name="cusparseSetMatFillMode")
#else
    function hipsparseSetMatFillMode_orig(descrA,fillMode) bind(c, name="hipsparseSetMatFillMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatFillMode_orig
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_FILL_MODE_LOWER)),value :: fillMode
    end function


  end interface
  
  interface hipsparseSetMatDiagType
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatDiagType_orig(descrA,diagType) bind(c, name="cusparseSetMatDiagType")
#else
    function hipsparseSetMatDiagType_orig(descrA,diagType) bind(c, name="hipsparseSetMatDiagType")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatDiagType_orig
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_DIAG_TYPE_NON_UNIT)),value :: diagType
    end function


  end interface
  
  interface hipsparseSetMatIndexBase
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatIndexBase_orig(descrA,base) bind(c, name="cusparseSetMatIndexBase")
#else
    function hipsparseSetMatIndexBase_orig(descrA,base) bind(c, name="hipsparseSetMatIndexBase")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatIndexBase_orig
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: base
    end function


  end interface
  
  interface hipsparseCreateHybMat
#ifdef USE_CUDA_NAMES
    function hipsparseCreateHybMat_orig(hybA) bind(c, name="cusparseCreateHybMat")
#else
    function hipsparseCreateHybMat_orig(hybA) bind(c, name="hipsparseCreateHybMat")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateHybMat_orig
      type(c_ptr) :: hybA
    end function


  end interface
  
  interface hipsparseDestroyHybMat
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyHybMat_orig(hybA) bind(c, name="cusparseDestroyHybMat")
#else
    function hipsparseDestroyHybMat_orig(hybA) bind(c, name="hipsparseDestroyHybMat")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyHybMat_orig
      type(c_ptr),value :: hybA
    end function


  end interface
  !>  Info structures 
  interface hipsparseCreateBsrsv2Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateBsrsv2Info_orig(myInfo) bind(c, name="cusparseCreateBsrsv2Info")
#else
    function hipsparseCreateBsrsv2Info_orig(myInfo) bind(c, name="hipsparseCreateBsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateBsrsv2Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyBsrsv2Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyBsrsv2Info_orig(myInfo) bind(c, name="cusparseDestroyBsrsv2Info")
#else
    function hipsparseDestroyBsrsv2Info_orig(myInfo) bind(c, name="hipsparseDestroyBsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyBsrsv2Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateBsrilu02Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateBsrilu02Info_orig(myInfo) bind(c, name="cusparseCreateBsrilu02Info")
#else
    function hipsparseCreateBsrilu02Info_orig(myInfo) bind(c, name="hipsparseCreateBsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateBsrilu02Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyBsrilu02Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyBsrilu02Info_orig(myInfo) bind(c, name="cusparseDestroyBsrilu02Info")
#else
    function hipsparseDestroyBsrilu02Info_orig(myInfo) bind(c, name="hipsparseDestroyBsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyBsrilu02Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateBsric02Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateBsric02Info_orig(myInfo) bind(c, name="cusparseCreateBsric02Info")
#else
    function hipsparseCreateBsric02Info_orig(myInfo) bind(c, name="hipsparseCreateBsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateBsric02Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyBsric02Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyBsric02Info_orig(myInfo) bind(c, name="cusparseDestroyBsric02Info")
#else
    function hipsparseDestroyBsric02Info_orig(myInfo) bind(c, name="hipsparseDestroyBsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyBsric02Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateCsrsv2Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrsv2Info_orig(myInfo) bind(c, name="cusparseCreateCsrsv2Info")
#else
    function hipsparseCreateCsrsv2Info_orig(myInfo) bind(c, name="hipsparseCreateCsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsv2Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyCsrsv2Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrsv2Info_orig(myInfo) bind(c, name="cusparseDestroyCsrsv2Info")
#else
    function hipsparseDestroyCsrsv2Info_orig(myInfo) bind(c, name="hipsparseDestroyCsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsv2Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateCsrsm2Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrsm2Info_orig(myInfo) bind(c, name="cusparseCreateCsrsm2Info")
#else
    function hipsparseCreateCsrsm2Info_orig(myInfo) bind(c, name="hipsparseCreateCsrsm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsm2Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyCsrsm2Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrsm2Info_orig(myInfo) bind(c, name="cusparseDestroyCsrsm2Info")
#else
    function hipsparseDestroyCsrsm2Info_orig(myInfo) bind(c, name="hipsparseDestroyCsrsm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsm2Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateCsrilu02Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrilu02Info_orig(myInfo) bind(c, name="cusparseCreateCsrilu02Info")
#else
    function hipsparseCreateCsrilu02Info_orig(myInfo) bind(c, name="hipsparseCreateCsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrilu02Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyCsrilu02Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrilu02Info_orig(myInfo) bind(c, name="cusparseDestroyCsrilu02Info")
#else
    function hipsparseDestroyCsrilu02Info_orig(myInfo) bind(c, name="hipsparseDestroyCsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrilu02Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateCsric02Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsric02Info_orig(myInfo) bind(c, name="cusparseCreateCsric02Info")
#else
    function hipsparseCreateCsric02Info_orig(myInfo) bind(c, name="hipsparseCreateCsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsric02Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyCsric02Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsric02Info_orig(myInfo) bind(c, name="cusparseDestroyCsric02Info")
#else
    function hipsparseDestroyCsric02Info_orig(myInfo) bind(c, name="hipsparseDestroyCsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsric02Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreateCsrgemm2Info
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrgemm2Info_orig(myInfo) bind(c, name="cusparseCreateCsrgemm2Info")
#else
    function hipsparseCreateCsrgemm2Info_orig(myInfo) bind(c, name="hipsparseCreateCsrgemm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrgemm2Info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyCsrgemm2Info
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrgemm2Info_orig(myInfo) bind(c, name="cusparseDestroyCsrgemm2Info")
#else
    function hipsparseDestroyCsrgemm2Info_orig(myInfo) bind(c, name="hipsparseDestroyCsrgemm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrgemm2Info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseCreatePruneInfo
#ifdef USE_CUDA_NAMES
    function hipsparseCreatePruneInfo_orig(myInfo) bind(c, name="cusparseCreatePruneInfo")
#else
    function hipsparseCreatePruneInfo_orig(myInfo) bind(c, name="hipsparseCreatePruneInfo")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreatePruneInfo_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  
  interface hipsparseDestroyPruneInfo
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyPruneInfo_orig(myInfo) bind(c, name="cusparseDestroyPruneInfo")
#else
    function hipsparseDestroyPruneInfo_orig(myInfo) bind(c, name="hipsparseDestroyPruneInfo")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyPruneInfo_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  
  interface hipsparseSaxpyi
#ifdef USE_CUDA_NAMES
    function hipsparseSaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseSaxpyi")
#else
    function hipsparseSaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseSaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSaxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSaxpyi_rank_0,hipsparseSaxpyi_rank_1
#endif

  end interface
  
  interface hipsparseDaxpyi
#ifdef USE_CUDA_NAMES
    function hipsparseDaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseDaxpyi")
#else
    function hipsparseDaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseDaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDaxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDaxpyi_rank_0,hipsparseDaxpyi_rank_1
#endif

  end interface
  
  interface hipsparseCaxpyi
#ifdef USE_CUDA_NAMES
    function hipsparseCaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseCaxpyi")
#else
    function hipsparseCaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseCaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCaxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCaxpyi_rank_0,hipsparseCaxpyi_rank_1
#endif

  end interface
  
  interface hipsparseZaxpyi
#ifdef USE_CUDA_NAMES
    function hipsparseZaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseZaxpyi")
#else
    function hipsparseZaxpyi_orig(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseZaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZaxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZaxpyi_rank_0,hipsparseZaxpyi_rank_1
#endif

  end interface
  
  interface hipsparseSdoti
#ifdef USE_CUDA_NAMES
    function hipsparseSdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseSdoti")
#else
    function hipsparseSdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseSdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSdoti_rank_0,hipsparseSdoti_rank_1
#endif

  end interface
  
  interface hipsparseDdoti
#ifdef USE_CUDA_NAMES
    function hipsparseDdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseDdoti")
#else
    function hipsparseDdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseDdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDdoti_rank_0,hipsparseDdoti_rank_1
#endif

  end interface
  
  interface hipsparseCdoti
#ifdef USE_CUDA_NAMES
    function hipsparseCdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseCdoti")
#else
    function hipsparseCdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCdoti_rank_0,hipsparseCdoti_rank_1
#endif

  end interface
  
  interface hipsparseZdoti
#ifdef USE_CUDA_NAMES
    function hipsparseZdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseZdoti")
#else
    function hipsparseZdoti_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZdoti_rank_0,hipsparseZdoti_rank_1
#endif

  end interface
  
  interface hipsparseCdotci
#ifdef USE_CUDA_NAMES
    function hipsparseCdotci_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseCdotci")
#else
    function hipsparseCdotci_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdotci")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdotci_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCdotci_rank_0,hipsparseCdotci_rank_1
#endif

  end interface
  
  interface hipsparseZdotci
#ifdef USE_CUDA_NAMES
    function hipsparseZdotci_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseZdotci")
#else
    function hipsparseZdotci_orig(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdotci")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdotci_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZdotci_rank_0,hipsparseZdotci_rank_1
#endif

  end interface
  
  interface hipsparseSgthr
#ifdef USE_CUDA_NAMES
    function hipsparseSgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseSgthr")
#else
    function hipsparseSgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSgthr_rank_0,hipsparseSgthr_rank_1
#endif

  end interface
  
  interface hipsparseDgthr
#ifdef USE_CUDA_NAMES
    function hipsparseDgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseDgthr")
#else
    function hipsparseDgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDgthr_rank_0,hipsparseDgthr_rank_1
#endif

  end interface
  
  interface hipsparseCgthr
#ifdef USE_CUDA_NAMES
    function hipsparseCgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseCgthr")
#else
    function hipsparseCgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCgthr_rank_0,hipsparseCgthr_rank_1
#endif

  end interface
  
  interface hipsparseZgthr
#ifdef USE_CUDA_NAMES
    function hipsparseZgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseZgthr")
#else
    function hipsparseZgthr_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZgthr_rank_0,hipsparseZgthr_rank_1
#endif

  end interface
  
  interface hipsparseSgthrz
#ifdef USE_CUDA_NAMES
    function hipsparseSgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseSgthrz")
#else
    function hipsparseSgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSgthrz_rank_0,hipsparseSgthrz_rank_1
#endif

  end interface
  
  interface hipsparseDgthrz
#ifdef USE_CUDA_NAMES
    function hipsparseDgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseDgthrz")
#else
    function hipsparseDgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDgthrz_rank_0,hipsparseDgthrz_rank_1
#endif

  end interface
  
  interface hipsparseCgthrz
#ifdef USE_CUDA_NAMES
    function hipsparseCgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseCgthrz")
#else
    function hipsparseCgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCgthrz_rank_0,hipsparseCgthrz_rank_1
#endif

  end interface
  
  interface hipsparseZgthrz
#ifdef USE_CUDA_NAMES
    function hipsparseZgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseZgthrz")
#else
    function hipsparseZgthrz_orig(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZgthrz_rank_0,hipsparseZgthrz_rank_1
#endif

  end interface
  
  interface hipsparseSroti
#ifdef USE_CUDA_NAMES
    function hipsparseSroti_orig(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="cusparseSroti")
#else
    function hipsparseSroti_orig(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseSroti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSroti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSroti_rank_0,hipsparseSroti_rank_1
#endif

  end interface
  
  interface hipsparseDroti
#ifdef USE_CUDA_NAMES
    function hipsparseDroti_orig(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="cusparseDroti")
#else
    function hipsparseDroti_orig(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseDroti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDroti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDroti_rank_0,hipsparseDroti_rank_1
#endif

  end interface
  
  interface hipsparseSsctr
#ifdef USE_CUDA_NAMES
    function hipsparseSsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseSsctr")
#else
    function hipsparseSsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseSsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSsctr_rank_0,hipsparseSsctr_rank_1
#endif

  end interface
  
  interface hipsparseDsctr
#ifdef USE_CUDA_NAMES
    function hipsparseDsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseDsctr")
#else
    function hipsparseDsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseDsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDsctr_rank_0,hipsparseDsctr_rank_1
#endif

  end interface
  
  interface hipsparseCsctr
#ifdef USE_CUDA_NAMES
    function hipsparseCsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseCsctr")
#else
    function hipsparseCsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseCsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCsctr_rank_0,hipsparseCsctr_rank_1
#endif

  end interface
  
  interface hipsparseZsctr
#ifdef USE_CUDA_NAMES
    function hipsparseZsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseZsctr")
#else
    function hipsparseZsctr_orig(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseZsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZsctr_rank_0,hipsparseZsctr_rank_1
#endif

  end interface
  
  interface hipsparseScsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseScsrmv")
#else
    function hipsparseScsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseScsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrmv_rank_0,hipsparseScsrmv_rank_1
#endif

  end interface
  
  interface hipsparseDcsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseDcsrmv")
#else
    function hipsparseDcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseDcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrmv_rank_0,hipsparseDcsrmv_rank_1
#endif

  end interface
  
  interface hipsparseCcsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseCcsrmv")
#else
    function hipsparseCcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseCcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrmv_rank_0,hipsparseCcsrmv_rank_1
#endif

  end interface
  
  interface hipsparseZcsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseZcsrmv")
#else
    function hipsparseZcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseZcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrmv_rank_0,hipsparseZcsrmv_rank_1
#endif

  end interface
  !>  Description: Solution of triangular linear system op(A)  x = alpha  f,
  !> where A is a sparse matrix in CSR storage format, x and f are dense vectors. 
  interface hipsparseXcsrsv2_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsv2_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXcsrsv2_zeroPivot")
#else
    function hipsparseXcsrsv2_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXcsrsv2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsv2_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseScsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrsv2_bufferSize")
#else
    function hipsparseScsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsv2_bufferSize_rank_0,hipsparseScsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrsv2_bufferSize")
#else
    function hipsparseDcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsv2_bufferSize_rank_0,hipsparseDcsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrsv2_bufferSize")
#else
    function hipsparseCcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsv2_bufferSize_rank_0,hipsparseCcsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrsv2_bufferSize")
#else
    function hipsparseZcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsv2_bufferSize_rank_0,hipsparseZcsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseScsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsrsv2_bufferSizeExt")
#else
    function hipsparseScsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsv2_bufferSizeExt_rank_0,hipsparseScsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsrsv2_bufferSizeExt")
#else
    function hipsparseDcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsv2_bufferSizeExt_rank_0,hipsparseDcsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsrsv2_bufferSizeExt")
#else
    function hipsparseCcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsv2_bufferSizeExt_rank_0,hipsparseCcsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsrsv2_bufferSizeExt")
#else
    function hipsparseZcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsv2_bufferSizeExt_rank_0,hipsparseZcsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseScsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsv2_analysis")
#else
    function hipsparseScsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsv2_analysis_rank_0,hipsparseScsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsv2_analysis")
#else
    function hipsparseDcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsv2_analysis_rank_0,hipsparseDcsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsv2_analysis")
#else
    function hipsparseCcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsv2_analysis_rank_0,hipsparseCcsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsv2_analysis")
#else
    function hipsparseZcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsv2_analysis_rank_0,hipsparseZcsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseScsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseScsrsv2_solve")
#else
    function hipsparseScsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseScsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsv2_solve_rank_0,hipsparseScsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseDcsrsv2_solve")
#else
    function hipsparseDcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsv2_solve_rank_0,hipsparseDcsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseCcsrsv2_solve")
#else
    function hipsparseCcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsv2_solve_rank_0,hipsparseCcsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseZcsrsv2_solve")
#else
    function hipsparseZcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsv2_solve_rank_0,hipsparseZcsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseShybmv
#ifdef USE_CUDA_NAMES
    function hipsparseShybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseShybmv")
#else
    function hipsparseShybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseShybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShybmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseShybmv_rank_0,hipsparseShybmv_rank_1
#endif

  end interface
  
  interface hipsparseDhybmv
#ifdef USE_CUDA_NAMES
    function hipsparseDhybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseDhybmv")
#else
    function hipsparseDhybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseDhybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhybmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDhybmv_rank_0,hipsparseDhybmv_rank_1
#endif

  end interface
  
  interface hipsparseChybmv
#ifdef USE_CUDA_NAMES
    function hipsparseChybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseChybmv")
#else
    function hipsparseChybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseChybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChybmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseChybmv_rank_0,hipsparseChybmv_rank_1
#endif

  end interface
  
  interface hipsparseZhybmv
#ifdef USE_CUDA_NAMES
    function hipsparseZhybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseZhybmv")
#else
    function hipsparseZhybmv_orig(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseZhybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhybmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZhybmv_rank_0,hipsparseZhybmv_rank_1
#endif

  end interface
  !>  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !> where A is a sparse matrix in BSR storage format, x and y are dense vectors. 
  interface hipsparseSbsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseSbsrmv")
#else
    function hipsparseSbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseSbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrmv_rank_0,hipsparseSbsrmv_rank_1
#endif

  end interface
  
  interface hipsparseDbsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseDbsrmv")
#else
    function hipsparseDbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseDbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrmv_rank_0,hipsparseDbsrmv_rank_1
#endif

  end interface
  
  interface hipsparseCbsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseCbsrmv")
#else
    function hipsparseCbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseCbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrmv_rank_0,hipsparseCbsrmv_rank_1
#endif

  end interface
  
  interface hipsparseZbsrmv
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseZbsrmv")
#else
    function hipsparseZbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseZbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrmv_rank_0,hipsparseZbsrmv_rank_1
#endif

  end interface
  !>  Description: Solution of triangular linear system op(A)  x = alpha  f,
  !> where A is a sparse matrix in BSR storage format, x and f are dense vectors. 
  interface hipsparseXbsrsv2_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXbsrsv2_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXbsrsv2_zeroPivot")
#else
    function hipsparseXbsrsv2_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXbsrsv2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXbsrsv2_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseSbsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseSbsrsv2_bufferSize")
#else
    function hipsparseSbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseSbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrsv2_bufferSize_rank_0,hipsparseSbsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDbsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDbsrsv2_bufferSize")
#else
    function hipsparseDbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrsv2_bufferSize_rank_0,hipsparseDbsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCbsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCbsrsv2_bufferSize")
#else
    function hipsparseCbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrsv2_bufferSize_rank_0,hipsparseCbsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZbsrsv2_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZbsrsv2_bufferSize")
#else
    function hipsparseZbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrsv2_bufferSize_rank_0,hipsparseZbsrsv2_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSbsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseSbsrsv2_bufferSizeExt")
#else
    function hipsparseSbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseSbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrsv2_bufferSizeExt_rank_0,hipsparseSbsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDbsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseDbsrsv2_bufferSizeExt")
#else
    function hipsparseDbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseDbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrsv2_bufferSizeExt_rank_0,hipsparseDbsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCbsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseCbsrsv2_bufferSizeExt")
#else
    function hipsparseCbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseCbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrsv2_bufferSizeExt_rank_0,hipsparseCbsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZbsrsv2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseZbsrsv2_bufferSizeExt")
#else
    function hipsparseZbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseZbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrsv2_bufferSizeExt_rank_0,hipsparseZbsrsv2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseSbsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsrsv2_analysis")
#else
    function hipsparseSbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrsv2_analysis_rank_0,hipsparseSbsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDbsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsrsv2_analysis")
#else
    function hipsparseDbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrsv2_analysis_rank_0,hipsparseDbsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCbsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsrsv2_analysis")
#else
    function hipsparseCbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrsv2_analysis_rank_0,hipsparseCbsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZbsrsv2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsrsv2_analysis")
#else
    function hipsparseZbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrsv2_analysis_rank_0,hipsparseZbsrsv2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseSbsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseSbsrsv2_solve")
#else
    function hipsparseSbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseSbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrsv2_solve_rank_0,hipsparseSbsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseDbsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseDbsrsv2_solve")
#else
    function hipsparseDbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseDbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrsv2_solve_rank_0,hipsparseDbsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseCbsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseCbsrsv2_solve")
#else
    function hipsparseCbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseCbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrsv2_solve_rank_0,hipsparseCbsrsv2_solve_rank_1
#endif

  end interface
  
  interface hipsparseZbsrsv2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseZbsrsv2_solve")
#else
    function hipsparseZbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseZbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_solve_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrsv2_solve_rank_0,hipsparseZbsrsv2_solve_rank_1
#endif

  end interface
  !>  Description: Matrix-matrix multiplication C = alpha  op(A)  B + beta  C,
  !> where A is a sparse matrix in BSR storage format, B and C are dense matrices. 
  interface hipsparseSbsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseSbsrmm")
#else
    function hipsparseSbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseSbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrmm_full_rank,hipsparseSbsrmm_rank_0,hipsparseSbsrmm_rank_1
#endif

  end interface
  
  interface hipsparseDbsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseDbsrmm")
#else
    function hipsparseDbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseDbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrmm_full_rank,hipsparseDbsrmm_rank_0,hipsparseDbsrmm_rank_1
#endif

  end interface
  
  interface hipsparseCbsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseCbsrmm")
#else
    function hipsparseCbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseCbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrmm_full_rank,hipsparseCbsrmm_rank_0,hipsparseCbsrmm_rank_1
#endif

  end interface
  
  interface hipsparseZbsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseZbsrmm")
#else
    function hipsparseZbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseZbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrmm_full_rank,hipsparseZbsrmm_rank_0,hipsparseZbsrmm_rank_1
#endif

  end interface
  
  interface hipsparseScsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseScsrmm")
#else
    function hipsparseScsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrmm_full_rank,hipsparseScsrmm_rank_0,hipsparseScsrmm_rank_1
#endif

  end interface
  
  interface hipsparseDcsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseDcsrmm")
#else
    function hipsparseDcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrmm_full_rank,hipsparseDcsrmm_rank_0,hipsparseDcsrmm_rank_1
#endif

  end interface
  
  interface hipsparseCcsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseCcsrmm")
#else
    function hipsparseCcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrmm_full_rank,hipsparseCcsrmm_rank_0,hipsparseCcsrmm_rank_1
#endif

  end interface
  
  interface hipsparseZcsrmm
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseZcsrmm")
#else
    function hipsparseZcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrmm_full_rank,hipsparseZcsrmm_rank_0,hipsparseZcsrmm_rank_1
#endif

  end interface
  
  interface hipsparseScsrmm2
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseScsrmm2")
#else
    function hipsparseScsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm2_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrmm2_full_rank,hipsparseScsrmm2_rank_0,hipsparseScsrmm2_rank_1
#endif

  end interface
  
  interface hipsparseDcsrmm2
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseDcsrmm2")
#else
    function hipsparseDcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm2_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrmm2_full_rank,hipsparseDcsrmm2_rank_0,hipsparseDcsrmm2_rank_1
#endif

  end interface
  
  interface hipsparseCcsrmm2
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseCcsrmm2")
#else
    function hipsparseCcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm2_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrmm2_full_rank,hipsparseCcsrmm2_rank_0,hipsparseCcsrmm2_rank_1
#endif

  end interface
  
  interface hipsparseZcsrmm2
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseZcsrmm2")
#else
    function hipsparseZcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm2_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrmm2_full_rank,hipsparseZcsrmm2_rank_0,hipsparseZcsrmm2_rank_1
#endif

  end interface
  !>  Description: Solution of triangular linear system op(A)  op(X) = alpha  op(B),
  !> where A is a sparse matrix in CSR storage format, X and B are dense matrices. 
  interface hipsparseXcsrsm2_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsm2_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXcsrsm2_zeroPivot")
#else
    function hipsparseXcsrsm2_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXcsrsm2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsm2_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseScsrsm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseScsrsm2_bufferSizeExt")
#else
    function hipsparseScsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseScsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsm2_bufferSizeExt_full_rank,hipsparseScsrsm2_bufferSizeExt_rank_0,hipsparseScsrsm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseDcsrsm2_bufferSizeExt")
#else
    function hipsparseDcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseDcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsm2_bufferSizeExt_full_rank,hipsparseDcsrsm2_bufferSizeExt_rank_0,hipsparseDcsrsm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseCcsrsm2_bufferSizeExt")
#else
    function hipsparseCcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseCcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsm2_bufferSizeExt_full_rank,hipsparseCcsrsm2_bufferSizeExt_rank_0,hipsparseCcsrsm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseZcsrsm2_bufferSizeExt")
#else
    function hipsparseZcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseZcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsm2_bufferSizeExt_full_rank,hipsparseZcsrsm2_bufferSizeExt_rank_0,hipsparseZcsrsm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseScsrsm2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsm2_analysis")
#else
    function hipsparseScsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsm2_analysis_full_rank,hipsparseScsrsm2_analysis_rank_0,hipsparseScsrsm2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsm2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsm2_analysis")
#else
    function hipsparseDcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsm2_analysis_full_rank,hipsparseDcsrsm2_analysis_rank_0,hipsparseDcsrsm2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsm2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsm2_analysis")
#else
    function hipsparseCcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsm2_analysis_full_rank,hipsparseCcsrsm2_analysis_rank_0,hipsparseCcsrsm2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsm2_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsm2_analysis")
#else
    function hipsparseZcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsm2_analysis_full_rank,hipsparseZcsrsm2_analysis_rank_0,hipsparseZcsrsm2_analysis_rank_1
#endif

  end interface
  
  interface hipsparseScsrsm2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsm2_solve")
#else
    function hipsparseScsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_solve_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrsm2_solve_full_rank,hipsparseScsrsm2_solve_rank_0,hipsparseScsrsm2_solve_rank_1
#endif

  end interface
  
  interface hipsparseDcsrsm2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsm2_solve")
#else
    function hipsparseDcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_solve_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrsm2_solve_full_rank,hipsparseDcsrsm2_solve_rank_0,hipsparseDcsrsm2_solve_rank_1
#endif

  end interface
  
  interface hipsparseCcsrsm2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsm2_solve")
#else
    function hipsparseCcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_solve_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrsm2_solve_full_rank,hipsparseCcsrsm2_solve_rank_0,hipsparseCcsrsm2_solve_rank_1
#endif

  end interface
  
  interface hipsparseZcsrsm2_solve
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsm2_solve")
#else
    function hipsparseZcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_solve_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrsm2_solve_full_rank,hipsparseZcsrsm2_solve_rank_0,hipsparseZcsrsm2_solve_rank_1
#endif

  end interface
  
  interface hipsparseSgemmi
#ifdef USE_CUDA_NAMES
    function hipsparseSgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseSgemmi")
#else
    function hipsparseSgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseSgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgemmi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSgemmi_full_rank,hipsparseSgemmi_rank_0,hipsparseSgemmi_rank_1
#endif

  end interface
  
  interface hipsparseDgemmi
#ifdef USE_CUDA_NAMES
    function hipsparseDgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseDgemmi")
#else
    function hipsparseDgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseDgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgemmi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDgemmi_full_rank,hipsparseDgemmi_rank_0,hipsparseDgemmi_rank_1
#endif

  end interface
  
  interface hipsparseCgemmi
#ifdef USE_CUDA_NAMES
    function hipsparseCgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseCgemmi")
#else
    function hipsparseCgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseCgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgemmi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCgemmi_full_rank,hipsparseCgemmi_rank_0,hipsparseCgemmi_rank_1
#endif

  end interface
  
  interface hipsparseZgemmi
#ifdef USE_CUDA_NAMES
    function hipsparseZgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseZgemmi")
#else
    function hipsparseZgemmi_orig(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseZgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgemmi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZgemmi_full_rank,hipsparseZgemmi_rank_0,hipsparseZgemmi_rank_1
#endif

  end interface
  
  interface hipsparseXcsrgeamNnz
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgeamNnz_orig(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="cusparseXcsrgeamNnz")
#else
    function hipsparseXcsrgeamNnz_orig(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgeamNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeamNnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrgeamNnz_rank_0,hipsparseXcsrgeamNnz_rank_1
#endif

  end interface
  
  interface hipsparseScsrgeam
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseScsrgeam")
#else
    function hipsparseScsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgeam_rank_0,hipsparseScsrgeam_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgeam
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDcsrgeam")
#else
    function hipsparseDcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgeam_rank_0,hipsparseDcsrgeam_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgeam
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCcsrgeam")
#else
    function hipsparseCcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgeam_rank_0,hipsparseCcsrgeam_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgeam
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZcsrgeam")
#else
    function hipsparseZcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgeam_rank_0,hipsparseZcsrgeam_rank_1
#endif

  end interface
  
  interface hipsparseScsrgeam2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseScsrgeam2_bufferSizeExt")
#else
    function hipsparseScsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseScsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgeam2_bufferSizeExt_rank_0,hipsparseScsrgeam2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgeam2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseDcsrgeam2_bufferSizeExt")
#else
    function hipsparseDcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgeam2_bufferSizeExt_rank_0,hipsparseDcsrgeam2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgeam2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseCcsrgeam2_bufferSizeExt")
#else
    function hipsparseCcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgeam2_bufferSizeExt_rank_0,hipsparseCcsrgeam2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgeam2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseZcsrgeam2_bufferSizeExt")
#else
    function hipsparseZcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgeam2_bufferSizeExt_rank_0,hipsparseZcsrgeam2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseXcsrgeam2Nnz
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgeam2Nnz_orig(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace) bind(c, name="cusparseXcsrgeam2Nnz")
#else
    function hipsparseXcsrgeam2Nnz_orig(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace) bind(c, name="hipsparseXcsrgeam2Nnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeam2Nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: workspace
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrgeam2Nnz_rank_0,hipsparseXcsrgeam2Nnz_rank_1
#endif

  end interface
  
  interface hipsparseScsrgeam2
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseScsrgeam2")
#else
    function hipsparseScsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseScsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgeam2_rank_0,hipsparseScsrgeam2_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgeam2
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseDcsrgeam2")
#else
    function hipsparseDcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseDcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgeam2_rank_0,hipsparseDcsrgeam2_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgeam2
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseCcsrgeam2")
#else
    function hipsparseCcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseCcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgeam2_rank_0,hipsparseCcsrgeam2_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgeam2
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseZcsrgeam2")
#else
    function hipsparseZcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseZcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgeam2_rank_0,hipsparseZcsrgeam2_rank_1
#endif

  end interface
  
  interface hipsparseXcsrgemmNnz
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgemmNnz_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="cusparseXcsrgemmNnz")
#else
    function hipsparseXcsrgemmNnz_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgemmNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemmNnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrgemmNnz_rank_0,hipsparseXcsrgemmNnz_rank_1
#endif

  end interface
  
  interface hipsparseScsrgemm
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseScsrgemm")
#else
    function hipsparseScsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgemm_rank_0,hipsparseScsrgemm_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgemm
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDcsrgemm")
#else
    function hipsparseDcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgemm_rank_0,hipsparseDcsrgemm_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgemm
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCcsrgemm")
#else
    function hipsparseCcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgemm_rank_0,hipsparseCcsrgemm_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgemm
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZcsrgemm")
#else
    function hipsparseZcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgemm_rank_0,hipsparseZcsrgemm_rank_1
#endif

  end interface
  
  interface hipsparseScsrgemm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrgemm2_bufferSizeExt")
#else
    function hipsparseScsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgemm2_bufferSizeExt_rank_0,hipsparseScsrgemm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgemm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrgemm2_bufferSizeExt")
#else
    function hipsparseDcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgemm2_bufferSizeExt_rank_0,hipsparseDcsrgemm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgemm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrgemm2_bufferSizeExt")
#else
    function hipsparseCcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgemm2_bufferSizeExt_rank_0,hipsparseCcsrgemm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgemm2_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrgemm2_bufferSizeExt")
#else
    function hipsparseZcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgemm2_bufferSizeExt_rank_0,hipsparseZcsrgemm2_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseXcsrgemm2Nnz
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgemm2Nnz_orig(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer) bind(c, name="cusparseXcsrgemm2Nnz")
#else
    function hipsparseXcsrgemm2Nnz_orig(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer) bind(c, name="hipsparseXcsrgemm2Nnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemm2Nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrgemm2Nnz_rank_0,hipsparseXcsrgemm2Nnz_rank_1
#endif

  end interface
  
  interface hipsparseScsrgemm2
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseScsrgemm2")
#else
    function hipsparseScsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseScsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrgemm2_rank_0,hipsparseScsrgemm2_rank_1
#endif

  end interface
  
  interface hipsparseDcsrgemm2
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseDcsrgemm2")
#else
    function hipsparseDcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseDcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrgemm2_rank_0,hipsparseDcsrgemm2_rank_1
#endif

  end interface
  
  interface hipsparseCcsrgemm2
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseCcsrgemm2")
#else
    function hipsparseCcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseCcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrgemm2_rank_0,hipsparseCcsrgemm2_rank_1
#endif

  end interface
  
  interface hipsparseZcsrgemm2
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseZcsrgemm2")
#else
    function hipsparseZcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseZcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrgemm2_rank_0,hipsparseZcsrgemm2_rank_1
#endif

  end interface
  !>  Description: Compute the incomplete-LU factorization with 0 fill-in (ILU0)
  !>    of the matrix A stored in BSR format. 
  interface hipsparseXbsrilu02_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXbsrilu02_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXbsrilu02_zeroPivot")
#else
    function hipsparseXbsrilu02_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXbsrilu02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXbsrilu02_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseSbsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseSbsrilu02_numericBoost")
#else
    function hipsparseSbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseSbsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      real(c_float) :: boost_val
    end function


  end interface
  
  interface hipsparseDbsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseDbsrilu02_numericBoost")
#else
    function hipsparseDbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseDbsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      real(c_double) :: boost_val
    end function


  end interface
  
  interface hipsparseCbsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseCbsrilu02_numericBoost")
#else
    function hipsparseCbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseCbsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      complex(c_float_complex) :: boost_val
    end function


  end interface
  
  interface hipsparseZbsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseZbsrilu02_numericBoost")
#else
    function hipsparseZbsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseZbsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      complex(c_double_complex) :: boost_val
    end function


  end interface
  
  interface hipsparseSbsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseSbsrilu02_bufferSize")
#else
    function hipsparseSbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseSbsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrilu02_bufferSize_rank_0,hipsparseSbsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDbsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDbsrilu02_bufferSize")
#else
    function hipsparseDbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDbsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrilu02_bufferSize_rank_0,hipsparseDbsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCbsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCbsrilu02_bufferSize")
#else
    function hipsparseCbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCbsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrilu02_bufferSize_rank_0,hipsparseCbsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZbsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZbsrilu02_bufferSize")
#else
    function hipsparseZbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZbsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrilu02_bufferSize_rank_0,hipsparseZbsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSbsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsrilu02_analysis")
#else
    function hipsparseSbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrilu02_analysis_rank_0,hipsparseSbsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDbsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsrilu02_analysis")
#else
    function hipsparseDbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrilu02_analysis_rank_0,hipsparseDbsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCbsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsrilu02_analysis")
#else
    function hipsparseCbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrilu02_analysis_rank_0,hipsparseCbsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZbsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsrilu02_analysis")
#else
    function hipsparseZbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrilu02_analysis_rank_0,hipsparseZbsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseSbsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsrilu02")
#else
    function hipsparseSbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA_valM
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsrilu02_rank_0,hipsparseSbsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseDbsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsrilu02")
#else
    function hipsparseDbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA_valM
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsrilu02_rank_0,hipsparseDbsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseCbsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsrilu02")
#else
    function hipsparseCbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA_valM
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsrilu02_rank_0,hipsparseCbsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseZbsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsrilu02")
#else
    function hipsparseZbsrilu02_orig(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA_valM
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsrilu02_rank_0,hipsparseZbsrilu02_rank_1
#endif

  end interface
  !>  Description: Compute the incomplete-LU factorization with 0 fill-in (ILU0)
  !> of the matrix A stored in CSR format. 
  interface hipsparseXcsrilu02_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrilu02_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXcsrilu02_zeroPivot")
#else
    function hipsparseXcsrilu02_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXcsrilu02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrilu02_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseScsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseScsrilu02_numericBoost")
#else
    function hipsparseScsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseScsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      real(c_float) :: boost_val
    end function


  end interface
  
  interface hipsparseDcsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseDcsrilu02_numericBoost")
#else
    function hipsparseDcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseDcsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      real(c_double) :: boost_val
    end function


  end interface
  
  interface hipsparseCcsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseCcsrilu02_numericBoost")
#else
    function hipsparseCcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseCcsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      complex(c_float_complex) :: boost_val
    end function


  end interface
  
  interface hipsparseZcsrilu02_numericBoost
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="cusparseZcsrilu02_numericBoost")
#else
    function hipsparseZcsrilu02_numericBoost_orig(handle,myInfo,enable_boost,tol,boost_val) bind(c, name="hipsparseZcsrilu02_numericBoost")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_numericBoost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: tol
      complex(c_double_complex) :: boost_val
    end function


  end interface
  
  interface hipsparseScsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrilu02_bufferSize")
#else
    function hipsparseScsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrilu02_bufferSize_rank_0,hipsparseScsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDcsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrilu02_bufferSize")
#else
    function hipsparseDcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrilu02_bufferSize_rank_0,hipsparseDcsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCcsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrilu02_bufferSize")
#else
    function hipsparseCcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrilu02_bufferSize_rank_0,hipsparseCcsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZcsrilu02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrilu02_bufferSize")
#else
    function hipsparseZcsrilu02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrilu02_bufferSize_rank_0,hipsparseZcsrilu02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseScsrilu02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsrilu02_bufferSizeExt")
#else
    function hipsparseScsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrilu02_bufferSizeExt_rank_0,hipsparseScsrilu02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsrilu02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsrilu02_bufferSizeExt")
#else
    function hipsparseDcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrilu02_bufferSizeExt_rank_0,hipsparseDcsrilu02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsrilu02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsrilu02_bufferSizeExt")
#else
    function hipsparseCcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrilu02_bufferSizeExt_rank_0,hipsparseCcsrilu02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsrilu02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsrilu02_bufferSizeExt")
#else
    function hipsparseZcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrilu02_bufferSizeExt_rank_0,hipsparseZcsrilu02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseScsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrilu02_analysis")
#else
    function hipsparseScsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrilu02_analysis_rank_0,hipsparseScsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDcsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrilu02_analysis")
#else
    function hipsparseDcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrilu02_analysis_rank_0,hipsparseDcsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCcsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrilu02_analysis")
#else
    function hipsparseCcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrilu02_analysis_rank_0,hipsparseCcsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZcsrilu02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrilu02_analysis")
#else
    function hipsparseZcsrilu02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrilu02_analysis_rank_0,hipsparseZcsrilu02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseScsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrilu02")
#else
    function hipsparseScsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsrilu02_rank_0,hipsparseScsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseDcsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrilu02")
#else
    function hipsparseDcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsrilu02_rank_0,hipsparseDcsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseCcsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrilu02")
#else
    function hipsparseCcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsrilu02_rank_0,hipsparseCcsrilu02_rank_1
#endif

  end interface
  
  interface hipsparseZcsrilu02
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrilu02")
#else
    function hipsparseZcsrilu02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsrilu02_rank_0,hipsparseZcsrilu02_rank_1
#endif

  end interface
  !>  Description: Compute the incomplete Cholesky factorization with 0 fill-in (IC0)
  !> of the matrix A stored in BSR format. 
  interface hipsparseXbsric02_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXbsric02_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXbsric02_zeroPivot")
#else
    function hipsparseXbsric02_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXbsric02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXbsric02_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseSbsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseSbsric02_bufferSize")
#else
    function hipsparseSbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseSbsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsric02_bufferSize_rank_0,hipsparseSbsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDbsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDbsric02_bufferSize")
#else
    function hipsparseDbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDbsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsric02_bufferSize_rank_0,hipsparseDbsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCbsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCbsric02_bufferSize")
#else
    function hipsparseCbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCbsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsric02_bufferSize_rank_0,hipsparseCbsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZbsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZbsric02_bufferSize")
#else
    function hipsparseZbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZbsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsric02_bufferSize_rank_0,hipsparseZbsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSbsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseSbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsric02_analysis")
#else
    function hipsparseSbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsric02_analysis_rank_0,hipsparseSbsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDbsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsric02_analysis")
#else
    function hipsparseDbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsric02_analysis_rank_0,hipsparseDbsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCbsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsric02_analysis")
#else
    function hipsparseCbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsric02_analysis_rank_0,hipsparseCbsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZbsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsric02_analysis")
#else
    function hipsparseZbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsric02_analysis_rank_0,hipsparseZbsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseSbsric02
#ifdef USE_CUDA_NAMES
    function hipsparseSbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsric02")
#else
    function hipsparseSbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsric02_rank_0,hipsparseSbsric02_rank_1
#endif

  end interface
  
  interface hipsparseDbsric02
#ifdef USE_CUDA_NAMES
    function hipsparseDbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsric02")
#else
    function hipsparseDbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsric02_rank_0,hipsparseDbsric02_rank_1
#endif

  end interface
  
  interface hipsparseCbsric02
#ifdef USE_CUDA_NAMES
    function hipsparseCbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsric02")
#else
    function hipsparseCbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsric02_rank_0,hipsparseCbsric02_rank_1
#endif

  end interface
  
  interface hipsparseZbsric02
#ifdef USE_CUDA_NAMES
    function hipsparseZbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsric02")
#else
    function hipsparseZbsric02_orig(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsric02_rank_0,hipsparseZbsric02_rank_1
#endif

  end interface
  !>  Description: Compute the incomplete Cholesky factorization with 0 fill-in (IC0)
  !> of the matrix A stored in CSR format. 
  interface hipsparseXcsric02_zeroPivot
#ifdef USE_CUDA_NAMES
    function hipsparseXcsric02_zeroPivot_orig(handle,myInfo,position) bind(c, name="cusparseXcsric02_zeroPivot")
#else
    function hipsparseXcsric02_zeroPivot_orig(handle,myInfo,position) bind(c, name="hipsparseXcsric02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsric02_zeroPivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  
  interface hipsparseScsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsric02_bufferSize")
#else
    function hipsparseScsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsric02_bufferSize_rank_0,hipsparseScsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDcsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsric02_bufferSize")
#else
    function hipsparseDcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsric02_bufferSize_rank_0,hipsparseDcsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseCcsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsric02_bufferSize")
#else
    function hipsparseCcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsric02_bufferSize_rank_0,hipsparseCcsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseZcsric02_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsric02_bufferSize")
#else
    function hipsparseZcsric02_bufferSize_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsric02_bufferSize_rank_0,hipsparseZcsric02_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseScsric02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsric02_bufferSizeExt")
#else
    function hipsparseScsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsric02_bufferSizeExt_rank_0,hipsparseScsric02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDcsric02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsric02_bufferSizeExt")
#else
    function hipsparseDcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsric02_bufferSizeExt_rank_0,hipsparseDcsric02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseCcsric02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsric02_bufferSizeExt")
#else
    function hipsparseCcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsric02_bufferSizeExt_rank_0,hipsparseCcsric02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseZcsric02_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsric02_bufferSizeExt")
#else
    function hipsparseZcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsric02_bufferSizeExt_rank_0,hipsparseZcsric02_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseScsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsric02_analysis")
#else
    function hipsparseScsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsric02_analysis_rank_0,hipsparseScsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseDcsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsric02_analysis")
#else
    function hipsparseDcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsric02_analysis_rank_0,hipsparseDcsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseCcsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsric02_analysis")
#else
    function hipsparseCcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsric02_analysis_rank_0,hipsparseCcsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseZcsric02_analysis
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsric02_analysis")
#else
    function hipsparseZcsric02_analysis_orig(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsric02_analysis_rank_0,hipsparseZcsric02_analysis_rank_1
#endif

  end interface
  
  interface hipsparseScsric02
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsric02")
#else
    function hipsparseScsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsric02_rank_0,hipsparseScsric02_rank_1
#endif

  end interface
  
  interface hipsparseDcsric02
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsric02")
#else
    function hipsparseDcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsric02_rank_0,hipsparseDcsric02_rank_1
#endif

  end interface
  
  interface hipsparseCcsric02
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsric02")
#else
    function hipsparseCcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsric02_rank_0,hipsparseCcsric02_rank_1
#endif

  end interface
  
  interface hipsparseZcsric02
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsric02")
#else
    function hipsparseZcsric02_orig(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsric02_rank_0,hipsparseZcsric02_rank_1
#endif

  end interface
  !>  Description: 
  !> This function computes the number of nonzero elements per row or column and the total number of nonzero elements in a dense matrix. 
  interface hipsparseSnnz
#ifdef USE_CUDA_NAMES
    function hipsparseSnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseSnnz")
#else
    function hipsparseSnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseSnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSnnz_full_rank,hipsparseSnnz_rank_0,hipsparseSnnz_rank_1
#endif

  end interface
  
  interface hipsparseDnnz
#ifdef USE_CUDA_NAMES
    function hipsparseDnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseDnnz")
#else
    function hipsparseDnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseDnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDnnz_full_rank,hipsparseDnnz_rank_0,hipsparseDnnz_rank_1
#endif

  end interface
  
  interface hipsparseCnnz
#ifdef USE_CUDA_NAMES
    function hipsparseCnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseCnnz")
#else
    function hipsparseCnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseCnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCnnz_full_rank,hipsparseCnnz_rank_0,hipsparseCnnz_rank_1
#endif

  end interface
  
  interface hipsparseZnnz
#ifdef USE_CUDA_NAMES
    function hipsparseZnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseZnnz")
#else
    function hipsparseZnnz_orig(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseZnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZnnz_full_rank,hipsparseZnnz_rank_0,hipsparseZnnz_rank_1
#endif

  end interface
  !>  Description: 
  !> This function converts the matrix A in dense format into a sparse matrix in CSR format. 
  interface hipsparseSdense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseSdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseSdense2csr")
#else
    function hipsparseSdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseSdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSdense2csr_full_rank,hipsparseSdense2csr_rank_0,hipsparseSdense2csr_rank_1
#endif

  end interface
  
  interface hipsparseDdense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseDdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseDdense2csr")
#else
    function hipsparseDdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseDdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDdense2csr_full_rank,hipsparseDdense2csr_rank_0,hipsparseDdense2csr_rank_1
#endif

  end interface
  
  interface hipsparseCdense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseCdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseCdense2csr")
#else
    function hipsparseCdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseCdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCdense2csr_full_rank,hipsparseCdense2csr_rank_0,hipsparseCdense2csr_rank_1
#endif

  end interface
  
  interface hipsparseZdense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseZdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseZdense2csr")
#else
    function hipsparseZdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseZdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZdense2csr_full_rank,hipsparseZdense2csr_rank_0,hipsparseZdense2csr_rank_1
#endif

  end interface
  !>  Description: 
  !> These functions convert the matrix A in dense format into a sparse matrix in CSR format where entries 
  !> in A that are less than equal to a threshold are removed. 
  interface hipsparseSpruneDense2csr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csr_bufferSize_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="cusparseSpruneDense2csr_bufferSize")
#else
    function hipsparseSpruneDense2csr_bufferSize_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="hipsparseSpruneDense2csr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csr_bufferSize_full_rank,hipsparseSpruneDense2csr_bufferSize_rank_0,hipsparseSpruneDense2csr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csr_bufferSize_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="cusparseDpruneDense2csr_bufferSize")
#else
    function hipsparseDpruneDense2csr_bufferSize_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="hipsparseDpruneDense2csr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csr_bufferSize_full_rank,hipsparseDpruneDense2csr_bufferSize_rank_0,hipsparseDpruneDense2csr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csr_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csr_bufferSizeExt_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="cusparseSpruneDense2csr_bufferSizeExt")
#else
    function hipsparseSpruneDense2csr_bufferSizeExt_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="hipsparseSpruneDense2csr_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csr_bufferSizeExt_full_rank,hipsparseSpruneDense2csr_bufferSizeExt_rank_0,hipsparseSpruneDense2csr_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csr_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csr_bufferSizeExt_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="cusparseDpruneDense2csr_bufferSizeExt")
#else
    function hipsparseDpruneDense2csr_bufferSizeExt_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize) bind(c, name="hipsparseDpruneDense2csr_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csr_bufferSizeExt_full_rank,hipsparseDpruneDense2csr_bufferSizeExt_rank_0,hipsparseDpruneDense2csr_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csrNnz
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csrNnz_orig(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer) bind(c, name="cusparseSpruneDense2csrNnz")
#else
    function hipsparseSpruneDense2csrNnz_orig(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer) bind(c, name="hipsparseSpruneDense2csrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csrNnz_full_rank,hipsparseSpruneDense2csrNnz_rank_0,hipsparseSpruneDense2csrNnz_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csrNnz
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csrNnz_orig(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer) bind(c, name="cusparseDpruneDense2csrNnz")
#else
    function hipsparseDpruneDense2csrNnz_orig(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer) bind(c, name="hipsparseDpruneDense2csrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csrNnz_full_rank,hipsparseDpruneDense2csrNnz_rank_0,hipsparseDpruneDense2csrNnz_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csr_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer) bind(c, name="cusparseSpruneDense2csr")
#else
    function hipsparseSpruneDense2csr_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer) bind(c, name="hipsparseSpruneDense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csr_full_rank,hipsparseSpruneDense2csr_rank_0,hipsparseSpruneDense2csr_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csr
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csr_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer) bind(c, name="cusparseDpruneDense2csr")
#else
    function hipsparseDpruneDense2csr_orig(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer) bind(c, name="hipsparseDpruneDense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csr_full_rank,hipsparseDpruneDense2csr_rank_0,hipsparseDpruneDense2csr_rank_1
#endif

  end interface
  !>  Description: 
  !> These functions convert the matrix A in dense format into a sparse matrix in CSR format where the bottom 
  !> percentage of absolute valued entries from A have been removed. 
  interface hipsparseSpruneDense2csrByPercentage_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="cusparseSpruneDense2csrByPercentage_bufferSize")
#else
    function hipsparseSpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="hipsparseSpruneDense2csrByPercentage_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csrByPercentage_bufferSize_full_rank,hipsparseSpruneDense2csrByPercentage_bufferSize_rank_0,hipsparseSpruneDense2csrByPercentage_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csrByPercentage_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="cusparseDpruneDense2csrByPercentage_bufferSize")
#else
    function hipsparseDpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="hipsparseDpruneDense2csrByPercentage_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csrByPercentage_bufferSize_full_rank,hipsparseDpruneDense2csrByPercentage_bufferSize_rank_0,hipsparseDpruneDense2csrByPercentage_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csrByPercentage_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="cusparseSpruneDense2csrByPercentage_bufferSizeExt")
#else
    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="hipsparseSpruneDense2csrByPercentage_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csrByPercentage_bufferSizeExt_full_rank,hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_0,hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csrByPercentage_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="cusparseDpruneDense2csrByPercentage_bufferSizeExt")
#else
    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize) bind(c, name="hipsparseDpruneDense2csrByPercentage_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csrByPercentage_bufferSizeExt_full_rank,hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_0,hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csrNnzByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csrNnzByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="cusparseSpruneDense2csrNnzByPercentage")
#else
    function hipsparseSpruneDense2csrNnzByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="hipsparseSpruneDense2csrNnzByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnzByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csrNnzByPercentage_full_rank,hipsparseSpruneDense2csrNnzByPercentage_rank_0,hipsparseSpruneDense2csrNnzByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csrNnzByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csrNnzByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="cusparseDpruneDense2csrNnzByPercentage")
#else
    function hipsparseDpruneDense2csrNnzByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="hipsparseDpruneDense2csrNnzByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnzByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csrNnzByPercentage_full_rank,hipsparseDpruneDense2csrNnzByPercentage_rank_0,hipsparseDpruneDense2csrNnzByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseSpruneDense2csrByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneDense2csrByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer) bind(c, name="cusparseSpruneDense2csrByPercentage")
#else
    function hipsparseSpruneDense2csrByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer) bind(c, name="hipsparseSpruneDense2csrByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneDense2csrByPercentage_full_rank,hipsparseSpruneDense2csrByPercentage_rank_0,hipsparseSpruneDense2csrByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseDpruneDense2csrByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneDense2csrByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer) bind(c, name="cusparseDpruneDense2csrByPercentage")
#else
    function hipsparseDpruneDense2csrByPercentage_orig(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer) bind(c, name="hipsparseDpruneDense2csrByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneDense2csrByPercentage_full_rank,hipsparseDpruneDense2csrByPercentage_rank_0,hipsparseDpruneDense2csrByPercentage_rank_1
#endif

  end interface
  !>  Description: 
  !> This function converts the matrix A in dense format into a sparse matrix in CSC format 
  interface hipsparseSdense2csc
#ifdef USE_CUDA_NAMES
    function hipsparseSdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseSdense2csc")
#else
    function hipsparseSdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseSdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSdense2csc_full_rank,hipsparseSdense2csc_rank_0,hipsparseSdense2csc_rank_1
#endif

  end interface
  
  interface hipsparseDdense2csc
#ifdef USE_CUDA_NAMES
    function hipsparseDdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseDdense2csc")
#else
    function hipsparseDdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseDdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDdense2csc_full_rank,hipsparseDdense2csc_rank_0,hipsparseDdense2csc_rank_1
#endif

  end interface
  
  interface hipsparseCdense2csc
#ifdef USE_CUDA_NAMES
    function hipsparseCdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseCdense2csc")
#else
    function hipsparseCdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseCdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCdense2csc_full_rank,hipsparseCdense2csc_rank_0,hipsparseCdense2csc_rank_1
#endif

  end interface
  
  interface hipsparseZdense2csc
#ifdef USE_CUDA_NAMES
    function hipsparseZdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseZdense2csc")
#else
    function hipsparseZdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseZdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZdense2csc_full_rank,hipsparseZdense2csc_rank_0,hipsparseZdense2csc_rank_1
#endif

  end interface
  !>  Description:
  !> This function converts the sparse matrix in CSR format into a dense matrix 
  interface hipsparseScsr2dense
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseScsr2dense")
#else
    function hipsparseScsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseScsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsr2dense_full_rank,hipsparseScsr2dense_rank_0,hipsparseScsr2dense_rank_1
#endif

  end interface
  
  interface hipsparseDcsr2dense
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseDcsr2dense")
#else
    function hipsparseDcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseDcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsr2dense_full_rank,hipsparseDcsr2dense_rank_0,hipsparseDcsr2dense_rank_1
#endif

  end interface
  
  interface hipsparseCcsr2dense
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseCcsr2dense")
#else
    function hipsparseCcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseCcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsr2dense_full_rank,hipsparseCcsr2dense_rank_0,hipsparseCcsr2dense_rank_1
#endif

  end interface
  
  interface hipsparseZcsr2dense
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseZcsr2dense")
#else
    function hipsparseZcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseZcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsr2dense_full_rank,hipsparseZcsr2dense_rank_0,hipsparseZcsr2dense_rank_1
#endif

  end interface
  !>  Description:
  !> This function converts the sparse matrix in CSC format into a dense matrix. 
  interface hipsparseScsc2dense
#ifdef USE_CUDA_NAMES
    function hipsparseScsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseScsc2dense")
#else
    function hipsparseScsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseScsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsc2dense_full_rank,hipsparseScsc2dense_rank_0,hipsparseScsc2dense_rank_1
#endif

  end interface
  
  interface hipsparseDcsc2dense
#ifdef USE_CUDA_NAMES
    function hipsparseDcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseDcsc2dense")
#else
    function hipsparseDcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseDcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsc2dense_full_rank,hipsparseDcsc2dense_rank_0,hipsparseDcsc2dense_rank_1
#endif

  end interface
  
  interface hipsparseCcsc2dense
#ifdef USE_CUDA_NAMES
    function hipsparseCcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseCcsc2dense")
#else
    function hipsparseCcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseCcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsc2dense_full_rank,hipsparseCcsc2dense_rank_0,hipsparseCcsc2dense_rank_1
#endif

  end interface
  
  interface hipsparseZcsc2dense
#ifdef USE_CUDA_NAMES
    function hipsparseZcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseZcsc2dense")
#else
    function hipsparseZcsc2dense_orig(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseZcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsc2dense_full_rank,hipsparseZcsc2dense_rank_0,hipsparseZcsc2dense_rank_1
#endif

  end interface
  !>  Description:
  !> This function computes the number of nonzero block columns per block row and the total number of blocks in the BSR 
  !> matrix where the BSR matrix is formed by converting the input CSR matrix. 
  interface hipsparseXcsr2bsrNnz
#ifdef USE_CUDA_NAMES
    function hipsparseXcsr2bsrNnz_orig(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb) bind(c, name="cusparseXcsr2bsrNnz")
#else
    function hipsparseXcsr2bsrNnz_orig(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb) bind(c, name="hipsparseXcsr2bsrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2bsrNnz_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrNnzb
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsr2bsrNnz_rank_0,hipsparseXcsr2bsrNnz_rank_1
#endif

  end interface
  !>  Description:
  !> This function computes the number of nonzero elements per row and the total number of nonzero elements 
  !> in the compressed version of the input CSR matrix where the matrix is compressed by removing elements 
  !> less than pr equal to the tolerance. 
  interface hipsparseSnnz_compress
#ifdef USE_CUDA_NAMES
    function hipsparseSnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseSnnz_compress")
#else
    function hipsparseSnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseSnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      real(c_float),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSnnz_compress_rank_0,hipsparseSnnz_compress_rank_1
#endif

  end interface
  
  interface hipsparseDnnz_compress
#ifdef USE_CUDA_NAMES
    function hipsparseDnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseDnnz_compress")
#else
    function hipsparseDnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseDnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      real(c_double),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDnnz_compress_rank_0,hipsparseDnnz_compress_rank_1
#endif

  end interface
  
  interface hipsparseCnnz_compress
#ifdef USE_CUDA_NAMES
    function hipsparseCnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseCnnz_compress")
#else
    function hipsparseCnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseCnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      complex(c_float_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCnnz_compress_rank_0,hipsparseCnnz_compress_rank_1
#endif

  end interface
  
  interface hipsparseZnnz_compress
#ifdef USE_CUDA_NAMES
    function hipsparseZnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseZnnz_compress")
#else
    function hipsparseZnnz_compress_orig(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseZnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      complex(c_double_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZnnz_compress_rank_0,hipsparseZnnz_compress_rank_1
#endif

  end interface
  !>  Description: This routine converts a sparse matrix in CSR storage format
  !> to a sparse matrix in COO storage format. 
  interface hipsparseXcsr2coo
#ifdef USE_CUDA_NAMES
    function hipsparseXcsr2coo_orig(handle,csrRowPtr,nnz,m,cooRowInd,idxBase) bind(c, name="cusparseXcsr2coo")
#else
    function hipsparseXcsr2coo_orig(handle,csrRowPtr,nnz,m,cooRowInd,idxBase) bind(c, name="hipsparseXcsr2coo")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2coo_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: csrRowPtr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: cooRowInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsr2coo_rank_0,hipsparseXcsr2coo_rank_1
#endif

  end interface
  
  interface hipsparseScsr2csc
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseScsr2csc")
#else
    function hipsparseScsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseScsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsr2csc_rank_0,hipsparseScsr2csc_rank_1
#endif

  end interface
  
  interface hipsparseDcsr2csc
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseDcsr2csc")
#else
    function hipsparseDcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseDcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsr2csc_rank_0,hipsparseDcsr2csc_rank_1
#endif

  end interface
  
  interface hipsparseCcsr2csc
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseCcsr2csc")
#else
    function hipsparseCcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseCcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsr2csc_rank_0,hipsparseCcsr2csc_rank_1
#endif

  end interface
  
  interface hipsparseZcsr2csc
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseZcsr2csc")
#else
    function hipsparseZcsr2csc_orig(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseZcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsr2csc_rank_0,hipsparseZcsr2csc_rank_1
#endif

  end interface
  
  interface hipsparseScsr2hyb
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseScsr2hyb")
#else
    function hipsparseScsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseScsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsr2hyb_rank_0,hipsparseScsr2hyb_rank_1
#endif

  end interface
  
  interface hipsparseDcsr2hyb
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseDcsr2hyb")
#else
    function hipsparseDcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseDcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsr2hyb_rank_0,hipsparseDcsr2hyb_rank_1
#endif

  end interface
  
  interface hipsparseCcsr2hyb
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseCcsr2hyb")
#else
    function hipsparseCcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseCcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsr2hyb_rank_0,hipsparseCcsr2hyb_rank_1
#endif

  end interface
  
  interface hipsparseZcsr2hyb
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseZcsr2hyb")
#else
    function hipsparseZcsr2hyb_orig(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseZcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsr2hyb_rank_0,hipsparseZcsr2hyb_rank_1
#endif

  end interface
  !>  Description: This routine converts a sparse matrix in CSR storage format
  !> to a sparse matrix in BSR storage format. 
  interface hipsparseScsr2bsr
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseScsr2bsr")
#else
    function hipsparseScsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseScsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsr2bsr_rank_0,hipsparseScsr2bsr_rank_1
#endif

  end interface
  
  interface hipsparseDcsr2bsr
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseDcsr2bsr")
#else
    function hipsparseDcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseDcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsr2bsr_rank_0,hipsparseDcsr2bsr_rank_1
#endif

  end interface
  
  interface hipsparseCcsr2bsr
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseCcsr2bsr")
#else
    function hipsparseCcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseCcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsr2bsr_rank_0,hipsparseCcsr2bsr_rank_1
#endif

  end interface
  
  interface hipsparseZcsr2bsr
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseZcsr2bsr")
#else
    function hipsparseZcsr2bsr_orig(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseZcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsr2bsr_rank_0,hipsparseZcsr2bsr_rank_1
#endif

  end interface
  !>  Description: This routine converts a sparse matrix in BSR storage format
  !> to a sparse matrix in CSR storage format. 
  interface hipsparseSbsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseSbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseSbsr2csr")
#else
    function hipsparseSbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseSbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSbsr2csr_rank_0,hipsparseSbsr2csr_rank_1
#endif

  end interface
  
  interface hipsparseDbsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseDbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDbsr2csr")
#else
    function hipsparseDbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDbsr2csr_rank_0,hipsparseDbsr2csr_rank_1
#endif

  end interface
  
  interface hipsparseCbsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseCbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCbsr2csr")
#else
    function hipsparseCbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCbsr2csr_rank_0,hipsparseCbsr2csr_rank_1
#endif

  end interface
  
  interface hipsparseZbsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseZbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZbsr2csr")
#else
    function hipsparseZbsr2csr_orig(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZbsr2csr_rank_0,hipsparseZbsr2csr_rank_1
#endif

  end interface
  !>  Description: This routine compresses the input CSR matrix by removing elements that 
  !> are less than or equal to the non-negative tolerance 
  interface hipsparseScsr2csr_compress
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseScsr2csr_compress")
#else
    function hipsparseScsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseScsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      real(c_float),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseScsr2csr_compress_rank_0,hipsparseScsr2csr_compress_rank_1
#endif

  end interface
  
  interface hipsparseDcsr2csr_compress
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseDcsr2csr_compress")
#else
    function hipsparseDcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseDcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      real(c_double),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDcsr2csr_compress_rank_0,hipsparseDcsr2csr_compress_rank_1
#endif

  end interface
  
  interface hipsparseCcsr2csr_compress
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseCcsr2csr_compress")
#else
    function hipsparseCcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseCcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      complex(c_float_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCcsr2csr_compress_rank_0,hipsparseCcsr2csr_compress_rank_1
#endif

  end interface
  
  interface hipsparseZcsr2csr_compress
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseZcsr2csr_compress")
#else
    function hipsparseZcsr2csr_compress_orig(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseZcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      complex(c_double_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZcsr2csr_compress_rank_0,hipsparseZcsr2csr_compress_rank_1
#endif

  end interface
  !>  Description: These routines prune the input CSR matrix by removing elements that 
  !>    are less than or equal to the non-negative threshold 
  interface hipsparseSpruneCsr2csr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="cusparseSpruneCsr2csr_bufferSize")
#else
    function hipsparseSpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="hipsparseSpruneCsr2csr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csr_bufferSize_rank_0,hipsparseSpruneCsr2csr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="cusparseDpruneCsr2csr_bufferSize")
#else
    function hipsparseDpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="hipsparseDpruneCsr2csr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csr_bufferSize_rank_0,hipsparseDpruneCsr2csr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csr_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="cusparseSpruneCsr2csr_bufferSizeExt")
#else
    function hipsparseSpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="hipsparseSpruneCsr2csr_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csr_bufferSizeExt_rank_0,hipsparseSpruneCsr2csr_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csr_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="cusparseDpruneCsr2csr_bufferSizeExt")
#else
    function hipsparseDpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize) bind(c, name="hipsparseDpruneCsr2csr_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csr_bufferSizeExt_rank_0,hipsparseDpruneCsr2csr_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csrNnz
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer) bind(c, name="cusparseSpruneCsr2csrNnz")
#else
    function hipsparseSpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer) bind(c, name="hipsparseSpruneCsr2csrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csrNnz_rank_0,hipsparseSpruneCsr2csrNnz_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csrNnz
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer) bind(c, name="cusparseDpruneCsr2csrNnz")
#else
    function hipsparseDpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer) bind(c, name="hipsparseDpruneCsr2csrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csrNnz_rank_0,hipsparseDpruneCsr2csrNnz_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csr_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer) bind(c, name="cusparseSpruneCsr2csr")
#else
    function hipsparseSpruneCsr2csr_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer) bind(c, name="hipsparseSpruneCsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csr_rank_0,hipsparseSpruneCsr2csr_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csr
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csr_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer) bind(c, name="cusparseDpruneCsr2csr")
#else
    function hipsparseDpruneCsr2csr_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer) bind(c, name="hipsparseDpruneCsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csr_rank_0,hipsparseDpruneCsr2csr_rank_1
#endif

  end interface
  !>  Description: These functions convert the matrix A in CSR format into a sparse matrix in CSR format where the bottom 
  !>     percentage of absolute valued entries from A have been removed. 
  interface hipsparseSpruneCsr2csrByPercentage_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="cusparseSpruneCsr2csrByPercentage_bufferSize")
#else
    function hipsparseSpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="hipsparseSpruneCsr2csrByPercentage_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_0,hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csrByPercentage_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="cusparseDpruneCsr2csrByPercentage_bufferSize")
#else
    function hipsparseDpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="hipsparseDpruneCsr2csrByPercentage_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSize_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_0,hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csrByPercentage_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="cusparseSpruneCsr2csrByPercentage_bufferSizeExt")
#else
    function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="hipsparseSpruneCsr2csrByPercentage_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_0,hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csrByPercentage_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="cusparseDpruneCsr2csrByPercentage_bufferSizeExt")
#else
    function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize) bind(c, name="hipsparseDpruneCsr2csrByPercentage_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: bufferSize
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_0,hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csrNnzByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="cusparseSpruneCsr2csrNnzByPercentage")
#else
    function hipsparseSpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="hipsparseSpruneCsr2csrNnzByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnzByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csrNnzByPercentage_rank_0,hipsparseSpruneCsr2csrNnzByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csrNnzByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="cusparseDpruneCsr2csrNnzByPercentage")
#else
    function hipsparseDpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer) bind(c, name="hipsparseDpruneCsr2csrNnzByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnzByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csrNnzByPercentage_rank_0,hipsparseDpruneCsr2csrNnzByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseSpruneCsr2csrByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseSpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer) bind(c, name="cusparseSpruneCsr2csrByPercentage")
#else
    function hipsparseSpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer) bind(c, name="hipsparseSpruneCsr2csrByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseSpruneCsr2csrByPercentage_rank_0,hipsparseSpruneCsr2csrByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseDpruneCsr2csrByPercentage
#ifdef USE_CUDA_NAMES
    function hipsparseDpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer) bind(c, name="cusparseDpruneCsr2csrByPercentage")
#else
    function hipsparseDpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer) bind(c, name="hipsparseDpruneCsr2csrByPercentage")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDpruneCsr2csrByPercentage_rank_0,hipsparseDpruneCsr2csrByPercentage_rank_1
#endif

  end interface
  
  interface hipsparseShyb2csr
#ifdef USE_CUDA_NAMES
    function hipsparseShyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseShyb2csr")
#else
    function hipsparseShyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseShyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseShyb2csr_rank_0,hipsparseShyb2csr_rank_1
#endif

  end interface
  
  interface hipsparseDhyb2csr
#ifdef USE_CUDA_NAMES
    function hipsparseDhyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseDhyb2csr")
#else
    function hipsparseDhyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseDhyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseDhyb2csr_rank_0,hipsparseDhyb2csr_rank_1
#endif

  end interface
  
  interface hipsparseChyb2csr
#ifdef USE_CUDA_NAMES
    function hipsparseChyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseChyb2csr")
#else
    function hipsparseChyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseChyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseChyb2csr_rank_0,hipsparseChyb2csr_rank_1
#endif

  end interface
  
  interface hipsparseZhyb2csr
#ifdef USE_CUDA_NAMES
    function hipsparseZhyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseZhyb2csr")
#else
    function hipsparseZhyb2csr_orig(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseZhyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseZhyb2csr_rank_0,hipsparseZhyb2csr_rank_1
#endif

  end interface
  !>  Description: This routine converts a sparse matrix in COO storage format
  !> to a sparse matrix in CSR storage format. 
  interface hipsparseXcoo2csr
#ifdef USE_CUDA_NAMES
    function hipsparseXcoo2csr_orig(handle,cooRowInd,nnz,m,csrRowPtr,idxBase) bind(c, name="cusparseXcoo2csr")
#else
    function hipsparseXcoo2csr_orig(handle,cooRowInd,nnz,m,csrRowPtr,idxBase) bind(c, name="hipsparseXcoo2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoo2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: cooRowInd
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: csrRowPtr
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcoo2csr_rank_0,hipsparseXcoo2csr_rank_1
#endif

  end interface
  !>  Description: This routine creates an identity map. 
  interface hipsparseCreateIdentityPermutation
#ifdef USE_CUDA_NAMES
    function hipsparseCreateIdentityPermutation_orig(handle,n,p) bind(c, name="cusparseCreateIdentityPermutation")
#else
    function hipsparseCreateIdentityPermutation_orig(handle,n,p) bind(c, name="hipsparseCreateIdentityPermutation")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateIdentityPermutation_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: p
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseCreateIdentityPermutation_rank_0,hipsparseCreateIdentityPermutation_rank_1
#endif

  end interface
  !>  Description: This routine computes the required buffer size for csrsort. 
  interface hipsparseXcsrsort_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsort_bufferSizeExt_orig(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes) bind(c, name="cusparseXcsrsort_bufferSizeExt")
#else
    function hipsparseXcsrsort_bufferSizeExt_orig(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes) bind(c, name="hipsparseXcsrsort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrsort_bufferSizeExt_rank_0,hipsparseXcsrsort_bufferSizeExt_rank_1
#endif

  end interface
  !>  Description: This routine sorts CSR format. 
  interface hipsparseXcsrsort
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsort_orig(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer) bind(c, name="cusparseXcsrsort")
#else
    function hipsparseXcsrsort_orig(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer) bind(c, name="hipsparseXcsrsort")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcsrsort_full_rank,hipsparseXcsrsort_rank_0,hipsparseXcsrsort_rank_1
#endif

  end interface
  !>  Description: This routine computes the required buffer size for cscsort. 
  interface hipsparseXcscsort_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseXcscsort_bufferSizeExt_orig(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes) bind(c, name="cusparseXcscsort_bufferSizeExt")
#else
    function hipsparseXcscsort_bufferSizeExt_orig(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes) bind(c, name="hipsparseXcscsort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cscColPtr
      type(c_ptr),value :: cscRowInd
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcscsort_bufferSizeExt_rank_0,hipsparseXcscsort_bufferSizeExt_rank_1
#endif

  end interface
  !>  Description: This routine sorts CSR format. 
  interface hipsparseXcscsort
#ifdef USE_CUDA_NAMES
    function hipsparseXcscsort_orig(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer) bind(c, name="cusparseXcscsort")
#else
    function hipsparseXcscsort_orig(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer) bind(c, name="hipsparseXcscsort")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: cscColPtr
      type(c_ptr),value :: cscRowInd
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcscsort_full_rank,hipsparseXcscsort_rank_0,hipsparseXcscsort_rank_1
#endif

  end interface
  !>  Description: This routine computes the required buffer size for coosort. 
  interface hipsparseXcoosort_bufferSizeExt
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosort_bufferSizeExt_orig(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes) bind(c, name="cusparseXcoosort_bufferSizeExt")
#else
    function hipsparseXcoosort_bufferSizeExt_orig(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes) bind(c, name="hipsparseXcoosort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosort_bufferSizeExt_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      integer(c_size_t) :: pBufferSizeInBytes
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcoosort_bufferSizeExt_rank_0,hipsparseXcoosort_bufferSizeExt_rank_1
#endif

  end interface
  !>  Description: This routine sorts COO format by rows. 
  interface hipsparseXcoosortByRow
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosortByRow_orig(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="cusparseXcoosortByRow")
#else
    function hipsparseXcoosortByRow_orig(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByRow")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByRow_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcoosortByRow_full_rank,hipsparseXcoosortByRow_rank_0,hipsparseXcoosortByRow_rank_1
#endif

  end interface
  !>  Description: This routine sorts COO format by columns. 
  interface hipsparseXcoosortByColumn
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosortByColumn_orig(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="cusparseXcoosortByColumn")
#else
    function hipsparseXcoosortByColumn_orig(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByColumn")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByColumn_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsparseXcoosortByColumn_full_rank,hipsparseXcoosortByColumn_rank_0,hipsparseXcoosortByColumn_rank_1
#endif

  end interface

#ifdef USE_FPOINTER_INTERFACES
  contains
    function hipsparseSaxpyi_rank_0(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSaxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      real(c_float),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSaxpyi_rank_0 = hipsparseSaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseSaxpyi_rank_1(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSaxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_float),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSaxpyi_rank_1 = hipsparseSaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseDaxpyi_rank_0(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDaxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      real(c_double),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDaxpyi_rank_0 = hipsparseDaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseDaxpyi_rank_1(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDaxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_double),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDaxpyi_rank_1 = hipsparseDaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseCaxpyi_rank_0(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCaxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_float_complex),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCaxpyi_rank_0 = hipsparseCaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseCaxpyi_rank_1(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCaxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCaxpyi_rank_1 = hipsparseCaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseZaxpyi_rank_0(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZaxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_double_complex),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZaxpyi_rank_0 = hipsparseZaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseZaxpyi_rank_1(handle,nnz,alpha,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZaxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZaxpyi_rank_1 = hipsparseZaxpyi_orig(handle,nnz,alpha,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseSdoti_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      real(c_float),target :: y
      real(c_float),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSdoti_rank_0 = hipsparseSdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseSdoti_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSdoti_rank_1 = hipsparseSdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseDdoti_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      real(c_double),target :: y
      real(c_double),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDdoti_rank_0 = hipsparseDdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseDdoti_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDdoti_rank_1 = hipsparseDdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseCdoti_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCdoti_rank_0 = hipsparseCdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseCdoti_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCdoti_rank_1 = hipsparseCdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseZdoti_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZdoti_rank_0 = hipsparseZdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseZdoti_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZdoti_rank_1 = hipsparseZdoti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseCdotci_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdotci_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCdotci_rank_0 = hipsparseCdotci_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseCdotci_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdotci_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCdotci_rank_1 = hipsparseCdotci_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseZdotci_rank_0(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdotci_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZdotci_rank_0 = hipsparseZdotci_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseZdotci_rank_1(handle,nnz,xVal,xInd,y,myResult,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdotci_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZdotci_rank_1 = hipsparseZdotci_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c_loc(myResult),idxBase)
    end function

    function hipsparseSgthr_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: y
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSgthr_rank_0 = hipsparseSgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseSgthr_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSgthr_rank_1 = hipsparseSgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseDgthr_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: y
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDgthr_rank_0 = hipsparseDgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseDgthr_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDgthr_rank_1 = hipsparseDgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseCgthr_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCgthr_rank_0 = hipsparseCgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseCgthr_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCgthr_rank_1 = hipsparseCgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseZgthr_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZgthr_rank_0 = hipsparseZgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseZgthr_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZgthr_rank_1 = hipsparseZgthr_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseSgthrz_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: y
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSgthrz_rank_0 = hipsparseSgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseSgthrz_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSgthrz_rank_1 = hipsparseSgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseDgthrz_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: y
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDgthrz_rank_0 = hipsparseDgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseDgthrz_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDgthrz_rank_1 = hipsparseDgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseCgthrz_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCgthrz_rank_0 = hipsparseCgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseCgthrz_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCgthrz_rank_1 = hipsparseCgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseZgthrz_rank_0(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZgthrz_rank_0 = hipsparseZgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseZgthrz_rank_1(handle,nnz,y,xVal,xInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZgthrz_rank_1 = hipsparseZgthrz_orig(handle,nnz,c_loc(y),c_loc(xVal),c_loc(xInd),idxBase)
    end function

    function hipsparseSroti_rank_0(handle,nnz,xVal,xInd,y,c,s,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSroti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      real(c_float),target :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSroti_rank_0 = hipsparseSroti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c,s,idxBase)
    end function

    function hipsparseSroti_rank_1(handle,nnz,xVal,xInd,y,c,s,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSroti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_float),target,dimension(:) :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSroti_rank_1 = hipsparseSroti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c,s,idxBase)
    end function

    function hipsparseDroti_rank_0(handle,nnz,xVal,xInd,y,c,s,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDroti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      real(c_double),target :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDroti_rank_0 = hipsparseDroti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c,s,idxBase)
    end function

    function hipsparseDroti_rank_1(handle,nnz,xVal,xInd,y,c,s,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDroti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_double),target,dimension(:) :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDroti_rank_1 = hipsparseDroti_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),c,s,idxBase)
    end function

    function hipsparseSsctr_rank_0(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: xVal
      integer(c_int),target :: xInd
      real(c_float),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSsctr_rank_0 = hipsparseSsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseSsctr_rank_1(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_float),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseSsctr_rank_1 = hipsparseSsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseDsctr_rank_0(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: xVal
      integer(c_int),target :: xInd
      real(c_double),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDsctr_rank_0 = hipsparseDsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseDsctr_rank_1(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      real(c_double),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDsctr_rank_1 = hipsparseDsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseCsctr_rank_0(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_float_complex),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCsctr_rank_0 = hipsparseCsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseCsctr_rank_1(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCsctr_rank_1 = hipsparseCsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseZsctr_rank_0(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: xVal
      integer(c_int),target :: xInd
      complex(c_double_complex),target :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZsctr_rank_0 = hipsparseZsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseZsctr_rank_1(handle,nnz,xVal,xInd,y,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: xVal
      integer(c_int),target,dimension(:) :: xInd
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZsctr_rank_1 = hipsparseZsctr_orig(handle,nnz,c_loc(xVal),c_loc(xInd),c_loc(y),idxBase)
    end function

    function hipsparseScsrmv_rank_0(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      hipsparseScsrmv_rank_0 = hipsparseScsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseScsrmv_rank_1(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      hipsparseScsrmv_rank_1 = hipsparseScsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDcsrmv_rank_0(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      hipsparseDcsrmv_rank_0 = hipsparseDcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDcsrmv_rank_1(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      hipsparseDcsrmv_rank_1 = hipsparseDcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseCcsrmv_rank_0(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      hipsparseCcsrmv_rank_0 = hipsparseCcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseCcsrmv_rank_1(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      hipsparseCcsrmv_rank_1 = hipsparseCcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZcsrmv_rank_0(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      hipsparseZcsrmv_rank_0 = hipsparseZcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZcsrmv_rank_1(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      hipsparseZcsrmv_rank_1 = hipsparseZcsrmv_orig(handle,transA,m,n,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(x),beta,c_loc(y))
    end function

    function hipsparseScsrsv2_bufferSize_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsrsv2_bufferSize_rank_0 = hipsparseScsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsrsv2_bufferSize_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsrsv2_bufferSize_rank_1 = hipsparseScsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrsv2_bufferSize_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsrsv2_bufferSize_rank_0 = hipsparseDcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrsv2_bufferSize_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsrsv2_bufferSize_rank_1 = hipsparseDcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrsv2_bufferSize_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsrsv2_bufferSize_rank_0 = hipsparseCcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrsv2_bufferSize_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsrsv2_bufferSize_rank_1 = hipsparseCcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrsv2_bufferSize_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsrsv2_bufferSize_rank_0 = hipsparseZcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrsv2_bufferSize_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsrsv2_bufferSize_rank_1 = hipsparseZcsrsv2_bufferSize_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsrsv2_bufferSizeExt_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrsv2_bufferSizeExt_rank_0 = hipsparseScsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsrsv2_bufferSizeExt_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrsv2_bufferSizeExt_rank_1 = hipsparseScsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsrsv2_bufferSizeExt_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrsv2_bufferSizeExt_rank_0 = hipsparseDcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsrsv2_bufferSizeExt_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrsv2_bufferSizeExt_rank_1 = hipsparseDcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsrsv2_bufferSizeExt_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrsv2_bufferSizeExt_rank_0 = hipsparseCcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsrsv2_bufferSizeExt_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrsv2_bufferSizeExt_rank_1 = hipsparseCcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsrsv2_bufferSizeExt_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrsv2_bufferSizeExt_rank_0 = hipsparseZcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsrsv2_bufferSizeExt_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrsv2_bufferSizeExt_rank_1 = hipsparseZcsrsv2_bufferSizeExt_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsrsv2_analysis_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsv2_analysis_rank_0 = hipsparseScsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsv2_analysis_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsv2_analysis_rank_1 = hipsparseScsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsv2_analysis_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsv2_analysis_rank_0 = hipsparseDcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsv2_analysis_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsv2_analysis_rank_1 = hipsparseDcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsv2_analysis_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsv2_analysis_rank_0 = hipsparseCcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsv2_analysis_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsv2_analysis_rank_1 = hipsparseCcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsv2_analysis_rank_0(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsv2_analysis_rank_0 = hipsparseZcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsv2_analysis_rank_1(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsv2_analysis_rank_1 = hipsparseZcsrsv2_analysis_orig(handle,transA,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsv2_solve_rank_0(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      real(c_float),target :: f
      real(c_float),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsv2_solve_rank_0 = hipsparseScsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseScsrsv2_solve_rank_1(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      real(c_float),target,dimension(:) :: f
      real(c_float),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsv2_solve_rank_1 = hipsparseScsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseDcsrsv2_solve_rank_0(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      real(c_double),target :: f
      real(c_double),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsv2_solve_rank_0 = hipsparseDcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseDcsrsv2_solve_rank_1(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      real(c_double),target,dimension(:) :: f
      real(c_double),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsv2_solve_rank_1 = hipsparseDcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseCcsrsv2_solve_rank_0(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target :: f
      complex(c_float_complex),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsv2_solve_rank_0 = hipsparseCcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseCcsrsv2_solve_rank_1(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target,dimension(:) :: f
      complex(c_float_complex),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsv2_solve_rank_1 = hipsparseCcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseZcsrsv2_solve_rank_0(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target :: f
      complex(c_double_complex),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsv2_solve_rank_0 = hipsparseZcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseZcsrsv2_solve_rank_1(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target,dimension(:) :: f
      complex(c_double_complex),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsv2_solve_rank_1 = hipsparseZcsrsv2_solve_orig(handle,transA,m,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseShybmv_rank_0(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      hipsparseShybmv_rank_0 = hipsparseShybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseShybmv_rank_1(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      hipsparseShybmv_rank_1 = hipsparseShybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDhybmv_rank_0(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      hipsparseDhybmv_rank_0 = hipsparseDhybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDhybmv_rank_1(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      hipsparseDhybmv_rank_1 = hipsparseDhybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseChybmv_rank_0(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      hipsparseChybmv_rank_0 = hipsparseChybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseChybmv_rank_1(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      hipsparseChybmv_rank_1 = hipsparseChybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZhybmv_rank_0(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      hipsparseZhybmv_rank_0 = hipsparseZhybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZhybmv_rank_1(handle,transA,alpha,descrA,hybA,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      hipsparseZhybmv_rank_1 = hipsparseZhybmv_orig(handle,transA,alpha,descrA,hybA,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseSbsrmv_rank_0(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      hipsparseSbsrmv_rank_0 = hipsparseSbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseSbsrmv_rank_1(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      hipsparseSbsrmv_rank_1 = hipsparseSbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDbsrmv_rank_0(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      hipsparseDbsrmv_rank_0 = hipsparseDbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseDbsrmv_rank_1(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      hipsparseDbsrmv_rank_1 = hipsparseDbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseCbsrmv_rank_0(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      hipsparseCbsrmv_rank_0 = hipsparseCbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseCbsrmv_rank_1(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      hipsparseCbsrmv_rank_1 = hipsparseCbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZbsrmv_rank_0(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      hipsparseZbsrmv_rank_0 = hipsparseZbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseZbsrmv_rank_1(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      hipsparseZbsrmv_rank_1 = hipsparseZbsrmv_orig(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,c_loc(x),beta,c_loc(y))
    end function

    function hipsparseSbsrsv2_bufferSize_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsrsv2_bufferSize_rank_0 = hipsparseSbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsrsv2_bufferSize_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsrsv2_bufferSize_rank_1 = hipsparseSbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsrsv2_bufferSize_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsrsv2_bufferSize_rank_0 = hipsparseDbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsrsv2_bufferSize_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsrsv2_bufferSize_rank_1 = hipsparseDbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsrsv2_bufferSize_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsrsv2_bufferSize_rank_0 = hipsparseCbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsrsv2_bufferSize_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsrsv2_bufferSize_rank_1 = hipsparseCbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsrsv2_bufferSize_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsrsv2_bufferSize_rank_0 = hipsparseZbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsrsv2_bufferSize_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsrsv2_bufferSize_rank_1 = hipsparseZbsrsv2_bufferSize_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsrsv2_bufferSizeExt_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseSbsrsv2_bufferSizeExt_rank_0 = hipsparseSbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseSbsrsv2_bufferSizeExt_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseSbsrsv2_bufferSizeExt_rank_1 = hipsparseSbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseDbsrsv2_bufferSizeExt_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDbsrsv2_bufferSizeExt_rank_0 = hipsparseDbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseDbsrsv2_bufferSizeExt_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDbsrsv2_bufferSizeExt_rank_1 = hipsparseDbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseCbsrsv2_bufferSizeExt_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCbsrsv2_bufferSizeExt_rank_0 = hipsparseCbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseCbsrsv2_bufferSizeExt_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCbsrsv2_bufferSizeExt_rank_1 = hipsparseCbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseZbsrsv2_bufferSizeExt_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZbsrsv2_bufferSizeExt_rank_0 = hipsparseZbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseZbsrsv2_bufferSizeExt_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZbsrsv2_bufferSizeExt_rank_1 = hipsparseZbsrsv2_bufferSizeExt_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSize)
    end function

    function hipsparseSbsrsv2_analysis_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrsv2_analysis_rank_0 = hipsparseSbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsrsv2_analysis_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrsv2_analysis_rank_1 = hipsparseSbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrsv2_analysis_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrsv2_analysis_rank_0 = hipsparseDbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrsv2_analysis_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrsv2_analysis_rank_1 = hipsparseDbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrsv2_analysis_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrsv2_analysis_rank_0 = hipsparseCbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrsv2_analysis_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrsv2_analysis_rank_1 = hipsparseCbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrsv2_analysis_rank_0(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrsv2_analysis_rank_0 = hipsparseZbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrsv2_analysis_rank_1(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrsv2_analysis_rank_1 = hipsparseZbsrsv2_analysis_orig(handle,dirA,transA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsrsv2_solve_rank_0(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      real(c_float),target :: f
      real(c_float),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrsv2_solve_rank_0 = hipsparseSbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseSbsrsv2_solve_rank_1(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      real(c_float),target,dimension(:) :: f
      real(c_float),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrsv2_solve_rank_1 = hipsparseSbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseDbsrsv2_solve_rank_0(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      real(c_double),target :: f
      real(c_double),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrsv2_solve_rank_0 = hipsparseDbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseDbsrsv2_solve_rank_1(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      real(c_double),target,dimension(:) :: f
      real(c_double),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrsv2_solve_rank_1 = hipsparseDbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseCbsrsv2_solve_rank_0(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target :: f
      complex(c_float_complex),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrsv2_solve_rank_0 = hipsparseCbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseCbsrsv2_solve_rank_1(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target,dimension(:) :: f
      complex(c_float_complex),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrsv2_solve_rank_1 = hipsparseCbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseZbsrsv2_solve_rank_0(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target :: f
      complex(c_double_complex),target :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrsv2_solve_rank_0 = hipsparseZbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseZbsrsv2_solve_rank_1(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target,dimension(:) :: f
      complex(c_double_complex),target,dimension(:) :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrsv2_solve_rank_1 = hipsparseZbsrsv2_solve_orig(handle,dirA,transA,mb,nnzb,alpha,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,c_loc(f),c_loc(x),policy,pBuffer)
    end function

    function hipsparseSbsrmm_full_rank(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseSbsrmm_full_rank = hipsparseSbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseSbsrmm_rank_0(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_float),target :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseSbsrmm_rank_0 = hipsparseSbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseSbsrmm_rank_1(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseSbsrmm_rank_1 = hipsparseSbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDbsrmm_full_rank(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDbsrmm_full_rank = hipsparseDbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDbsrmm_rank_0(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_double),target :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseDbsrmm_rank_0 = hipsparseDbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDbsrmm_rank_1(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDbsrmm_rank_1 = hipsparseDbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCbsrmm_full_rank(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCbsrmm_full_rank = hipsparseCbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCbsrmm_rank_0(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseCbsrmm_rank_0 = hipsparseCbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCbsrmm_rank_1(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCbsrmm_rank_1 = hipsparseCbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZbsrmm_full_rank(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZbsrmm_full_rank = hipsparseZbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZbsrmm_rank_0(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseZbsrmm_rank_0 = hipsparseZbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZbsrmm_rank_1(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZbsrmm_rank_1 = hipsparseZbsrmm_orig(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm_full_rank(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm_full_rank = hipsparseScsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm_rank_0(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm_rank_0 = hipsparseScsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm_rank_1(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm_rank_1 = hipsparseScsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm_full_rank(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm_full_rank = hipsparseDcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm_rank_0(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm_rank_0 = hipsparseDcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm_rank_1(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm_rank_1 = hipsparseDcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm_full_rank(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm_full_rank = hipsparseCcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm_rank_0(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm_rank_0 = hipsparseCcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm_rank_1(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm_rank_1 = hipsparseCcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm_full_rank(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm_full_rank = hipsparseZcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm_rank_0(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm_rank_0 = hipsparseZcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm_rank_1(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm_rank_1 = hipsparseZcsrmm_orig(handle,transA,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm2_full_rank(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm2_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm2_full_rank = hipsparseScsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm2_rank_0(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm2_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm2_rank_0 = hipsparseScsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrmm2_rank_1(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm2_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseScsrmm2_rank_1 = hipsparseScsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm2_full_rank(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm2_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm2_full_rank = hipsparseDcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm2_rank_0(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm2_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm2_rank_0 = hipsparseDcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseDcsrmm2_rank_1(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm2_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDcsrmm2_rank_1 = hipsparseDcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm2_full_rank(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm2_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm2_full_rank = hipsparseCcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm2_rank_0(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm2_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm2_rank_0 = hipsparseCcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseCcsrmm2_rank_1(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm2_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCcsrmm2_rank_1 = hipsparseCcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm2_full_rank(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm2_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm2_full_rank = hipsparseZcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm2_rank_0(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm2_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm2_rank_0 = hipsparseZcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseZcsrmm2_rank_1(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm2_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZcsrmm2_rank_1 = hipsparseZcsrmm2_orig(handle,transA,transB,m,n,k,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function hipsparseScsrsm2_bufferSizeExt_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrsm2_bufferSizeExt_full_rank = hipsparseScsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseScsrsm2_bufferSizeExt_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrsm2_bufferSizeExt_rank_0 = hipsparseScsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseScsrsm2_bufferSizeExt_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrsm2_bufferSizeExt_rank_1 = hipsparseScsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseDcsrsm2_bufferSizeExt_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrsm2_bufferSizeExt_full_rank = hipsparseDcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseDcsrsm2_bufferSizeExt_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrsm2_bufferSizeExt_rank_0 = hipsparseDcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseDcsrsm2_bufferSizeExt_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrsm2_bufferSizeExt_rank_1 = hipsparseDcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseCcsrsm2_bufferSizeExt_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrsm2_bufferSizeExt_full_rank = hipsparseCcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseCcsrsm2_bufferSizeExt_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrsm2_bufferSizeExt_rank_0 = hipsparseCcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseCcsrsm2_bufferSizeExt_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrsm2_bufferSizeExt_rank_1 = hipsparseCcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseZcsrsm2_bufferSizeExt_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrsm2_bufferSizeExt_full_rank = hipsparseZcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseZcsrsm2_bufferSizeExt_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrsm2_bufferSizeExt_rank_0 = hipsparseZcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseZcsrsm2_bufferSizeExt_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrsm2_bufferSizeExt_rank_1 = hipsparseZcsrsm2_bufferSizeExt_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBufferSize)
    end function

    function hipsparseScsrsm2_analysis_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_analysis_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_analysis_full_rank = hipsparseScsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsm2_analysis_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_analysis_rank_0 = hipsparseScsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsm2_analysis_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_analysis_rank_1 = hipsparseScsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_analysis_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_analysis_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_analysis_full_rank = hipsparseDcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_analysis_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_analysis_rank_0 = hipsparseDcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_analysis_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_analysis_rank_1 = hipsparseDcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_analysis_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_analysis_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_analysis_full_rank = hipsparseCcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_analysis_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_analysis_rank_0 = hipsparseCcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_analysis_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_analysis_rank_1 = hipsparseCcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_analysis_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_analysis_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_analysis_full_rank = hipsparseZcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_analysis_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_analysis_rank_0 = hipsparseZcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_analysis_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_analysis_rank_1 = hipsparseZcsrsm2_analysis_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsm2_solve_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_solve_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_solve_full_rank = hipsparseScsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsm2_solve_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_solve_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_solve_rank_0 = hipsparseScsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrsm2_solve_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_solve_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrsm2_solve_rank_1 = hipsparseScsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_solve_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_solve_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_solve_full_rank = hipsparseDcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_solve_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_solve_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_solve_rank_0 = hipsparseDcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrsm2_solve_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_solve_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrsm2_solve_rank_1 = hipsparseDcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_solve_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_solve_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_solve_full_rank = hipsparseCcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_solve_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_solve_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_solve_rank_0 = hipsparseCcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrsm2_solve_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_solve_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrsm2_solve_rank_1 = hipsparseCcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_solve_full_rank(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_solve_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_solve_full_rank = hipsparseZcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_solve_rank_0(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_solve_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_solve_rank_0 = hipsparseZcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrsm2_solve_rank_1(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_solve_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrsm2_solve_rank_1 = hipsparseZcsrsm2_solve_orig(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),c_loc(B),ldb,myInfo,policy,pBuffer)
    end function

    function hipsparseSgemmi_full_rank(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgemmi_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseSgemmi_full_rank = hipsparseSgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseSgemmi_rank_0(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgemmi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),target :: cscValB
      integer(c_int),target :: cscColPtrB
      integer(c_int),target :: cscRowIndB
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseSgemmi_rank_0 = hipsparseSgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseSgemmi_rank_1(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgemmi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseSgemmi_rank_1 = hipsparseSgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseDgemmi_full_rank(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgemmi_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDgemmi_full_rank = hipsparseDgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseDgemmi_rank_0(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgemmi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),target :: cscValB
      integer(c_int),target :: cscColPtrB
      integer(c_int),target :: cscRowIndB
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseDgemmi_rank_0 = hipsparseDgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseDgemmi_rank_1(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgemmi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseDgemmi_rank_1 = hipsparseDgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseCgemmi_full_rank(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgemmi_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      complex(c_float_complex),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCgemmi_full_rank = hipsparseCgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseCgemmi_rank_0(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgemmi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target :: A
      integer(c_int),value :: lda
      complex(c_float_complex),target :: cscValB
      integer(c_int),target :: cscColPtrB
      integer(c_int),target :: cscRowIndB
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseCgemmi_rank_0 = hipsparseCgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseCgemmi_rank_1(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgemmi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(c_float_complex),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseCgemmi_rank_1 = hipsparseCgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseZgemmi_full_rank(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgemmi_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      complex(c_double_complex),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZgemmi_full_rank = hipsparseZgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseZgemmi_rank_0(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgemmi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target :: A
      integer(c_int),value :: lda
      complex(c_double_complex),target :: cscValB
      integer(c_int),target :: cscColPtrB
      integer(c_int),target :: cscRowIndB
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      hipsparseZgemmi_rank_0 = hipsparseZgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseZgemmi_rank_1(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgemmi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(c_double_complex),target,dimension(:) :: cscValB
      integer(c_int),target,dimension(:) :: cscColPtrB
      integer(c_int),target,dimension(:) :: cscRowIndB
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      hipsparseZgemmi_rank_1 = hipsparseZgemmi_orig(handle,m,n,k,nnz,alpha,c_loc(A),lda,c_loc(cscValB),c_loc(cscColPtrB),c_loc(cscRowIndB),beta,c_loc(C),ldc)
    end function

    function hipsparseXcsrgeamNnz_rank_0(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeamNnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseXcsrgeamNnz_rank_0 = hipsparseXcsrgeamNnz_orig(handle,m,n,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr)
    end function

    function hipsparseXcsrgeamNnz_rank_1(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeamNnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseXcsrgeamNnz_rank_1 = hipsparseXcsrgeamNnz_orig(handle,m,n,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr)
    end function

    function hipsparseScsrgeam_rank_0(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseScsrgeam_rank_0 = hipsparseScsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseScsrgeam_rank_1(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseScsrgeam_rank_1 = hipsparseScsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDcsrgeam_rank_0(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseDcsrgeam_rank_0 = hipsparseDcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDcsrgeam_rank_1(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseDcsrgeam_rank_1 = hipsparseDcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCcsrgeam_rank_0(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseCcsrgeam_rank_0 = hipsparseCcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCcsrgeam_rank_1(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseCcsrgeam_rank_1 = hipsparseCcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZcsrgeam_rank_0(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseZcsrgeam_rank_0 = hipsparseZcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZcsrgeam_rank_1(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseZcsrgeam_rank_1 = hipsparseZcsrgeam_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),beta,descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseScsrgeam2_bufferSizeExt_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_float),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseScsrgeam2_bufferSizeExt_rank_0 = hipsparseScsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseScsrgeam2_bufferSizeExt_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseScsrgeam2_bufferSizeExt_rank_1 = hipsparseScsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseDcsrgeam2_bufferSizeExt_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_double),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseDcsrgeam2_bufferSizeExt_rank_0 = hipsparseDcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseDcsrgeam2_bufferSizeExt_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseDcsrgeam2_bufferSizeExt_rank_1 = hipsparseDcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseCcsrgeam2_bufferSizeExt_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseCcsrgeam2_bufferSizeExt_rank_0 = hipsparseCcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseCcsrgeam2_bufferSizeExt_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseCcsrgeam2_bufferSizeExt_rank_1 = hipsparseCcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseZcsrgeam2_bufferSizeExt_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseZcsrgeam2_bufferSizeExt_rank_0 = hipsparseZcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseZcsrgeam2_bufferSizeExt_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseZcsrgeam2_bufferSizeExt_rank_1 = hipsparseZcsrgeam2_bufferSizeExt_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBufferSizeInBytes)
    end function

    function hipsparseXcsrgeam2Nnz_rank_0(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeam2Nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: workspace
      !
      hipsparseXcsrgeam2Nnz_rank_0 = hipsparseXcsrgeam2Nnz_orig(handle,m,n,descrA,nnzA,c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),descrB,nnzB,c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedRowPtrC),nnzTotalDevHostPtr,workspace)
    end function

    function hipsparseXcsrgeam2Nnz_rank_1(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeam2Nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: workspace
      !
      hipsparseXcsrgeam2Nnz_rank_1 = hipsparseXcsrgeam2Nnz_orig(handle,m,n,descrA,nnzA,c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),descrB,nnzB,c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedRowPtrC),nnzTotalDevHostPtr,workspace)
    end function

    function hipsparseScsrgeam2_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_float),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrgeam2_rank_0 = hipsparseScsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseScsrgeam2_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrgeam2_rank_1 = hipsparseScsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseDcsrgeam2_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_double),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrgeam2_rank_0 = hipsparseDcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseDcsrgeam2_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrgeam2_rank_1 = hipsparseDcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseCcsrgeam2_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrgeam2_rank_0 = hipsparseCcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseCcsrgeam2_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrgeam2_rank_1 = hipsparseCcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseZcsrgeam2_rank_0(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target :: csrSortedValB
      integer(c_int),target :: csrSortedRowPtrB
      integer(c_int),target :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrSortedValC
      integer(c_int),target :: csrSortedRowPtrC
      integer(c_int),target :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrgeam2_rank_0 = hipsparseZcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseZcsrgeam2_rank_1(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target,dimension(:) :: csrSortedValB
      integer(c_int),target,dimension(:) :: csrSortedRowPtrB
      integer(c_int),target,dimension(:) :: csrSortedColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrSortedValC
      integer(c_int),target,dimension(:) :: csrSortedRowPtrC
      integer(c_int),target,dimension(:) :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrgeam2_rank_1 = hipsparseZcsrgeam2_orig(handle,m,n,alpha,descrA,nnzA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),beta,descrB,nnzB,c_loc(csrSortedValB),c_loc(csrSortedRowPtrB),c_loc(csrSortedColIndB),descrC,c_loc(csrSortedValC),c_loc(csrSortedRowPtrC),c_loc(csrSortedColIndC),pBuffer)
    end function

    function hipsparseXcsrgemmNnz_rank_0(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemmNnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseXcsrgemmNnz_rank_0 = hipsparseXcsrgemmNnz_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr)
    end function

    function hipsparseXcsrgemmNnz_rank_1(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemmNnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseXcsrgemmNnz_rank_1 = hipsparseXcsrgemmNnz_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr)
    end function

    function hipsparseScsrgemm_rank_0(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseScsrgemm_rank_0 = hipsparseScsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseScsrgemm_rank_1(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseScsrgemm_rank_1 = hipsparseScsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDcsrgemm_rank_0(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseDcsrgemm_rank_0 = hipsparseDcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDcsrgemm_rank_1(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseDcsrgemm_rank_1 = hipsparseDcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCcsrgemm_rank_0(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseCcsrgemm_rank_0 = hipsparseCcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCcsrgemm_rank_1(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseCcsrgemm_rank_1 = hipsparseCcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZcsrgemm_rank_0(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseZcsrgemm_rank_0 = hipsparseZcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZcsrgemm_rank_1(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseZcsrgemm_rank_1 = hipsparseZcsrgemm_orig(handle,transA,transB,m,n,k,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseScsrgemm2_bufferSizeExt_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseScsrgemm2_bufferSizeExt_rank_0 = hipsparseScsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsrgemm2_bufferSizeExt_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseScsrgemm2_bufferSizeExt_rank_1 = hipsparseScsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrgemm2_bufferSizeExt_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseDcsrgemm2_bufferSizeExt_rank_0 = hipsparseDcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrgemm2_bufferSizeExt_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseDcsrgemm2_bufferSizeExt_rank_1 = hipsparseDcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrgemm2_bufferSizeExt_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseCcsrgemm2_bufferSizeExt_rank_0 = hipsparseCcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrgemm2_bufferSizeExt_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseCcsrgemm2_bufferSizeExt_rank_1 = hipsparseCcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrgemm2_bufferSizeExt_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseZcsrgemm2_bufferSizeExt_rank_0 = hipsparseZcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrgemm2_bufferSizeExt_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseZcsrgemm2_bufferSizeExt_rank_1 = hipsparseZcsrgemm2_bufferSizeExt_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseXcsrgemm2Nnz_rank_0(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemm2Nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcsrgemm2Nnz_rank_0 = hipsparseXcsrgemm2Nnz_orig(handle,m,n,k,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,pBuffer)
    end function

    function hipsparseXcsrgemm2Nnz_rank_1(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemm2Nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcsrgemm2Nnz_rank_1 = hipsparseXcsrgemm2Nnz_orig(handle,m,n,k,descrA,nnzA,c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrRowPtrB),c_loc(csrColIndB),descrD,nnzD,c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,pBuffer)
    end function

    function hipsparseScsrgemm2_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      real(c_float),target :: csrValD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrgemm2_rank_0 = hipsparseScsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseScsrgemm2_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_float),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      real(c_float),target,dimension(:) :: csrValD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrgemm2_rank_1 = hipsparseScsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseDcsrgemm2_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      real(c_double),target :: csrValD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrgemm2_rank_0 = hipsparseDcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseDcsrgemm2_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      real(c_double),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      real(c_double),target,dimension(:) :: csrValD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrgemm2_rank_1 = hipsparseDcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseCcsrgemm2_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      complex(c_float_complex),target :: csrValD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrgemm2_rank_0 = hipsparseCcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseCcsrgemm2_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_float_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      complex(c_float_complex),target,dimension(:) :: csrValD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrgemm2_rank_1 = hipsparseCcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseZcsrgemm2_rank_0(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target :: csrValB
      integer(c_int),target :: csrRowPtrB
      integer(c_int),target :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      complex(c_double_complex),target :: csrValD
      integer(c_int),target :: csrRowPtrD
      integer(c_int),target :: csrColIndD
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrgemm2_rank_0 = hipsparseZcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseZcsrgemm2_rank_1(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      complex(c_double_complex),target,dimension(:) :: csrValB
      integer(c_int),target,dimension(:) :: csrRowPtrB
      integer(c_int),target,dimension(:) :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      complex(c_double_complex),target,dimension(:) :: csrValD
      integer(c_int),target,dimension(:) :: csrRowPtrD
      integer(c_int),target,dimension(:) :: csrColIndD
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrgemm2_rank_1 = hipsparseZcsrgemm2_orig(handle,m,n,k,alpha,descrA,nnzA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),descrB,nnzB,c_loc(csrValB),c_loc(csrRowPtrB),c_loc(csrColIndB),beta,descrD,nnzD,c_loc(csrValD),c_loc(csrRowPtrD),c_loc(csrColIndD),descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,pBuffer)
    end function

    function hipsparseSbsrilu02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsrilu02_bufferSize_rank_0 = hipsparseSbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsrilu02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsrilu02_bufferSize_rank_1 = hipsparseSbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsrilu02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsrilu02_bufferSize_rank_0 = hipsparseDbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsrilu02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsrilu02_bufferSize_rank_1 = hipsparseDbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsrilu02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsrilu02_bufferSize_rank_0 = hipsparseCbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsrilu02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsrilu02_bufferSize_rank_1 = hipsparseCbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsrilu02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsrilu02_bufferSize_rank_0 = hipsparseZbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsrilu02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsrilu02_bufferSize_rank_1 = hipsparseZbsrilu02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsrilu02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrilu02_analysis_rank_0 = hipsparseSbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsrilu02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrilu02_analysis_rank_1 = hipsparseSbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrilu02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrilu02_analysis_rank_0 = hipsparseDbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrilu02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrilu02_analysis_rank_1 = hipsparseDbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrilu02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrilu02_analysis_rank_0 = hipsparseCbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrilu02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrilu02_analysis_rank_1 = hipsparseCbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrilu02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrilu02_analysis_rank_0 = hipsparseZbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrilu02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrilu02_analysis_rank_1 = hipsparseZbsrilu02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsrilu02_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrSortedValA_valM
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrilu02_rank_0 = hipsparseSbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsrilu02_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrSortedValA_valM
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsrilu02_rank_1 = hipsparseSbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrilu02_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrSortedValA_valM
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrilu02_rank_0 = hipsparseDbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsrilu02_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrSortedValA_valM
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsrilu02_rank_1 = hipsparseDbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrilu02_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrSortedValA_valM
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrilu02_rank_0 = hipsparseCbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsrilu02_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrSortedValA_valM
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsrilu02_rank_1 = hipsparseCbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrilu02_rank_0(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrSortedValA_valM
      integer(c_int),target :: bsrSortedRowPtrA
      integer(c_int),target :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrilu02_rank_0 = hipsparseZbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsrilu02_rank_1(handle,dirA,mb,nnzb,descrA,bsrSortedValA_valM,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrSortedValA_valM
      integer(c_int),target,dimension(:) :: bsrSortedRowPtrA
      integer(c_int),target,dimension(:) :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsrilu02_rank_1 = hipsparseZbsrilu02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrSortedValA_valM),c_loc(bsrSortedRowPtrA),c_loc(bsrSortedColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseScsrilu02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsrilu02_bufferSize_rank_0 = hipsparseScsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsrilu02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsrilu02_bufferSize_rank_1 = hipsparseScsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrilu02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsrilu02_bufferSize_rank_0 = hipsparseDcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsrilu02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsrilu02_bufferSize_rank_1 = hipsparseDcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrilu02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsrilu02_bufferSize_rank_0 = hipsparseCcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsrilu02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsrilu02_bufferSize_rank_1 = hipsparseCcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrilu02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsrilu02_bufferSize_rank_0 = hipsparseZcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsrilu02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsrilu02_bufferSize_rank_1 = hipsparseZcsrilu02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsrilu02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrilu02_bufferSizeExt_rank_0 = hipsparseScsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsrilu02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsrilu02_bufferSizeExt_rank_1 = hipsparseScsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsrilu02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrilu02_bufferSizeExt_rank_0 = hipsparseDcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsrilu02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsrilu02_bufferSizeExt_rank_1 = hipsparseDcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsrilu02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrilu02_bufferSizeExt_rank_0 = hipsparseCcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsrilu02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsrilu02_bufferSizeExt_rank_1 = hipsparseCcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsrilu02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrilu02_bufferSizeExt_rank_0 = hipsparseZcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsrilu02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsrilu02_bufferSizeExt_rank_1 = hipsparseZcsrilu02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsrilu02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrilu02_analysis_rank_0 = hipsparseScsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsrilu02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrilu02_analysis_rank_1 = hipsparseScsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrilu02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrilu02_analysis_rank_0 = hipsparseDcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrilu02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrilu02_analysis_rank_1 = hipsparseDcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrilu02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrilu02_analysis_rank_0 = hipsparseCcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrilu02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrilu02_analysis_rank_1 = hipsparseCcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrilu02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrilu02_analysis_rank_0 = hipsparseZcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrilu02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrilu02_analysis_rank_1 = hipsparseZcsrilu02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsrilu02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrilu02_rank_0 = hipsparseScsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsrilu02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsrilu02_rank_1 = hipsparseScsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrilu02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrilu02_rank_0 = hipsparseDcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsrilu02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsrilu02_rank_1 = hipsparseDcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrilu02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrilu02_rank_0 = hipsparseCcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsrilu02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsrilu02_rank_1 = hipsparseCcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrilu02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrilu02_rank_0 = hipsparseZcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsrilu02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsrilu02_rank_1 = hipsparseZcsrilu02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseSbsric02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsric02_bufferSize_rank_0 = hipsparseSbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsric02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseSbsric02_bufferSize_rank_1 = hipsparseSbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsric02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsric02_bufferSize_rank_0 = hipsparseDbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDbsric02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDbsric02_bufferSize_rank_1 = hipsparseDbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsric02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsric02_bufferSize_rank_0 = hipsparseCbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCbsric02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCbsric02_bufferSize_rank_1 = hipsparseCbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsric02_bufferSize_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsric02_bufferSize_rank_0 = hipsparseZbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZbsric02_bufferSize_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZbsric02_bufferSize_rank_1 = hipsparseZbsric02_bufferSize_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,pBufferSizeInBytes)
    end function

    function hipsparseSbsric02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsric02_analysis_rank_0 = hipsparseSbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsric02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsric02_analysis_rank_1 = hipsparseSbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsric02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsric02_analysis_rank_0 = hipsparseDbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsric02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsric02_analysis_rank_1 = hipsparseDbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsric02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsric02_analysis_rank_0 = hipsparseCbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsric02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsric02_analysis_rank_1 = hipsparseCbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsric02_analysis_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsric02_analysis_rank_0 = hipsparseZbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsric02_analysis_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsric02_analysis_rank_1 = hipsparseZbsric02_analysis_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsric02_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsric02_rank_0 = hipsparseSbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseSbsric02_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsric02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseSbsric02_rank_1 = hipsparseSbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsric02_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsric02_rank_0 = hipsparseDbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseDbsric02_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsric02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDbsric02_rank_1 = hipsparseDbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsric02_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsric02_rank_0 = hipsparseCbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseCbsric02_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsric02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCbsric02_rank_1 = hipsparseCbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsric02_rank_0(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsric02_rank_0 = hipsparseZbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseZbsric02_rank_1(handle,dirA,mb,nnzb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsric02_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZbsric02_rank_1 = hipsparseZbsric02_orig(handle,dirA,mb,nnzb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,myInfo,policy,pBuffer)
    end function

    function hipsparseScsric02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsric02_bufferSize_rank_0 = hipsparseScsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsric02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseScsric02_bufferSize_rank_1 = hipsparseScsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsric02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsric02_bufferSize_rank_0 = hipsparseDcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseDcsric02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseDcsric02_bufferSize_rank_1 = hipsparseDcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsric02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsric02_bufferSize_rank_0 = hipsparseCcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseCcsric02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseCcsric02_bufferSize_rank_1 = hipsparseCcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsric02_bufferSize_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsric02_bufferSize_rank_0 = hipsparseZcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseZcsric02_bufferSize_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_int) :: pBufferSizeInBytes
      !
      hipsparseZcsric02_bufferSize_rank_1 = hipsparseZcsric02_bufferSize_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSizeInBytes)
    end function

    function hipsparseScsric02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsric02_bufferSizeExt_rank_0 = hipsparseScsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsric02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseScsric02_bufferSizeExt_rank_1 = hipsparseScsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsric02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsric02_bufferSizeExt_rank_0 = hipsparseDcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseDcsric02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseDcsric02_bufferSizeExt_rank_1 = hipsparseDcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsric02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsric02_bufferSizeExt_rank_0 = hipsparseCcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseCcsric02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseCcsric02_bufferSizeExt_rank_1 = hipsparseCcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsric02_bufferSizeExt_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsric02_bufferSizeExt_rank_0 = hipsparseZcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseZcsric02_bufferSizeExt_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: pBufferSize
      !
      hipsparseZcsric02_bufferSizeExt_rank_1 = hipsparseZcsric02_bufferSizeExt_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,pBufferSize)
    end function

    function hipsparseScsric02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsric02_analysis_rank_0 = hipsparseScsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsric02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsric02_analysis_rank_1 = hipsparseScsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsric02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsric02_analysis_rank_0 = hipsparseDcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsric02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsric02_analysis_rank_1 = hipsparseDcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsric02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsric02_analysis_rank_0 = hipsparseCcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsric02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsric02_analysis_rank_1 = hipsparseCcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsric02_analysis_rank_0(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsric02_analysis_rank_0 = hipsparseZcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsric02_analysis_rank_1(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsric02_analysis_rank_1 = hipsparseZcsric02_analysis_orig(handle,m,nnz,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsric02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsric02_rank_0 = hipsparseScsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseScsric02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseScsric02_rank_1 = hipsparseScsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsric02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsric02_rank_0 = hipsparseDcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseDcsric02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseDcsric02_rank_1 = hipsparseDcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsric02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsric02_rank_0 = hipsparseCcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseCcsric02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseCcsric02_rank_1 = hipsparseCcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsric02_rank_0(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA_valM
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsric02_rank_0 = hipsparseZcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseZcsric02_rank_1(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA_valM
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
      !
      hipsparseZcsric02_rank_1 = hipsparseZcsric02_orig(handle,m,nnz,descrA,c_loc(csrSortedValA_valM),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),myInfo,policy,pBuffer)
    end function

    function hipsparseSnnz_full_rank(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseSnnz_full_rank = hipsparseSnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseSnnz_rank_0(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target :: A
      integer(c_int),value :: lda
      integer(c_int),target :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseSnnz_rank_0 = hipsparseSnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseSnnz_rank_1(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseSnnz_rank_1 = hipsparseSnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseDnnz_full_rank(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseDnnz_full_rank = hipsparseDnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseDnnz_rank_0(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target :: A
      integer(c_int),value :: lda
      integer(c_int),target :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseDnnz_rank_0 = hipsparseDnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseDnnz_rank_1(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseDnnz_rank_1 = hipsparseDnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseCnnz_full_rank(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseCnnz_full_rank = hipsparseCnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseCnnz_rank_0(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: A
      integer(c_int),value :: lda
      integer(c_int),target :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseCnnz_rank_0 = hipsparseCnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseCnnz_rank_1(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseCnnz_rank_1 = hipsparseCnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseZnnz_full_rank(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseZnnz_full_rank = hipsparseZnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseZnnz_rank_0(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: A
      integer(c_int),value :: lda
      integer(c_int),target :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseZnnz_rank_0 = hipsparseZnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseZnnz_rank_1(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(c_int),target,dimension(:) :: nnzPerRowColumn
      integer(c_int) :: nnzTotalDevHostPtr
      !
      hipsparseZnnz_rank_1 = hipsparseZnnz_orig(handle,dirA,m,n,descrA,c_loc(A),lda,c_loc(nnzPerRowColumn),nnzTotalDevHostPtr)
    end function

    function hipsparseSdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseSdense2csr_full_rank = hipsparseSdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseSdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_rows
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      hipsparseSdense2csr_rank_0 = hipsparseSdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseSdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseSdense2csr_rank_1 = hipsparseSdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseDdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseDdense2csr_full_rank = hipsparseDdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseDdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_rows
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      hipsparseDdense2csr_rank_0 = hipsparseDdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseDdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseDdense2csr_rank_1 = hipsparseDdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseCdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseCdense2csr_full_rank = hipsparseCdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseCdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_rows
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      hipsparseCdense2csr_rank_0 = hipsparseCdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseCdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseCdense2csr_rank_1 = hipsparseCdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseZdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseZdense2csr_full_rank = hipsparseZdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseZdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_rows
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      hipsparseZdense2csr_rank_0 = hipsparseZdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseZdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_rows
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      hipsparseZdense2csr_rank_1 = hipsparseZdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function hipsparseSpruneDense2csr_bufferSize_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSize_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSize_full_rank = hipsparseSpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csr_bufferSize_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSize_rank_0 = hipsparseSpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csr_bufferSize_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSize_rank_1 = hipsparseSpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSize_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSize_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSize_full_rank = hipsparseDpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSize_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSize_rank_0 = hipsparseDpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSize_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSize_rank_1 = hipsparseDpruneDense2csr_bufferSize_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csr_bufferSizeExt_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSizeExt_full_rank = hipsparseSpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csr_bufferSizeExt_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSizeExt_rank_0 = hipsparseSpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csr_bufferSizeExt_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csr_bufferSizeExt_rank_1 = hipsparseSpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSizeExt_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSizeExt_full_rank = hipsparseDpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSizeExt_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSizeExt_rank_0 = hipsparseDpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csr_bufferSizeExt_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csr_bufferSizeExt_rank_1 = hipsparseDpruneDense2csr_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrNnz_full_rank(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnz_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnz_full_rank = hipsparseSpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseSpruneDense2csrNnz_rank_0(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnz_rank_0 = hipsparseSpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseSpruneDense2csrNnz_rank_1(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnz_rank_1 = hipsparseSpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseDpruneDense2csrNnz_full_rank(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnz_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnz_full_rank = hipsparseDpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseDpruneDense2csrNnz_rank_0(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnz_rank_0 = hipsparseDpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseDpruneDense2csrNnz_rank_1(handle,m,n,A,lda,threshold,descr,csrRowPtr,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnz_rank_1 = hipsparseDpruneDense2csrNnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseSpruneDense2csr_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csr_full_rank = hipsparseSpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseSpruneDense2csr_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csr_rank_0 = hipsparseSpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseSpruneDense2csr_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csr_rank_1 = hipsparseSpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseDpruneDense2csr_full_rank(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csr_full_rank = hipsparseDpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseDpruneDense2csr_rank_0(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csr_rank_0 = hipsparseDpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseDpruneDense2csr_rank_1(handle,m,n,A,lda,threshold,descr,csrVal,csrRowPtr,csrColInd,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csr_rank_1 = hipsparseDpruneDense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),buffer)
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSize_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSize_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSize_full_rank = hipsparseSpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSize_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSize_rank_0 = hipsparseSpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSize_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSize_rank_1 = hipsparseSpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSize_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSize_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSize_full_rank = hipsparseDpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSize_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSize_rank_0 = hipsparseDpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSize_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSize_rank_1 = hipsparseDpruneDense2csrByPercentage_bufferSize_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSizeExt_full_rank = hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_0 = hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneDense2csrByPercentage_bufferSizeExt_rank_1 = hipsparseSpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSizeExt_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSizeExt_full_rank = hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_0 = hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneDense2csrByPercentage_bufferSizeExt_rank_1 = hipsparseDpruneDense2csrByPercentage_bufferSizeExt_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneDense2csrNnzByPercentage_full_rank(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnzByPercentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnzByPercentage_full_rank = hipsparseSpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseSpruneDense2csrNnzByPercentage_rank_0(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnzByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnzByPercentage_rank_0 = hipsparseSpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseSpruneDense2csrNnzByPercentage_rank_1(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrNnzByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrNnzByPercentage_rank_1 = hipsparseSpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrNnzByPercentage_full_rank(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnzByPercentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnzByPercentage_full_rank = hipsparseDpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrNnzByPercentage_rank_0(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnzByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnzByPercentage_rank_0 = hipsparseDpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrNnzByPercentage_rank_1(handle,m,n,A,lda,percentage,descr,csrRowPtr,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrNnzByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrNnzByPercentage_rank_1 = hipsparseDpruneDense2csrNnzByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrRowPtr),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseSpruneDense2csrByPercentage_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrByPercentage_full_rank = hipsparseSpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseSpruneDense2csrByPercentage_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrByPercentage_rank_0 = hipsparseSpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseSpruneDense2csrByPercentage_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneDense2csrByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneDense2csrByPercentage_rank_1 = hipsparseSpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrByPercentage_full_rank(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrByPercentage_full_rank = hipsparseDpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrByPercentage_rank_0(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target :: csrVal
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrByPercentage_rank_0 = hipsparseDpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseDpruneDense2csrByPercentage_rank_1(handle,m,n,A,lda,percentage,descr,csrVal,csrRowPtr,csrColInd,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneDense2csrByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csrVal
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneDense2csrByPercentage_rank_1 = hipsparseDpruneDense2csrByPercentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csrVal),c_loc(csrRowPtr),c_loc(csrColInd),myInfo,buffer)
    end function

    function hipsparseSdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseSdense2csc_full_rank = hipsparseSdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseSdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      real(c_float),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      !
      hipsparseSdense2csc_rank_0 = hipsparseSdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseSdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseSdense2csc_rank_1 = hipsparseSdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseDdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseDdense2csc_full_rank = hipsparseDdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseDdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      real(c_double),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      !
      hipsparseDdense2csc_rank_0 = hipsparseDdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseDdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseDdense2csc_rank_1 = hipsparseDdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseCdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseCdense2csc_full_rank = hipsparseCdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseCdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      complex(c_float_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      !
      hipsparseCdense2csc_rank_0 = hipsparseCdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseCdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseCdense2csc_rank_1 = hipsparseCdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseZdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseZdense2csc_full_rank = hipsparseZdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseZdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      complex(c_double_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      !
      hipsparseZdense2csc_rank_0 = hipsparseZdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseZdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      !
      hipsparseZdense2csc_rank_1 = hipsparseZdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr))
    end function

    function hipsparseScsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseScsr2dense_full_rank = hipsparseScsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseScsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: A
      integer(c_int),value :: ld
      !
      hipsparseScsr2dense_rank_0 = hipsparseScsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseScsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseScsr2dense_rank_1 = hipsparseScsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseDcsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsr2dense_full_rank = hipsparseDcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseDcsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsr2dense_rank_0 = hipsparseDcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseDcsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsr2dense_rank_1 = hipsparseDcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseCcsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsr2dense_full_rank = hipsparseCcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseCcsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsr2dense_rank_0 = hipsparseCcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseCcsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsr2dense_rank_1 = hipsparseCcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseZcsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsr2dense_full_rank = hipsparseZcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseZcsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsr2dense_rank_0 = hipsparseZcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseZcsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsr2dense_rank_1 = hipsparseZcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function hipsparseScsc2dense_full_rank(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseScsc2dense_full_rank = hipsparseScsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseScsc2dense_rank_0(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      real(c_float),target :: A
      integer(c_int),value :: ld
      !
      hipsparseScsc2dense_rank_0 = hipsparseScsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseScsc2dense_rank_1(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseScsc2dense_rank_1 = hipsparseScsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseDcsc2dense_full_rank(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsc2dense_full_rank = hipsparseDcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseDcsc2dense_rank_0(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      real(c_double),target :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsc2dense_rank_0 = hipsparseDcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseDcsc2dense_rank_1(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseDcsc2dense_rank_1 = hipsparseDcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseCcsc2dense_full_rank(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsc2dense_full_rank = hipsparseCcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseCcsc2dense_rank_0(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsc2dense_rank_0 = hipsparseCcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseCcsc2dense_rank_1(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseCcsc2dense_rank_1 = hipsparseCcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseZcsc2dense_full_rank(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsc2dense_full_rank = hipsparseZcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseZcsc2dense_rank_0(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsc2dense_rank_0 = hipsparseZcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseZcsc2dense_rank_1(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      hipsparseZcsc2dense_rank_1 = hipsparseZcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),c_loc(A),ld)
    end function

    function hipsparseXcsr2bsrNnz_rank_0(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2bsrNnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      integer(c_int),target :: bsrRowPtrC
      integer(c_int),target :: bsrNnzb
      !
      hipsparseXcsr2bsrNnz_rank_0 = hipsparseXcsr2bsrNnz_orig(handle,dirA,m,n,descrA,c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrRowPtrC),c_loc(bsrNnzb))
    end function

    function hipsparseXcsr2bsrNnz_rank_1(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2bsrNnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: bsrRowPtrC
      integer(c_int),target,dimension(:) :: bsrNnzb
      !
      hipsparseXcsr2bsrNnz_rank_1 = hipsparseXcsr2bsrNnz_orig(handle,dirA,m,n,descrA,c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrRowPtrC),c_loc(bsrNnzb))
    end function

    function hipsparseSnnz_compress_rank_0(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: nnzPerRow
      integer(c_int),target :: nnzC
      real(c_float),value :: tol
      !
      hipsparseSnnz_compress_rank_0 = hipsparseSnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseSnnz_compress_rank_1(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: nnzPerRow
      integer(c_int),target,dimension(:) :: nnzC
      real(c_float),value :: tol
      !
      hipsparseSnnz_compress_rank_1 = hipsparseSnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseDnnz_compress_rank_0(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: nnzPerRow
      integer(c_int),target :: nnzC
      real(c_double),value :: tol
      !
      hipsparseDnnz_compress_rank_0 = hipsparseDnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseDnnz_compress_rank_1(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: nnzPerRow
      integer(c_int),target,dimension(:) :: nnzC
      real(c_double),value :: tol
      !
      hipsparseDnnz_compress_rank_1 = hipsparseDnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseCnnz_compress_rank_0(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: nnzPerRow
      integer(c_int),target :: nnzC
      complex(c_float_complex),value :: tol
      !
      hipsparseCnnz_compress_rank_0 = hipsparseCnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseCnnz_compress_rank_1(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: nnzPerRow
      integer(c_int),target,dimension(:) :: nnzC
      complex(c_float_complex),value :: tol
      !
      hipsparseCnnz_compress_rank_1 = hipsparseCnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseZnnz_compress_rank_0(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: nnzPerRow
      integer(c_int),target :: nnzC
      complex(c_double_complex),value :: tol
      !
      hipsparseZnnz_compress_rank_0 = hipsparseZnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseZnnz_compress_rank_1(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: nnzPerRow
      integer(c_int),target,dimension(:) :: nnzC
      complex(c_double_complex),value :: tol
      !
      hipsparseZnnz_compress_rank_1 = hipsparseZnnz_compress_orig(handle,m,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(nnzPerRow),c_loc(nnzC),tol)
    end function

    function hipsparseXcsr2coo_rank_0(handle,csrRowPtr,nnz,m,cooRowInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2coo_rank_0
      type(c_ptr),value :: handle
      integer(c_int),target :: csrRowPtr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target :: cooRowInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseXcsr2coo_rank_0 = hipsparseXcsr2coo_orig(handle,c_loc(csrRowPtr),nnz,m,c_loc(cooRowInd),idxBase)
    end function

    function hipsparseXcsr2coo_rank_1(handle,csrRowPtr,nnz,m,cooRowInd,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2coo_rank_1
      type(c_ptr),value :: handle
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target,dimension(:) :: cooRowInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseXcsr2coo_rank_1 = hipsparseXcsr2coo_orig(handle,c_loc(csrRowPtr),nnz,m,c_loc(cooRowInd),idxBase)
    end function

    function hipsparseScsr2csc_rank_0(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),target :: csrSortedVal
      integer(c_int),target :: csrSortedRowPtr
      integer(c_int),target :: csrSortedColInd
      real(c_float),target :: cscSortedVal
      integer(c_int),target :: cscSortedRowInd
      integer(c_int),target :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseScsr2csc_rank_0 = hipsparseScsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseScsr2csc_rank_1(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: csrSortedVal
      integer(c_int),target,dimension(:) :: csrSortedRowPtr
      integer(c_int),target,dimension(:) :: csrSortedColInd
      real(c_float),target,dimension(:) :: cscSortedVal
      integer(c_int),target,dimension(:) :: cscSortedRowInd
      integer(c_int),target,dimension(:) :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseScsr2csc_rank_1 = hipsparseScsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseDcsr2csc_rank_0(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),target :: csrSortedVal
      integer(c_int),target :: csrSortedRowPtr
      integer(c_int),target :: csrSortedColInd
      real(c_double),target :: cscSortedVal
      integer(c_int),target :: cscSortedRowInd
      integer(c_int),target :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDcsr2csc_rank_0 = hipsparseDcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseDcsr2csc_rank_1(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: csrSortedVal
      integer(c_int),target,dimension(:) :: csrSortedRowPtr
      integer(c_int),target,dimension(:) :: csrSortedColInd
      real(c_double),target,dimension(:) :: cscSortedVal
      integer(c_int),target,dimension(:) :: cscSortedRowInd
      integer(c_int),target,dimension(:) :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseDcsr2csc_rank_1 = hipsparseDcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseCcsr2csc_rank_0(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: csrSortedVal
      integer(c_int),target :: csrSortedRowPtr
      integer(c_int),target :: csrSortedColInd
      complex(c_float_complex),target :: cscSortedVal
      integer(c_int),target :: cscSortedRowInd
      integer(c_int),target :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCcsr2csc_rank_0 = hipsparseCcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseCcsr2csc_rank_1(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: csrSortedVal
      integer(c_int),target,dimension(:) :: csrSortedRowPtr
      integer(c_int),target,dimension(:) :: csrSortedColInd
      complex(c_float_complex),target,dimension(:) :: cscSortedVal
      integer(c_int),target,dimension(:) :: cscSortedRowInd
      integer(c_int),target,dimension(:) :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseCcsr2csc_rank_1 = hipsparseCcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseZcsr2csc_rank_0(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: csrSortedVal
      integer(c_int),target :: csrSortedRowPtr
      integer(c_int),target :: csrSortedColInd
      complex(c_double_complex),target :: cscSortedVal
      integer(c_int),target :: cscSortedRowInd
      integer(c_int),target :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZcsr2csc_rank_0 = hipsparseZcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseZcsr2csc_rank_1(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: csrSortedVal
      integer(c_int),target,dimension(:) :: csrSortedRowPtr
      integer(c_int),target,dimension(:) :: csrSortedColInd
      complex(c_double_complex),target,dimension(:) :: cscSortedVal
      integer(c_int),target,dimension(:) :: cscSortedRowInd
      integer(c_int),target,dimension(:) :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseZcsr2csc_rank_1 = hipsparseZcsr2csc_orig(handle,m,n,nnz,c_loc(csrSortedVal),c_loc(csrSortedRowPtr),c_loc(csrSortedColInd),c_loc(cscSortedVal),c_loc(cscSortedRowInd),c_loc(cscSortedColPtr),copyValues,idxBase)
    end function

    function hipsparseScsr2hyb_rank_0(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseScsr2hyb_rank_0 = hipsparseScsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseScsr2hyb_rank_1(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseScsr2hyb_rank_1 = hipsparseScsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseDcsr2hyb_rank_0(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseDcsr2hyb_rank_0 = hipsparseDcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseDcsr2hyb_rank_1(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseDcsr2hyb_rank_1 = hipsparseDcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseCcsr2hyb_rank_0(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseCcsr2hyb_rank_0 = hipsparseCcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseCcsr2hyb_rank_1(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseCcsr2hyb_rank_1 = hipsparseCcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseZcsr2hyb_rank_0(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseZcsr2hyb_rank_0 = hipsparseZcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseZcsr2hyb_rank_1(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
      !
      hipsparseZcsr2hyb_rank_1 = hipsparseZcsr2hyb_orig(handle,m,n,descrA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA),hybA,userEllWidth,partitionType)
    end function

    function hipsparseScsr2bsr_rank_0(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_float),target :: bsrValC
      integer(c_int),target :: bsrRowPtrC
      integer(c_int),target :: bsrColIndC
      !
      hipsparseScsr2bsr_rank_0 = hipsparseScsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseScsr2bsr_rank_1(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: bsrValC
      integer(c_int),target,dimension(:) :: bsrRowPtrC
      integer(c_int),target,dimension(:) :: bsrColIndC
      !
      hipsparseScsr2bsr_rank_1 = hipsparseScsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseDcsr2bsr_rank_0(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_double),target :: bsrValC
      integer(c_int),target :: bsrRowPtrC
      integer(c_int),target :: bsrColIndC
      !
      hipsparseDcsr2bsr_rank_0 = hipsparseDcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseDcsr2bsr_rank_1(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: bsrValC
      integer(c_int),target,dimension(:) :: bsrRowPtrC
      integer(c_int),target,dimension(:) :: bsrColIndC
      !
      hipsparseDcsr2bsr_rank_1 = hipsparseDcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseCcsr2bsr_rank_0(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: bsrValC
      integer(c_int),target :: bsrRowPtrC
      integer(c_int),target :: bsrColIndC
      !
      hipsparseCcsr2bsr_rank_0 = hipsparseCcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseCcsr2bsr_rank_1(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: bsrValC
      integer(c_int),target,dimension(:) :: bsrRowPtrC
      integer(c_int),target,dimension(:) :: bsrColIndC
      !
      hipsparseCcsr2bsr_rank_1 = hipsparseCcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseZcsr2bsr_rank_0(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: bsrValC
      integer(c_int),target :: bsrRowPtrC
      integer(c_int),target :: bsrColIndC
      !
      hipsparseZcsr2bsr_rank_0 = hipsparseZcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseZcsr2bsr_rank_1(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: bsrValC
      integer(c_int),target,dimension(:) :: bsrRowPtrC
      integer(c_int),target,dimension(:) :: bsrColIndC
      !
      hipsparseZcsr2bsr_rank_1 = hipsparseZcsr2bsr_orig(handle,dirA,m,n,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),blockDim,descrC,c_loc(bsrValC),c_loc(bsrRowPtrC),c_loc(bsrColIndC))
    end function

    function hipsparseSbsr2csr_rank_0(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      real(c_float),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseSbsr2csr_rank_0 = hipsparseSbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseSbsr2csr_rank_1(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseSbsr2csr_rank_1 = hipsparseSbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDbsr2csr_rank_0(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      real(c_double),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseDbsr2csr_rank_0 = hipsparseDbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseDbsr2csr_rank_1(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseDbsr2csr_rank_1 = hipsparseDbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCbsr2csr_rank_0(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_float_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseCbsr2csr_rank_0 = hipsparseCbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseCbsr2csr_rank_1(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_float_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseCbsr2csr_rank_1 = hipsparseCbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZbsr2csr_rank_0(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: bsrValA
      integer(c_int),target :: bsrRowPtrA
      integer(c_int),target :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_double_complex),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      !
      hipsparseZbsr2csr_rank_0 = hipsparseZbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseZbsr2csr_rank_1(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: bsrValA
      integer(c_int),target,dimension(:) :: bsrRowPtrA
      integer(c_int),target,dimension(:) :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      complex(c_double_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      !
      hipsparseZbsr2csr_rank_1 = hipsparseZbsr2csr_orig(handle,dirA,mb,nb,descrA,c_loc(bsrValA),c_loc(bsrRowPtrA),c_loc(bsrColIndA),blockDim,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC))
    end function

    function hipsparseScsr2csr_compress_rank_0(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrColIndA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: nnzPerRow
      real(c_float),target :: csrValC
      integer(c_int),target :: csrColIndC
      integer(c_int),target :: csrRowPtrC
      real(c_float),value :: tol
      !
      hipsparseScsr2csr_compress_rank_0 = hipsparseScsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseScsr2csr_compress_rank_1(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: nnzPerRow
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      real(c_float),value :: tol
      !
      hipsparseScsr2csr_compress_rank_1 = hipsparseScsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseDcsr2csr_compress_rank_0(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrColIndA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: nnzPerRow
      real(c_double),target :: csrValC
      integer(c_int),target :: csrColIndC
      integer(c_int),target :: csrRowPtrC
      real(c_double),value :: tol
      !
      hipsparseDcsr2csr_compress_rank_0 = hipsparseDcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseDcsr2csr_compress_rank_1(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: nnzPerRow
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      real(c_double),value :: tol
      !
      hipsparseDcsr2csr_compress_rank_1 = hipsparseDcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseCcsr2csr_compress_rank_0(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target :: csrValA
      integer(c_int),target :: csrColIndA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: nnzPerRow
      complex(c_float_complex),target :: csrValC
      integer(c_int),target :: csrColIndC
      integer(c_int),target :: csrRowPtrC
      complex(c_float_complex),value :: tol
      !
      hipsparseCcsr2csr_compress_rank_0 = hipsparseCcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseCcsr2csr_compress_rank_1(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_float_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: nnzPerRow
      complex(c_float_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      complex(c_float_complex),value :: tol
      !
      hipsparseCcsr2csr_compress_rank_1 = hipsparseCcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseZcsr2csr_compress_rank_0(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target :: csrValA
      integer(c_int),target :: csrColIndA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target :: nnzPerRow
      complex(c_double_complex),target :: csrValC
      integer(c_int),target :: csrColIndC
      integer(c_int),target :: csrRowPtrC
      complex(c_double_complex),value :: tol
      !
      hipsparseZcsr2csr_compress_rank_0 = hipsparseZcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseZcsr2csr_compress_rank_1(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      complex(c_double_complex),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrColIndA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),value :: nnzA
      integer(c_int),target,dimension(:) :: nnzPerRow
      complex(c_double_complex),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      complex(c_double_complex),value :: tol
      !
      hipsparseZcsr2csr_compress_rank_1 = hipsparseZcsr2csr_compress_orig(handle,m,n,descrA,c_loc(csrValA),c_loc(csrColIndA),c_loc(csrRowPtrA),nnzA,c_loc(nnzPerRow),c_loc(csrValC),c_loc(csrColIndC),c_loc(csrRowPtrC),tol)
    end function

    function hipsparseSpruneCsr2csr_bufferSize_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneCsr2csr_bufferSize_rank_0 = hipsparseSpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csr_bufferSize_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneCsr2csr_bufferSize_rank_1 = hipsparseSpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csr_bufferSize_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneCsr2csr_bufferSize_rank_0 = hipsparseDpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csr_bufferSize_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneCsr2csr_bufferSize_rank_1 = hipsparseDpruneCsr2csr_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csr_bufferSizeExt_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneCsr2csr_bufferSizeExt_rank_0 = hipsparseSpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csr_bufferSizeExt_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneCsr2csr_bufferSizeExt_rank_1 = hipsparseSpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csr_bufferSizeExt_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneCsr2csr_bufferSizeExt_rank_0 = hipsparseDpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csr_bufferSizeExt_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneCsr2csr_bufferSizeExt_rank_1 = hipsparseDpruneCsr2csr_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csrNnz_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrNnz_rank_0 = hipsparseSpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseSpruneCsr2csrNnz_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrNnz_rank_1 = hipsparseSpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseDpruneCsr2csrNnz_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrNnz_rank_0 = hipsparseDpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseDpruneCsr2csrNnz_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrRowPtrC,nnzTotalDevHostPtr,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrNnz_rank_1 = hipsparseDpruneCsr2csrNnz_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,buffer)
    end function

    function hipsparseSpruneCsr2csr_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csr_rank_0 = hipsparseSpruneCsr2csr_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),buffer)
    end function

    function hipsparseSpruneCsr2csr_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float) :: threshold
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csr_rank_1 = hipsparseSpruneCsr2csr_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),buffer)
    end function

    function hipsparseDpruneCsr2csr_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csr_rank_0 = hipsparseDpruneCsr2csr_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),buffer)
    end function

    function hipsparseDpruneCsr2csr_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,threshold,descrC,csrValC,csrRowPtrC,csrColIndC,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double) :: threshold
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csr_rank_1 = hipsparseDpruneCsr2csr_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),threshold,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),buffer)
    end function

    function hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_0 = hipsparseSpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneCsr2csrByPercentage_bufferSize_rank_1 = hipsparseSpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_0 = hipsparseDpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneCsr2csrByPercentage_bufferSize_rank_1 = hipsparseDpruneCsr2csrByPercentage_bufferSize_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_0 = hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_rank_1 = hipsparseSpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target :: bufferSize
      !
      hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_0 = hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,bufferSize)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      integer(c_size_t),target,dimension(:) :: bufferSize
      !
      hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_rank_1 = hipsparseDpruneCsr2csrByPercentage_bufferSizeExt_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,c_loc(bufferSize))
    end function

    function hipsparseSpruneCsr2csrNnzByPercentage_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnzByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrNnzByPercentage_rank_0 = hipsparseSpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseSpruneCsr2csrNnzByPercentage_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrNnzByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrNnzByPercentage_rank_1 = hipsparseSpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseDpruneCsr2csrNnzByPercentage_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnzByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      integer(c_int),target :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrNnzByPercentage_rank_0 = hipsparseDpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseDpruneCsr2csrNnzByPercentage_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrNnzByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int) :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrNnzByPercentage_rank_1 = hipsparseDpruneCsr2csrNnzByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrRowPtrC),nnzTotalDevHostPtr,myInfo,buffer)
    end function

    function hipsparseSpruneCsr2csrByPercentage_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrByPercentage_rank_0 = hipsparseSpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,buffer)
    end function

    function hipsparseSpruneCsr2csrByPercentage_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSpruneCsr2csrByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_float),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_float),value :: percentage
      type(c_ptr),value :: descrC
      real(c_float),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseSpruneCsr2csrByPercentage_rank_1 = hipsparseSpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,buffer)
    end function

    function hipsparseDpruneCsr2csrByPercentage_rank_0(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target :: csrValA
      integer(c_int),target :: csrRowPtrA
      integer(c_int),target :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target :: csrValC
      integer(c_int),target :: csrRowPtrC
      integer(c_int),target :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrByPercentage_rank_0 = hipsparseDpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,buffer)
    end function

    function hipsparseDpruneCsr2csrByPercentage_rank_1(handle,m,n,nnzA,descrA,csrValA,csrRowPtrA,csrColIndA,percentage,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,buffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDpruneCsr2csrByPercentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      real(c_double),target,dimension(:) :: csrValA
      integer(c_int),target,dimension(:) :: csrRowPtrA
      integer(c_int),target,dimension(:) :: csrColIndA
      real(c_double),value :: percentage
      type(c_ptr),value :: descrC
      real(c_double),target,dimension(:) :: csrValC
      integer(c_int),target,dimension(:) :: csrRowPtrC
      integer(c_int),target,dimension(:) :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: buffer
      !
      hipsparseDpruneCsr2csrByPercentage_rank_1 = hipsparseDpruneCsr2csrByPercentage_orig(handle,m,n,nnzA,descrA,c_loc(csrValA),c_loc(csrRowPtrA),c_loc(csrColIndA),percentage,descrC,c_loc(csrValC),c_loc(csrRowPtrC),c_loc(csrColIndC),myInfo,buffer)
    end function

    function hipsparseShyb2csr_rank_0(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_float),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      !
      hipsparseShyb2csr_rank_0 = hipsparseShyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseShyb2csr_rank_1(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_float),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      !
      hipsparseShyb2csr_rank_1 = hipsparseShyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseDhyb2csr_rank_0(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_double),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      !
      hipsparseDhyb2csr_rank_0 = hipsparseDhyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseDhyb2csr_rank_1(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      real(c_double),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      !
      hipsparseDhyb2csr_rank_1 = hipsparseDhyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseChyb2csr_rank_0(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_float_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      !
      hipsparseChyb2csr_rank_0 = hipsparseChyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseChyb2csr_rank_1(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_float_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      !
      hipsparseChyb2csr_rank_1 = hipsparseChyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseZhyb2csr_rank_0(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_double_complex),target :: csrSortedValA
      integer(c_int),target :: csrSortedRowPtrA
      integer(c_int),target :: csrSortedColIndA
      !
      hipsparseZhyb2csr_rank_0 = hipsparseZhyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseZhyb2csr_rank_1(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      complex(c_double_complex),target,dimension(:) :: csrSortedValA
      integer(c_int),target,dimension(:) :: csrSortedRowPtrA
      integer(c_int),target,dimension(:) :: csrSortedColIndA
      !
      hipsparseZhyb2csr_rank_1 = hipsparseZhyb2csr_orig(handle,descrA,hybA,c_loc(csrSortedValA),c_loc(csrSortedRowPtrA),c_loc(csrSortedColIndA))
    end function

    function hipsparseXcoo2csr_rank_0(handle,cooRowInd,nnz,m,csrRowPtr,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoo2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),target :: cooRowInd
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target :: csrRowPtr
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseXcoo2csr_rank_0 = hipsparseXcoo2csr_orig(handle,c_loc(cooRowInd),nnz,m,c_loc(csrRowPtr),idxBase)
    end function

    function hipsparseXcoo2csr_rank_1(handle,cooRowInd,nnz,m,csrRowPtr,idxBase)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoo2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),target,dimension(:) :: cooRowInd
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
      !
      hipsparseXcoo2csr_rank_1 = hipsparseXcoo2csr_orig(handle,c_loc(cooRowInd),nnz,m,c_loc(csrRowPtr),idxBase)
    end function

    function hipsparseCreateIdentityPermutation_rank_0(handle,n,p)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateIdentityPermutation_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),target :: p
      !
      hipsparseCreateIdentityPermutation_rank_0 = hipsparseCreateIdentityPermutation_orig(handle,n,c_loc(p))
    end function

    function hipsparseCreateIdentityPermutation_rank_1(handle,n,p)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateIdentityPermutation_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),target,dimension(:) :: p
      !
      hipsparseCreateIdentityPermutation_rank_1 = hipsparseCreateIdentityPermutation_orig(handle,n,c_loc(p))
    end function

    function hipsparseXcsrsort_bufferSizeExt_rank_0(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcsrsort_bufferSizeExt_rank_0 = hipsparseXcsrsort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(csrRowPtr),c_loc(csrColInd),pBufferSizeInBytes)
    end function

    function hipsparseXcsrsort_bufferSizeExt_rank_1(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcsrsort_bufferSizeExt_rank_1 = hipsparseXcsrsort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(csrRowPtr),c_loc(csrColInd),pBufferSizeInBytes)
    end function

    function hipsparseXcsrsort_full_rank(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_int),target,dimension(:,:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcsrsort_full_rank = hipsparseXcsrsort_orig(handle,m,n,nnz,descrA,c_loc(csrRowPtr),c_loc(csrColInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcsrsort_rank_0(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target :: csrRowPtr
      integer(c_int),target :: csrColInd
      integer(c_int),target :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcsrsort_rank_0 = hipsparseXcsrsort_orig(handle,m,n,nnz,descrA,c_loc(csrRowPtr),c_loc(csrColInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcsrsort_rank_1(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target,dimension(:) :: csrRowPtr
      integer(c_int),target,dimension(:) :: csrColInd
      integer(c_int),target,dimension(:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcsrsort_rank_1 = hipsparseXcsrsort_orig(handle,m,n,nnz,descrA,c_loc(csrRowPtr),c_loc(csrColInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcscsort_bufferSizeExt_rank_0(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: cscColPtr
      integer(c_int),target :: cscRowInd
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcscsort_bufferSizeExt_rank_0 = hipsparseXcscsort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(cscColPtr),c_loc(cscRowInd),pBufferSizeInBytes)
    end function

    function hipsparseXcscsort_bufferSizeExt_rank_1(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cscColPtr
      integer(c_int),target,dimension(:) :: cscRowInd
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcscsort_bufferSizeExt_rank_1 = hipsparseXcscsort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(cscColPtr),c_loc(cscRowInd),pBufferSizeInBytes)
    end function

    function hipsparseXcscsort_full_rank(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target,dimension(:) :: cscColPtr
      integer(c_int),target,dimension(:) :: cscRowInd
      integer(c_int),target,dimension(:,:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcscsort_full_rank = hipsparseXcscsort_orig(handle,m,n,nnz,descrA,c_loc(cscColPtr),c_loc(cscRowInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcscsort_rank_0(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target :: cscColPtr
      integer(c_int),target :: cscRowInd
      integer(c_int),target :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcscsort_rank_0 = hipsparseXcscsort_orig(handle,m,n,nnz,descrA,c_loc(cscColPtr),c_loc(cscRowInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcscsort_rank_1(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      integer(c_int),target,dimension(:) :: cscColPtr
      integer(c_int),target,dimension(:) :: cscRowInd
      integer(c_int),target,dimension(:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcscsort_rank_1 = hipsparseXcscsort_orig(handle,m,n,nnz,descrA,c_loc(cscColPtr),c_loc(cscRowInd),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosort_bufferSizeExt_rank_0(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosort_bufferSizeExt_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: cooRows
      integer(c_int),target :: cooCols
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcoosort_bufferSizeExt_rank_0 = hipsparseXcoosort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),pBufferSizeInBytes)
    end function

    function hipsparseXcoosort_bufferSizeExt_rank_1(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosort_bufferSizeExt_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cooRows
      integer(c_int),target,dimension(:) :: cooCols
      integer(c_size_t) :: pBufferSizeInBytes
      !
      hipsparseXcoosort_bufferSizeExt_rank_1 = hipsparseXcoosort_bufferSizeExt_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),pBufferSizeInBytes)
    end function

    function hipsparseXcoosortByRow_full_rank(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByRow_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cooRows
      integer(c_int),target,dimension(:) :: cooCols
      integer(c_int),target,dimension(:,:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByRow_full_rank = hipsparseXcoosortByRow_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosortByRow_rank_0(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByRow_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: cooRows
      integer(c_int),target :: cooCols
      integer(c_int),target :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByRow_rank_0 = hipsparseXcoosortByRow_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosortByRow_rank_1(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByRow_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cooRows
      integer(c_int),target,dimension(:) :: cooCols
      integer(c_int),target,dimension(:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByRow_rank_1 = hipsparseXcoosortByRow_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosortByColumn_full_rank(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByColumn_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cooRows
      integer(c_int),target,dimension(:) :: cooCols
      integer(c_int),target,dimension(:,:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByColumn_full_rank = hipsparseXcoosortByColumn_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosortByColumn_rank_0(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByColumn_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: cooRows
      integer(c_int),target :: cooCols
      integer(c_int),target :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByColumn_rank_0 = hipsparseXcoosortByColumn_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

    function hipsparseXcoosortByColumn_rank_1(handle,m,n,nnz,cooRows,cooCols,P,pBuffer)
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByColumn_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: cooRows
      integer(c_int),target,dimension(:) :: cooCols
      integer(c_int),target,dimension(:) :: P
      type(c_ptr),value :: pBuffer
      !
      hipsparseXcoosortByColumn_rank_1 = hipsparseXcoosortByColumn_orig(handle,m,n,nnz,c_loc(cooRows),c_loc(cooCols),c_loc(P),pBuffer)
    end function

  
#endif
end module hipfort_hipsparse