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

module hipfort_hipblas_auxiliary

  interface hipblasSetVector
#ifdef USE_CUDA_NAMES
    function hipblasSetVector_orig(n,elem_size,x,incx,y,incy) bind(c, name="cublasSetVector") result(ret)
#else
    function hipblasSetVector_orig(n,elem_size,x,incx,y,incy) bind(c, name="hipblasSetVector") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasSetVector_l_rank_0,hipblasSetVector_l_full_rank,hipblasSetVector_i4_rank_0,hipblasSetVector_i4_full_rank,hipblasSetVector_i8_rank_0,hipblasSetVector_i8_full_rank,hipblasSetVector_r4_rank_0,hipblasSetVector_r4_full_rank,hipblasSetVector_r8_rank_0,hipblasSetVector_r8_full_rank,hipblasSetVector_c4_rank_0,hipblasSetVector_c4_full_rank,hipblasSetVector_c8_rank_0,hipblasSetVector_c8_full_rank 
#endif
  end interface

  interface hipblasGetVector
#ifdef USE_CUDA_NAMES
    function hipblasGetVector_orig(n,elem_size,x,incx,y,incy) bind(c, name="cublasGetVector") result(ret)
#else
    function hipblasGetVector_orig(n,elem_size,x,incx,y,incy) bind(c, name="hipblasGetVector") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasGetVector_l_rank_0,hipblasGetVector_l_full_rank,hipblasGetVector_i4_rank_0,hipblasGetVector_i4_full_rank,hipblasGetVector_i8_rank_0,hipblasGetVector_i8_full_rank,hipblasGetVector_r4_rank_0,hipblasGetVector_r4_full_rank,hipblasGetVector_r8_rank_0,hipblasGetVector_r8_full_rank,hipblasGetVector_c4_rank_0,hipblasGetVector_c4_full_rank,hipblasGetVector_c8_rank_0,hipblasGetVector_c8_full_rank 
#endif
  end interface

  interface hipblasSetMatrix
#ifdef USE_CUDA_NAMES
    function hipblasSetMatrix_orig(rows,cols,elem_size,A,lda,B,ldb) bind(c, name="cublasSetMatrix") result(ret)
#else
    function hipblasSetMatrix_orig(rows,cols,elem_size,A,lda,B,ldb) bind(c, name="hipblasSetMatrix") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasSetMatrix_l_full_rank,hipblasSetMatrix_l_rank_0,hipblasSetMatrix_l_rank_1,hipblasSetMatrix_i4_full_rank,hipblasSetMatrix_i4_rank_0,hipblasSetMatrix_i4_rank_1,hipblasSetMatrix_i8_full_rank,hipblasSetMatrix_i8_rank_0,hipblasSetMatrix_i8_rank_1,hipblasSetMatrix_r4_full_rank,hipblasSetMatrix_r4_rank_0,hipblasSetMatrix_r4_rank_1,hipblasSetMatrix_r8_full_rank,hipblasSetMatrix_r8_rank_0,hipblasSetMatrix_r8_rank_1,hipblasSetMatrix_c4_full_rank,hipblasSetMatrix_c4_rank_0,hipblasSetMatrix_c4_rank_1,hipblasSetMatrix_c8_full_rank,hipblasSetMatrix_c8_rank_0,hipblasSetMatrix_c8_rank_1 
#endif
  end interface

  interface hipblasGetMatrix
#ifdef USE_CUDA_NAMES
    function hipblasGetMatrix_orig(rows,cols,elem_size,A,lda,B,ldb) bind(c, name="cublasGetMatrix") result(ret)
#else
    function hipblasGetMatrix_orig(rows,cols,elem_size,A,lda,B,ldb) bind(c, name="hipblasGetMatrix") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasGetMatrix_l_full_rank,hipblasGetMatrix_l_rank_0,hipblasGetMatrix_l_rank_1,hipblasGetMatrix_i4_full_rank,hipblasGetMatrix_i4_rank_0,hipblasGetMatrix_i4_rank_1,hipblasGetMatrix_i8_full_rank,hipblasGetMatrix_i8_rank_0,hipblasGetMatrix_i8_rank_1,hipblasGetMatrix_r4_full_rank,hipblasGetMatrix_r4_rank_0,hipblasGetMatrix_r4_rank_1,hipblasGetMatrix_r8_full_rank,hipblasGetMatrix_r8_rank_0,hipblasGetMatrix_r8_rank_1,hipblasGetMatrix_c4_full_rank,hipblasGetMatrix_c4_rank_0,hipblasGetMatrix_c4_rank_1,hipblasGetMatrix_c8_full_rank,hipblasGetMatrix_c8_rank_0,hipblasGetMatrix_c8_rank_1 
#endif
  end interface

  interface hipblasSetVectorAsync
#ifdef USE_CUDA_NAMES
    function hipblasSetVectorAsync_orig(n,elem_size,x,incx,y,incy,stream) bind(c, name="cublasSetVectorAsync") result(ret)
#else
    function hipblasSetVectorAsync_orig(n,elem_size,x,incx,y,incy,stream) bind(c, name="hipblasSetVectorAsync") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasSetVectorAsync_l_rank_0,hipblasSetVectorAsync_l_full_rank,hipblasSetVectorAsync_i4_rank_0,hipblasSetVectorAsync_i4_full_rank,hipblasSetVectorAsync_i8_rank_0,hipblasSetVectorAsync_i8_full_rank,hipblasSetVectorAsync_r4_rank_0,hipblasSetVectorAsync_r4_full_rank,hipblasSetVectorAsync_r8_rank_0,hipblasSetVectorAsync_r8_full_rank,hipblasSetVectorAsync_c4_rank_0,hipblasSetVectorAsync_c4_full_rank,hipblasSetVectorAsync_c8_rank_0,hipblasSetVectorAsync_c8_full_rank 
#endif
  end interface

  interface hipblasGetVectorAsync
#ifdef USE_CUDA_NAMES
    function hipblasGetVectorAsync_orig(n,elem_size,x,incx,y,incy,stream) bind(c, name="cublasGetVectorAsync") result(ret)
#else
    function hipblasGetVectorAsync_orig(n,elem_size,x,incx,y,incy,stream) bind(c, name="hipblasGetVectorAsync") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasGetVectorAsync_l_rank_0,hipblasGetVectorAsync_l_full_rank,hipblasGetVectorAsync_i4_rank_0,hipblasGetVectorAsync_i4_full_rank,hipblasGetVectorAsync_i8_rank_0,hipblasGetVectorAsync_i8_full_rank,hipblasGetVectorAsync_r4_rank_0,hipblasGetVectorAsync_r4_full_rank,hipblasGetVectorAsync_r8_rank_0,hipblasGetVectorAsync_r8_full_rank,hipblasGetVectorAsync_c4_rank_0,hipblasGetVectorAsync_c4_full_rank,hipblasGetVectorAsync_c8_rank_0,hipblasGetVectorAsync_c8_full_rank 
#endif
  end interface

  interface hipblasSetMatrixAsync
#ifdef USE_CUDA_NAMES
    function hipblasSetMatrixAsync_orig(rows,cols,elem_size,A,lda,B,ldb,stream) bind(c, name="cublasSetMatrixAsync") result(ret)
#else
    function hipblasSetMatrixAsync_orig(rows,cols,elem_size,A,lda,B,ldb,stream) bind(c, name="hipblasSetMatrixAsync") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasSetMatrixAsync_l_full_rank,hipblasSetMatrixAsync_l_rank_0,hipblasSetMatrixAsync_l_rank_1,hipblasSetMatrixAsync_i4_full_rank,hipblasSetMatrixAsync_i4_rank_0,hipblasSetMatrixAsync_i4_rank_1,hipblasSetMatrixAsync_i8_full_rank,hipblasSetMatrixAsync_i8_rank_0,hipblasSetMatrixAsync_i8_rank_1,hipblasSetMatrixAsync_r4_full_rank,hipblasSetMatrixAsync_r4_rank_0,hipblasSetMatrixAsync_r4_rank_1,hipblasSetMatrixAsync_r8_full_rank,hipblasSetMatrixAsync_r8_rank_0,hipblasSetMatrixAsync_r8_rank_1,hipblasSetMatrixAsync_c4_full_rank,hipblasSetMatrixAsync_c4_rank_0,hipblasSetMatrixAsync_c4_rank_1,hipblasSetMatrixAsync_c8_full_rank,hipblasSetMatrixAsync_c8_rank_0,hipblasSetMatrixAsync_c8_rank_1 
#endif
  end interface

  interface hipblasGetMatrixAsync
#ifdef USE_CUDA_NAMES
    function hipblasGetMatrixAsync_orig(rows,cols,elem_size,A,lda,B,ldb,stream) bind(c, name="cublasGetMatrixAsync") result(ret)
#else
    function hipblasGetMatrixAsync_orig(rows,cols,elem_size,A,lda,B,ldb,stream) bind(c, name="hipblasGetMatrixAsync") result(ret)
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipblasGetMatrixAsync_l_full_rank,hipblasGetMatrixAsync_l_rank_0,hipblasGetMatrixAsync_l_rank_1,hipblasGetMatrixAsync_i4_full_rank,hipblasGetMatrixAsync_i4_rank_0,hipblasGetMatrixAsync_i4_rank_1,hipblasGetMatrixAsync_i8_full_rank,hipblasGetMatrixAsync_i8_rank_0,hipblasGetMatrixAsync_i8_rank_1,hipblasGetMatrixAsync_r4_full_rank,hipblasGetMatrixAsync_r4_rank_0,hipblasGetMatrixAsync_r4_rank_1,hipblasGetMatrixAsync_r8_full_rank,hipblasGetMatrixAsync_r8_rank_0,hipblasGetMatrixAsync_r8_rank_1,hipblasGetMatrixAsync_c4_full_rank,hipblasGetMatrixAsync_c4_rank_0,hipblasGetMatrixAsync_c4_rank_1,hipblasGetMatrixAsync_c8_full_rank,hipblasGetMatrixAsync_c8_rank_0,hipblasGetMatrixAsync_c8_rank_1 
#endif
  end interface

#ifdef USE_FPOINTER_INTERFACES
contains

    function hipblasSetVector_l_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target :: x
      integer(c_int),value :: incx
      logical,target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,1,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_l_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target,dimension(:) :: x
      integer(c_int),value :: incx
      logical,target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,1,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_l_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target :: x
      integer(c_int),value :: incx
      logical,target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,1,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_l_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target,dimension(:) :: x
      integer(c_int),value :: incx
      logical,target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,1,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_l_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:,:) :: A
      logical,target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,1,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_l_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target :: A
      integer(c_int),value :: lda
      logical,target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_l_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:) :: A
      integer(c_int),value :: lda
      logical,target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_l_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:,:) :: A
      logical,target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,1,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_l_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target :: A
      integer(c_int),value :: lda
      logical,target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_l_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:) :: A
      integer(c_int),value :: lda
      logical,target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_l_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target :: x
      integer(c_int),value :: incx
      logical,target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,1,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_l_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target,dimension(:) :: x
      integer(c_int),value :: incx
      logical,target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,1,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_l_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target :: x
      integer(c_int),value :: incx
      logical,target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,1,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_l_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      logical,target,dimension(:) :: x
      integer(c_int),value :: incx
      logical,target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,1,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_l_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:,:) :: A
      logical,target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,1,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_l_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target :: A
      integer(c_int),value :: lda
      logical,target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_l_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:) :: A
      integer(c_int),value :: lda
      logical,target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_l_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:,:) :: A
      logical,target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,1,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_l_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target :: A
      integer(c_int),value :: lda
      logical,target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_l_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      logical,target,dimension(:) :: A
      integer(c_int),value :: lda
      logical,target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,1,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_i4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target :: x
      integer(c_int),value :: incx
      integer(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_i4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_i4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target :: x
      integer(c_int),value :: incx
      integer(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_i4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_i4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:,:) :: A
      integer(4),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_i4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target :: A
      integer(c_int),value :: lda
      integer(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_i4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_i4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:,:) :: A
      integer(4),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_i4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target :: A
      integer(c_int),value :: lda
      integer(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_i4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_i4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target :: x
      integer(c_int),value :: incx
      integer(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_i4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_i4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target :: x
      integer(c_int),value :: incx
      integer(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_i4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_i4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:,:) :: A
      integer(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_i4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target :: A
      integer(c_int),value :: lda
      integer(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_i4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_i4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:,:) :: A
      integer(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_i4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target :: A
      integer(c_int),value :: lda
      integer(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_i4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_i8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target :: x
      integer(c_int),value :: incx
      integer(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_i8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_i8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target :: x
      integer(c_int),value :: incx
      integer(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_i8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_i8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:,:) :: A
      integer(8),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_i8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target :: A
      integer(c_int),value :: lda
      integer(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_i8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_i8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:,:) :: A
      integer(8),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_i8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target :: A
      integer(c_int),value :: lda
      integer(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_i8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_i8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target :: x
      integer(c_int),value :: incx
      integer(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_i8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_i8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target :: x
      integer(c_int),value :: incx
      integer(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_i8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      integer(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      integer(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_i8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:,:) :: A
      integer(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_i8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target :: A
      integer(c_int),value :: lda
      integer(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_i8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_i8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:,:) :: A
      integer(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_i8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target :: A
      integer(c_int),value :: lda
      integer(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_i8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      integer(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_r4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target :: x
      integer(c_int),value :: incx
      real(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_r4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_r4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target :: x
      integer(c_int),value :: incx
      real(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_r4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_r4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:,:) :: A
      real(4),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_r4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target :: A
      integer(c_int),value :: lda
      real(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_r4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_r4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:,:) :: A
      real(4),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_r4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target :: A
      integer(c_int),value :: lda
      real(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_r4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_r4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target :: x
      integer(c_int),value :: incx
      real(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_r4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_r4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target :: x
      integer(c_int),value :: incx
      real(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_r4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_r4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:,:) :: A
      real(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_r4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target :: A
      integer(c_int),value :: lda
      real(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_r4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_r4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:,:) :: A
      real(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_r4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target :: A
      integer(c_int),value :: lda
      real(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_r4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_r8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target :: x
      integer(c_int),value :: incx
      real(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_r8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_r8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target :: x
      integer(c_int),value :: incx
      real(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_r8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_r8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:,:) :: A
      real(8),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_r8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target :: A
      integer(c_int),value :: lda
      real(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_r8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_r8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:,:) :: A
      real(8),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_r8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target :: A
      integer(c_int),value :: lda
      real(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_r8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_r8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target :: x
      integer(c_int),value :: incx
      real(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_r8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_r8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target :: x
      integer(c_int),value :: incx
      real(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_r8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      real(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      real(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_r8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:,:) :: A
      real(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_r8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target :: A
      integer(c_int),value :: lda
      real(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_r8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_r8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:,:) :: A
      real(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_r8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target :: A
      integer(c_int),value :: lda
      real(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_r8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      real(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_c4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target :: x
      integer(c_int),value :: incx
      complex(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,2*4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_c4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,2*4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_c4_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target :: x
      integer(c_int),value :: incx
      complex(4),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,2*4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_c4_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,2*4,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_c4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:,:) :: A
      complex(4),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_c4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target :: A
      integer(c_int),value :: lda
      complex(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_c4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_c4_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:,:) :: A
      complex(4),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*4,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_c4_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target :: A
      integer(c_int),value :: lda
      complex(4),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_c4_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_c4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target :: x
      integer(c_int),value :: incx
      complex(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,2*4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_c4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,2*4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_c4_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target :: x
      integer(c_int),value :: incx
      complex(4),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,2*4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_c4_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(4),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(4),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,2*4,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_c4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:,:) :: A
      complex(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_c4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target :: A
      integer(c_int),value :: lda
      complex(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_c4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_c4_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:,:) :: A
      complex(4),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*4,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_c4_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target :: A
      integer(c_int),value :: lda
      complex(4),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_c4_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(4),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(4),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*4,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
    function hipblasSetVector_c8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target :: x
      integer(c_int),value :: incx
      complex(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,2*8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetVector_c8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasSetVector_orig(n,2*8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_c8_rank_0(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target :: x
      integer(c_int),value :: incx
      complex(8),target :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,2*8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasGetVector_c8_full_rank(n,x,incx,y,incy) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      !
      ret = hipblasGetVector_orig(n,2*8,c_loc(x),incx,c_loc(y),incy)
    end function

    function hipblasSetMatrix_c8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:,:) :: A
      complex(8),target,dimension(:,:) :: B
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasSetMatrix_c8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target :: A
      integer(c_int),value :: lda
      complex(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetMatrix_c8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasSetMatrix_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_c8_full_rank(rows,cols,A,B) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:,:) :: A
      complex(8),target,dimension(:,:) :: B
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*8,c_loc(A),size(A,1),c_loc(B),size(B,1))
    end function

    function hipblasGetMatrix_c8_rank_0(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target :: A
      integer(c_int),value :: lda
      complex(8),target :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasGetMatrix_c8_rank_1(rows,cols,A,lda,B,ldb) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      !
      ret = hipblasGetMatrix_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb)
    end function

    function hipblasSetVectorAsync_c8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target :: x
      integer(c_int),value :: incx
      complex(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,2*8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetVectorAsync_c8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasSetVectorAsync_orig(n,2*8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_c8_rank_0(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target :: x
      integer(c_int),value :: incx
      complex(8),target :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,2*8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasGetVectorAsync_c8_full_rank(n,x,incx,y,incy,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: n
      complex(8),target,dimension(:) :: x
      integer(c_int),value :: incx
      complex(8),target,dimension(:) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
      !
      ret = hipblasGetVectorAsync_orig(n,2*8,c_loc(x),incx,c_loc(y),incy,stream)
    end function

    function hipblasSetMatrixAsync_c8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:,:) :: A
      complex(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasSetMatrixAsync_c8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target :: A
      integer(c_int),value :: lda
      complex(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasSetMatrixAsync_c8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasSetMatrixAsync_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_c8_full_rank(rows,cols,A,B,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:,:) :: A
      complex(8),target,dimension(:,:) :: B
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*8,c_loc(A),size(A,1),c_loc(B),size(B,1),stream)
    end function

    function hipblasGetMatrixAsync_c8_rank_0(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target :: A
      integer(c_int),value :: lda
      complex(8),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function

    function hipblasGetMatrixAsync_c8_rank_1(rows,cols,A,lda,B,ldb,stream) result(ret)
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: ret
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      complex(8),target,dimension(:) :: A
      integer(c_int),value :: lda
      complex(8),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
      !
      ret = hipblasGetMatrixAsync_orig(rows,cols,2*8,c_loc(A),lda,c_loc(B),ldb,stream)
    end function
 

#endif
end module