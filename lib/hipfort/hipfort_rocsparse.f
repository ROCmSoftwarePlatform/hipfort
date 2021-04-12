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
          
           
module hipfort_rocsparse
  use hipfort_rocsparse_enums
  implicit none

 
  !> ! \ingroup aux_module
  !>    \brief Create a rocsparse handle
  !>  
  !>    \details
  !>    \p rocsparse_create_handle creates the rocSPARSE library context. It must be
  !>    initialized before any other rocSPARSE API function is invoked and must be passed to
  !>    all subsequent library function calls. The handle should be destroyed at the end
  !>    using rocsparse_destroy_handle().
  !>  
  !>    @param[out]
  !>    handle  the pointer to the handle to the rocSPARSE library context.
  !>  
  !>    \retval rocsparse_status_success the initialization succeeded.
  !>    \retval rocsparse_status_invalid_handle \p handle pointer is invalid.
  !>    \retval rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_create_handle
    function rocsparse_create_handle_orig(handle) bind(c, name="rocsparse_create_handle")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_handle_orig
      type(c_ptr) :: handle
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Destroy a rocsparse handle
  !>  
  !>    \details
  !>    \p rocsparse_destroy_handle destroys the rocSPARSE library context and releases all
  !>    resources used by the rocSPARSE library.
  !>  
  !>    @param[in]
  !>    handle  the handle to the rocSPARSE library context.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>    \retval rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_destroy_handle
    function rocsparse_destroy_handle_orig(handle) bind(c, name="rocsparse_destroy_handle")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_destroy_handle_orig
      type(c_ptr),value :: handle
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify user defined HIP stream
  !>  
  !>    \details
  !>    \p rocsparse_set_stream specifies the stream to be used by the rocSPARSE library
  !>    context and all subsequent function calls.
  !>  
  !>    @param[inout]
  !>    handle  the handle to the rocSPARSE library context.
  !>    @param[in]
  !>    stream  the stream to be used by the rocSPARSE library context.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  !>    \par Example
  !>    This example illustrates, how a user defined stream can be used in rocSPARSE.
  !>    \code{.c}
  !>         Create rocSPARSE handle
  !>        rocsparse_handle handle;
  !>        rocsparse_create_handle(&handle);
  !>  
  !>         Create stream
  !>        hipStream_t stream;
  !>        hipStreamCreate(&stream);
  !>  
  !>         Set stream to rocSPARSE handle
  !>        rocsparse_set_stream(handle, stream);
  !>  
  !>         Do some work
  !>         ...
  !>  
  !>         Clean up
  !>        rocsparse_destroy_handle(handle);
  !>        hipStreamDestroy(stream);
  !>    \endcode
  !>  
  interface rocsparse_set_stream
    function rocsparse_set_stream_orig(handle,stream) bind(c, name="rocsparse_set_stream")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_stream_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: stream
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Get current stream from library context
  !>  
  !>    \details
  !>    \p rocsparse_get_stream gets the rocSPARSE library context stream which is currently
  !>    used for all subsequent function calls.
  !>  
  !>    @param[in]
  !>    handle the handle to the rocSPARSE library context.
  !>    @param[out]
  !>    stream the stream currently used by the rocSPARSE library context.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  interface rocsparse_get_stream
    function rocsparse_get_stream_orig(handle,stream) bind(c, name="rocsparse_get_stream")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_get_stream_orig
      type(c_ptr),value :: handle
      type(c_ptr) :: stream
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify pointer mode
  !>  
  !>    \details
  !>    \p rocsparse_set_pointer_mode specifies the pointer mode to be used by the rocSPARSE
  !>    library context and all subsequent function calls. By default, all values are passed
  !>    by reference on the host. Valid pointer modes are \ref rocsparse_pointer_mode_host
  !>    or \p rocsparse_pointer_mode_device.
  !>  
  !>    @param[in]
  !>    handle          the handle to the rocSPARSE library context.
  !>    @param[in]
  !>    pointer_mode    the pointer mode to be used by the rocSPARSE library context.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  interface rocsparse_set_pointer_mode
    function rocsparse_set_pointer_mode_orig(handle,pointer_mode) bind(c, name="rocsparse_set_pointer_mode")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_pointer_mode_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_pointer_mode_host)),value :: pointer_mode
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Get current pointer mode from library context
  !>  
  !>    \details
  !>    \p rocsparse_get_pointer_mode gets the rocSPARSE library context pointer mode which
  !>    is currently used for all subsequent function calls.
  !>  
  !>    @param[in]
  !>    handle          the handle to the rocSPARSE library context.
  !>    @param[out]
  !>    pointer_mode    the pointer mode that is currently used by the rocSPARSE library
  !>                    context.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  interface rocsparse_get_pointer_mode
    function rocsparse_get_pointer_mode_orig(handle,pointer_mode) bind(c, name="rocsparse_get_pointer_mode")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_get_pointer_mode_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: pointer_mode
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Get rocSPARSE version
  !>  
  !>    \details
  !>    \p rocsparse_get_version gets the rocSPARSE library version number.
  !>    - patch = version % 100
  !>    - minor = version  100 % 1000
  !>    - major = version  100000
  !>  
  !>    @param[in]
  !>    handle  the handle to the rocSPARSE library context.
  !>    @param[out]
  !>    version the version number of the rocSPARSE library.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  interface rocsparse_get_version
    function rocsparse_get_version_orig(handle,version) bind(c, name="rocsparse_get_version")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_get_version_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: version
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Get rocSPARSE git revision
  !>  
  !>    \details
  !>    \p rocsparse_get_git_rev gets the rocSPARSE library git commit revision (SHA-1).
  !>  
  !>    @param[in]
  !>    handle  the handle to the rocSPARSE library context.
  !>    @param[out]
  !>    rev     the git commit revision (SHA-1).
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_handle \p handle is invalid.
  !>  
  interface rocsparse_get_git_rev
    function rocsparse_get_git_rev_orig(handle,rev) bind(c, name="rocsparse_get_git_rev")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_get_git_rev_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: rev
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Create a matrix descriptor
  !>    \details
  !>    \p rocsparse_create_mat_descr creates a matrix descriptor. It initializes
  !>    \ref rocsparse_matrix_type to \ref rocsparse_matrix_type_general and
  !>    \ref rocsparse_index_base to \ref rocsparse_index_base_zero. It should be destroyed
  !>    at the end using rocsparse_destroy_mat_descr().
  !>  
  !>    @param[out]
  !>    descr   the pointer to the matrix descriptor.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr pointer is invalid.
  !>  
  interface rocsparse_create_mat_descr
    function rocsparse_create_mat_descr_orig(descr) bind(c, name="rocsparse_create_mat_descr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_mat_descr_orig
      type(c_ptr) :: descr
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Copy a matrix descriptor
  !>    \details
  !>    \p rocsparse_copy_mat_descr copies a matrix descriptor. Both, source and destination
  !>    matrix descriptors must be initialized prior to calling \p rocsparse_copy_mat_descr.
  !>  
  !>    @param[out]
  !>    dest    the pointer to the destination matrix descriptor.
  !>    @param[in]
  !>    src     the pointer to the source matrix descriptor.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p src or \p dest pointer is invalid.
  !>  
  interface rocsparse_copy_mat_descr
    function rocsparse_copy_mat_descr_orig(dest,src) bind(c, name="rocsparse_copy_mat_descr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_copy_mat_descr_orig
      type(c_ptr),value :: dest
      type(c_ptr),value :: src
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Destroy a matrix descriptor
  !>  
  !>    \details
  !>    \p rocsparse_destroy_mat_descr destroys a matrix descriptor and releases all
  !>    resources used by the descriptor.
  !>  
  !>    @param[in]
  !>    descr   the matrix descriptor.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr is invalid.
  !>  
  interface rocsparse_destroy_mat_descr
    function rocsparse_destroy_mat_descr_orig(descr) bind(c, name="rocsparse_destroy_mat_descr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_destroy_mat_descr_orig
      type(c_ptr),value :: descr
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify the index base of a matrix descriptor
  !>  
  !>    \details
  !>    \p rocsparse_set_mat_index_base sets the index base of a matrix descriptor. Valid
  !>    options are \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !>  
  !>    @param[inout]
  !>    descr   the matrix descriptor.
  !>    @param[in]
  !>    base    \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr pointer is invalid.
  !>    \retval rocsparse_status_invalid_value \p base is invalid.
  !>  
  interface rocsparse_set_mat_index_base
    function rocsparse_set_mat_index_base_orig(descr,base) bind(c, name="rocsparse_set_mat_index_base")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_mat_index_base_orig
      type(c_ptr),value :: descr
      integer(kind(rocsparse_index_base_zero)),value :: base
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify the matrix type of a matrix descriptor
  !>  
  !>    \details
  !>    \p rocsparse_set_mat_type sets the matrix type of a matrix descriptor. Valid
  !>    matrix types are \ref rocsparse_matrix_type_general,
  !>    \ref rocsparse_matrix_type_symmetric, \ref rocsparse_matrix_type_hermitian or
  !>    \ref rocsparse_matrix_type_triangular.
  !>  
  !>    @param[inout]
  !>    descr   the matrix descriptor.
  !>    @param[in]
  !>    type    \ref rocsparse_matrix_type_general, \ref rocsparse_matrix_type_symmetric,
  !>            \ref rocsparse_matrix_type_hermitian or
  !>            \ref rocsparse_matrix_type_triangular.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr pointer is invalid.
  !>    \retval rocsparse_status_invalid_value \p type is invalid.
  !>  
  interface rocsparse_set_mat_type
    function rocsparse_set_mat_type_orig(descr,myType) bind(c, name="rocsparse_set_mat_type")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_mat_type_orig
      type(c_ptr),value :: descr
      integer(kind(rocsparse_matrix_type_general)),value :: myType
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify the matrix fill mode of a matrix descriptor
  !>  
  !>    \details
  !>    \p rocsparse_set_mat_fill_mode sets the matrix fill mode of a matrix descriptor.
  !>    Valid fill modes are \ref rocsparse_fill_mode_lower or
  !>    \ref rocsparse_fill_mode_upper.
  !>  
  !>    @param[inout]
  !>    descr       the matrix descriptor.
  !>    @param[in]
  !>    fill_mode   \ref rocsparse_fill_mode_lower or \ref rocsparse_fill_mode_upper.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr pointer is invalid.
  !>    \retval rocsparse_status_invalid_value \p fill_mode is invalid.
  !>  
  interface rocsparse_set_mat_fill_mode
    function rocsparse_set_mat_fill_mode_orig(descr,fill_mode) bind(c, name="rocsparse_set_mat_fill_mode")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_mat_fill_mode_orig
      type(c_ptr),value :: descr
      integer(kind(rocsparse_fill_mode_lower)),value :: fill_mode
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Specify the matrix diagonal type of a matrix descriptor
  !>  
  !>    \details
  !>    \p rocsparse_set_mat_diag_type sets the matrix diagonal type of a matrix
  !>    descriptor. Valid diagonal types are \ref rocsparse_diag_type_unit or
  !>    \ref rocsparse_diag_type_non_unit.
  !>  
  !>    @param[inout]
  !>    descr       the matrix descriptor.
  !>    @param[in]
  !>    diag_type   \ref rocsparse_diag_type_unit or \ref rocsparse_diag_type_non_unit.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p descr pointer is invalid.
  !>    \retval rocsparse_status_invalid_value \p diag_type is invalid.
  !>  
  interface rocsparse_set_mat_diag_type
    function rocsparse_set_mat_diag_type_orig(descr,diag_type) bind(c, name="rocsparse_set_mat_diag_type")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_set_mat_diag_type_orig
      type(c_ptr),value :: descr
      integer(kind(rocsparse_diag_type_non_unit)),value :: diag_type
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Create a \p HYB matrix structure
  !>  
  !>    \details
  !>    \p rocsparse_create_hyb_mat creates a structure that holds the matrix in \p HYB
  !>    storage format. It should be destroyed at the end using rocsparse_destroy_hyb_mat().
  !>  
  !>    @param[inout]
  !>    hyb the pointer to the hybrid matrix.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p hyb pointer is invalid.
  !>  
  interface rocsparse_create_hyb_mat
    function rocsparse_create_hyb_mat_orig(hyb) bind(c, name="rocsparse_create_hyb_mat")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_hyb_mat_orig
      type(c_ptr) :: hyb
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Destroy a \p HYB matrix structure
  !>  
  !>    \details
  !>    \p rocsparse_destroy_hyb_mat destroys a \p HYB structure.
  !>  
  !>    @param[in]
  !>    hyb the hybrid matrix structure.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p hyb pointer is invalid.
  !>    \retval rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_destroy_hyb_mat
    function rocsparse_destroy_hyb_mat_orig(hyb) bind(c, name="rocsparse_destroy_hyb_mat")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_destroy_hyb_mat_orig
      type(c_ptr),value :: hyb
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Create a matrix info structure
  !>  
  !>    \details
  !>    \p rocsparse_create_mat_info creates a structure that holds the matrix info data
  !>    that is gathered during the analysis routines available. It should be destroyed
  !>    at the end using rocsparse_destroy_mat_info().
  !>  
  !>    @param[inout]
  !>    info    the pointer to the info structure.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>  
  interface rocsparse_create_mat_info
    function rocsparse_create_mat_info_orig(myInfo) bind(c, name="rocsparse_create_mat_info")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_mat_info_orig
      type(c_ptr) :: myInfo
    end function


  end interface
  !> ! \ingroup aux_module
  !>    \brief Destroy a matrix info structure
  !>  
  !>    \details
  !>    \p rocsparse_destroy_mat_info destroys a matrix info structure.
  !>  
  !>    @param[in]
  !>    info    the info structure.
  !>  
  !>    \retval rocsparse_status_success the operation completed successfully.
  !>    \retval rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>    \retval rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_destroy_mat_info
    function rocsparse_destroy_mat_info_orig(myInfo) bind(c, name="rocsparse_destroy_mat_info")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_destroy_mat_info_orig
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_saxpyi
    function rocsparse_saxpyi_orig(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_saxpyi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_saxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_saxpyi_rank_0,rocsparse_saxpyi_rank_1
#endif

  end interface
  
  interface rocsparse_daxpyi
    function rocsparse_daxpyi_orig(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_daxpyi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_daxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_daxpyi_rank_0,rocsparse_daxpyi_rank_1
#endif

  end interface
  
  interface rocsparse_caxpyi
    function rocsparse_caxpyi_orig(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_caxpyi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_caxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_caxpyi_rank_0,rocsparse_caxpyi_rank_1
#endif

  end interface
  
  interface rocsparse_zaxpyi
    function rocsparse_zaxpyi_orig(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_zaxpyi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zaxpyi_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zaxpyi_rank_0,rocsparse_zaxpyi_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sdoti
    function rocsparse_sdoti_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_sdoti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sdoti_rank_0,rocsparse_sdoti_rank_1
#endif

  end interface
  
  interface rocsparse_ddoti
    function rocsparse_ddoti_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_ddoti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ddoti_rank_0,rocsparse_ddoti_rank_1
#endif

  end interface
  
  interface rocsparse_cdoti
    function rocsparse_cdoti_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_cdoti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cdoti_rank_0,rocsparse_cdoti_rank_1
#endif

  end interface
  
  interface rocsparse_zdoti
    function rocsparse_zdoti_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_zdoti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdoti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zdoti_rank_0,rocsparse_zdoti_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_cdotci
    function rocsparse_cdotci_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_cdotci")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdotci_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cdotci_rank_0,rocsparse_cdotci_rank_1
#endif

  end interface
  
  interface rocsparse_zdotci
    function rocsparse_zdotci_orig(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_zdotci")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdotci_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zdotci_rank_0,rocsparse_zdotci_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sgthr
    function rocsparse_sgthr_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_sgthr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sgthr_rank_0,rocsparse_sgthr_rank_1
#endif

  end interface
  
  interface rocsparse_dgthr
    function rocsparse_dgthr_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_dgthr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dgthr_rank_0,rocsparse_dgthr_rank_1
#endif

  end interface
  
  interface rocsparse_cgthr
    function rocsparse_cgthr_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_cgthr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cgthr_rank_0,rocsparse_cgthr_rank_1
#endif

  end interface
  
  interface rocsparse_zgthr
    function rocsparse_zgthr_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_zgthr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zgthr_rank_0,rocsparse_zgthr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sgthrz
    function rocsparse_sgthrz_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_sgthrz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sgthrz_rank_0,rocsparse_sgthrz_rank_1
#endif

  end interface
  
  interface rocsparse_dgthrz
    function rocsparse_dgthrz_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_dgthrz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dgthrz_rank_0,rocsparse_dgthrz_rank_1
#endif

  end interface
  
  interface rocsparse_cgthrz
    function rocsparse_cgthrz_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_cgthrz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cgthrz_rank_0,rocsparse_cgthrz_rank_1
#endif

  end interface
  
  interface rocsparse_zgthrz
    function rocsparse_zgthrz_orig(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_zgthrz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthrz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zgthrz_rank_0,rocsparse_zgthrz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sroti
    function rocsparse_sroti_orig(handle,nnz,x_val,x_ind,y,c,s,idx_base) bind(c, name="rocsparse_sroti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sroti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sroti_rank_0,rocsparse_sroti_rank_1
#endif

  end interface
  
  interface rocsparse_droti
    function rocsparse_droti_orig(handle,nnz,x_val,x_ind,y,c,s,idx_base) bind(c, name="rocsparse_droti")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_droti_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_droti_rank_0,rocsparse_droti_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_ssctr
    function rocsparse_ssctr_orig(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_ssctr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ssctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ssctr_rank_0,rocsparse_ssctr_rank_1
#endif

  end interface
  
  interface rocsparse_dsctr
    function rocsparse_dsctr_orig(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_dsctr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dsctr_rank_0,rocsparse_dsctr_rank_1
#endif

  end interface
  
  interface rocsparse_csctr
    function rocsparse_csctr_orig(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_csctr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csctr_rank_0,rocsparse_csctr_rank_1
#endif

  end interface
  
  interface rocsparse_zsctr
    function rocsparse_zsctr_orig(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_zsctr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zsctr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zsctr_rank_0,rocsparse_zsctr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsrmv
    function rocsparse_sbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_sbsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrmv_rank_0,rocsparse_sbsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrmv
    function rocsparse_dbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_dbsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrmv_rank_0,rocsparse_dbsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrmv
    function rocsparse_cbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_cbsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrmv_rank_0,rocsparse_cbsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrmv
    function rocsparse_zbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_zbsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrmv_rank_0,rocsparse_zbsrmv_rank_1
#endif

  end interface
  !> ! \ingroup level2_module
  !>   \brief Sparse triangular solve using BSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_bsrsv_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>   structural or numerical zero has been found during rocsparse_sbsrsv_solve(),
  !>   rocsparse_dbsrsv_solve(), rocsparse_cbsrsv_solve() or rocsparse_zbsrsv_solve()
  !>   computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
  !>   using same index base as the BSR matrix.
  !> 
  !>   \p position can be in host or device memory. If no zero pivot has been found,
  !>   \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !> 
  !>   \note \p rocsparse_bsrsv_zero_pivot is a blocking function. It might influence
  !>   performance negatively.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   info        structure that holds the information collected during the analysis step.
  !>   @param[inout]
  !>   position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>               invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !> 
  interface rocsparse_bsrsv_zero_pivot
    function rocsparse_bsrsv_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_bsrsv_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsrsv_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_sbsrsv_buffer_size
    function rocsparse_sbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size) bind(c, name="rocsparse_sbsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrsv_buffer_size_rank_0,rocsparse_sbsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrsv_buffer_size
    function rocsparse_dbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size) bind(c, name="rocsparse_dbsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrsv_buffer_size_rank_0,rocsparse_dbsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrsv_buffer_size
    function rocsparse_cbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size) bind(c, name="rocsparse_cbsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrsv_buffer_size_rank_0,rocsparse_cbsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrsv_buffer_size
    function rocsparse_zbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size) bind(c, name="rocsparse_zbsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrsv_buffer_size_rank_0,rocsparse_zbsrsv_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsrsv_analysis
    function rocsparse_sbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_sbsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrsv_analysis_rank_0,rocsparse_sbsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrsv_analysis
    function rocsparse_dbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dbsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrsv_analysis_rank_0,rocsparse_dbsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrsv_analysis
    function rocsparse_cbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_cbsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrsv_analysis_rank_0,rocsparse_cbsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrsv_analysis
    function rocsparse_zbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zbsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrsv_analysis_rank_0,rocsparse_zbsrsv_analysis_rank_1
#endif

  end interface
  !> ! \ingroup level2_module
  !>   \brief Sparse triangular solve using BSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_bsrsv_clear deallocates all memory that was allocated by
  !>   rocsparse_sbsrsv_analysis(), rocsparse_dbsrsv_analysis(), rocsparse_cbsrsv_analysis()
  !>   or rocsparse_zbsrsv_analysis(). This is especially useful, if memory is an issue and
  !>   the analysis data is not required for further computation, e.g. when switching to
  !>   another sparse matrix format. Calling \p rocsparse_bsrsv_clear is optional. All
  !>   allocated resources will be cleared, when the opaque \ref rocsparse_mat_info struct
  !>   is destroyed using rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[inout]
  !>   info        structure that holds the information collected during the analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>               be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_bsrsv_clear
    function rocsparse_bsrsv_clear_orig(handle,myInfo) bind(c, name="rocsparse_bsrsv_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsrsv_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_sbsrsv_solve
    function rocsparse_sbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_sbsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrsv_solve_rank_0,rocsparse_sbsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrsv_solve
    function rocsparse_dbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_dbsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrsv_solve_rank_0,rocsparse_dbsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrsv_solve
    function rocsparse_cbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_cbsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrsv_solve_rank_0,rocsparse_cbsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrsv_solve
    function rocsparse_zbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_zbsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrsv_solve_rank_0,rocsparse_zbsrsv_solve_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scoomv
    function rocsparse_scoomv_orig(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_scoomv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scoomv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scoomv_rank_0,rocsparse_scoomv_rank_1
#endif

  end interface
  
  interface rocsparse_dcoomv
    function rocsparse_dcoomv_orig(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_dcoomv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcoomv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcoomv_rank_0,rocsparse_dcoomv_rank_1
#endif

  end interface
  
  interface rocsparse_ccoomv
    function rocsparse_ccoomv_orig(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_ccoomv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccoomv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccoomv_rank_0,rocsparse_ccoomv_rank_1
#endif

  end interface
  
  interface rocsparse_zcoomv
    function rocsparse_zcoomv_orig(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_zcoomv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcoomv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcoomv_rank_0,rocsparse_zcoomv_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrmv_analysis
    function rocsparse_scsrmv_analysis_orig(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo) bind(c, name="rocsparse_scsrmv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrmv_analysis_rank_0,rocsparse_scsrmv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrmv_analysis
    function rocsparse_dcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo) bind(c, name="rocsparse_dcsrmv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrmv_analysis_rank_0,rocsparse_dcsrmv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrmv_analysis
    function rocsparse_ccsrmv_analysis_orig(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo) bind(c, name="rocsparse_ccsrmv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrmv_analysis_rank_0,rocsparse_ccsrmv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrmv_analysis
    function rocsparse_zcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo) bind(c, name="rocsparse_zcsrmv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrmv_analysis_rank_0,rocsparse_zcsrmv_analysis_rank_1
#endif

  end interface
  !> ! \ingroup level2_module
  !>   \brief Sparse matrix vector multiplication using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrmv_clear deallocates all memory that was allocated by
  !>   rocsparse_scsrmv_analysis(), rocsparse_dcsrmv_analysis(), rocsparse_ccsrmv_analysis()
  !>   or rocsparse_zcsrmv_analysis(). This is especially useful, if memory is an issue and
  !>   the analysis data is not required anymore for further computation, e.g. when
  !>   switching to another sparse matrix format.
  !> 
  !>   \note
  !>   Calling \p rocsparse_csrmv_clear is optional. All allocated resources will be
  !>   cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !>   rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[inout]
  !>   info        structure that holds the information collected during analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer for the gathered information
  !>               could not be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_csrmv_clear
    function rocsparse_csrmv_clear_orig(handle,myInfo) bind(c, name="rocsparse_csrmv_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrmv_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_scsrmv
    function rocsparse_scsrmv_orig(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y) bind(c, name="rocsparse_scsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrmv_rank_0,rocsparse_scsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrmv
    function rocsparse_dcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y) bind(c, name="rocsparse_dcsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrmv_rank_0,rocsparse_dcsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrmv
    function rocsparse_ccsrmv_orig(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y) bind(c, name="rocsparse_ccsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrmv_rank_0,rocsparse_ccsrmv_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrmv
    function rocsparse_zcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y) bind(c, name="rocsparse_zcsrmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrmv_rank_0,rocsparse_zcsrmv_rank_1
#endif

  end interface
  !> ! \ingroup level2_module
  !>   \brief Sparse triangular solve using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrsv_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>   structural or numerical zero has been found during rocsparse_scsrsv_solve(),
  !>   rocsparse_dcsrsv_solve(), rocsparse_ccsrsv_solve() or rocsparse_zcsrsv_solve()
  !>   computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
  !>   using same index base as the CSR matrix.
  !> 
  !>   \p position can be in host or device memory. If no zero pivot has been found,
  !>   \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !> 
  !>   \note \p rocsparse_csrsv_zero_pivot is a blocking function. It might influence
  !>   performance negatively.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   descr       descriptor of the sparse CSR matrix.
  !>   @param[in]
  !>   info        structure that holds the information collected during the analysis step.
  !>   @param[inout]
  !>   position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>               invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !> 
  interface rocsparse_csrsv_zero_pivot
    function rocsparse_csrsv_zero_pivot_orig(handle,descr,myInfo,position) bind(c, name="rocsparse_csrsv_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsv_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_scsrsv_buffer_size
    function rocsparse_scsrsv_buffer_size_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_scsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsv_buffer_size_rank_0,rocsparse_scsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsv_buffer_size
    function rocsparse_dcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_dcsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsv_buffer_size_rank_0,rocsparse_dcsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsv_buffer_size
    function rocsparse_ccsrsv_buffer_size_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_ccsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsv_buffer_size_rank_0,rocsparse_ccsrsv_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsv_buffer_size
    function rocsparse_zcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_zcsrsv_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsv_buffer_size_rank_0,rocsparse_zcsrsv_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrsv_analysis
    function rocsparse_scsrsv_analysis_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsv_analysis_rank_0,rocsparse_scsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsv_analysis
    function rocsparse_dcsrsv_analysis_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsv_analysis_rank_0,rocsparse_dcsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsv_analysis
    function rocsparse_ccsrsv_analysis_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsv_analysis_rank_0,rocsparse_ccsrsv_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsv_analysis
    function rocsparse_zcsrsv_analysis_orig(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrsv_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsv_analysis_rank_0,rocsparse_zcsrsv_analysis_rank_1
#endif

  end interface
  !> ! \ingroup level2_module
  !>   \brief Sparse triangular solve using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrsv_clear deallocates all memory that was allocated by
  !>   rocsparse_scsrsv_analysis(), rocsparse_dcsrsv_analysis(), rocsparse_ccsrsv_analysis()
  !>   or rocsparse_zcsrsv_analysis(). This is especially useful, if memory is an issue and
  !>   the analysis data is not required for further computation, e.g. when switching to
  !>   another sparse matrix format. Calling \p rocsparse_csrsv_clear is optional. All
  !>   allocated resources will be cleared, when the opaque \ref rocsparse_mat_info struct
  !>   is destroyed using rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   descr       descriptor of the sparse CSR matrix.
  !>   @param[inout]
  !>   info        structure that holds the information collected during the analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>               be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_csrsv_clear
    function rocsparse_csrsv_clear_orig(handle,descr,myInfo) bind(c, name="rocsparse_csrsv_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsv_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_scsrsv_solve
    function rocsparse_scsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_scsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsv_solve_rank_0,rocsparse_scsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsv_solve
    function rocsparse_dcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_dcsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsv_solve_rank_0,rocsparse_dcsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsv_solve
    function rocsparse_ccsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_ccsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsv_solve_rank_0,rocsparse_ccsrsv_solve_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsv_solve
    function rocsparse_zcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer) bind(c, name="rocsparse_zcsrsv_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsv_solve_rank_0,rocsparse_zcsrsv_solve_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sellmv
    function rocsparse_sellmv_orig(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_sellmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sellmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sellmv_rank_0,rocsparse_sellmv_rank_1
#endif

  end interface
  
  interface rocsparse_dellmv
    function rocsparse_dellmv_orig(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_dellmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dellmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dellmv_rank_0,rocsparse_dellmv_rank_1
#endif

  end interface
  
  interface rocsparse_cellmv
    function rocsparse_cellmv_orig(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_cellmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cellmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cellmv_rank_0,rocsparse_cellmv_rank_1
#endif

  end interface
  
  interface rocsparse_zellmv
    function rocsparse_zellmv_orig(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_zellmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zellmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zellmv_rank_0,rocsparse_zellmv_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_shybmv
    function rocsparse_shybmv_orig(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_shybmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shybmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_shybmv_rank_0,rocsparse_shybmv_rank_1
#endif

  end interface
  
  interface rocsparse_dhybmv
    function rocsparse_dhybmv_orig(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_dhybmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhybmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dhybmv_rank_0,rocsparse_dhybmv_rank_1
#endif

  end interface
  
  interface rocsparse_chybmv
    function rocsparse_chybmv_orig(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_chybmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chybmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_chybmv_rank_0,rocsparse_chybmv_rank_1
#endif

  end interface
  
  interface rocsparse_zhybmv
    function rocsparse_zhybmv_orig(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_zhybmv")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhybmv_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zhybmv_rank_0,rocsparse_zhybmv_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsrmm
    function rocsparse_sbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc) bind(c, name="rocsparse_sbsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrmm_full_rank,rocsparse_sbsrmm_rank_0,rocsparse_sbsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrmm
    function rocsparse_dbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc) bind(c, name="rocsparse_dbsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrmm_full_rank,rocsparse_dbsrmm_rank_0,rocsparse_dbsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrmm
    function rocsparse_cbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc) bind(c, name="rocsparse_cbsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrmm_full_rank,rocsparse_cbsrmm_rank_0,rocsparse_cbsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrmm
    function rocsparse_zbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc) bind(c, name="rocsparse_zbsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrmm_full_rank,rocsparse_zbsrmm_rank_0,rocsparse_zbsrmm_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrmm
    function rocsparse_scsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_scsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrmm_full_rank,rocsparse_scsrmm_rank_0,rocsparse_scsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrmm
    function rocsparse_dcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_dcsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrmm_full_rank,rocsparse_dcsrmm_rank_0,rocsparse_dcsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrmm
    function rocsparse_ccsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_ccsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrmm_full_rank,rocsparse_ccsrmm_rank_0,rocsparse_ccsrmm_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrmm
    function rocsparse_zcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_zcsrmm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrmm_full_rank,rocsparse_zcsrmm_rank_0,rocsparse_zcsrmm_rank_1
#endif

  end interface
  !> ! \ingroup level3_module
  !>   \brief Sparse triangular system solve using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrsm_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>   structural or numerical zero has been found during rocsparse_scsrsm_solve(),
  !>   rocsparse_dcsrsm_solve(), rocsparse_ccsrsm_solve() or rocsparse_zcsrsm_solve()
  !>   computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
  !>   using same index base as the CSR matrix.
  !> 
  !>   \p position can be in host or device memory. If no zero pivot has been found,
  !>   \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !> 
  !>   \note \p rocsparse_csrsm_zero_pivot is a blocking function. It might influence
  !>   performance negatively.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   info        structure that holds the information collected during the analysis step.
  !>   @param[inout]
  !>   position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>               invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !> 
  interface rocsparse_csrsm_zero_pivot
    function rocsparse_csrsm_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_csrsm_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsm_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_scsrsm_buffer_size
    function rocsparse_scsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size) bind(c, name="rocsparse_scsrsm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsm_buffer_size_full_rank,rocsparse_scsrsm_buffer_size_rank_0,rocsparse_scsrsm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsm_buffer_size
    function rocsparse_dcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size) bind(c, name="rocsparse_dcsrsm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsm_buffer_size_full_rank,rocsparse_dcsrsm_buffer_size_rank_0,rocsparse_dcsrsm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsm_buffer_size
    function rocsparse_ccsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size) bind(c, name="rocsparse_ccsrsm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsm_buffer_size_full_rank,rocsparse_ccsrsm_buffer_size_rank_0,rocsparse_ccsrsm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsm_buffer_size
    function rocsparse_zcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size) bind(c, name="rocsparse_zcsrsm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsm_buffer_size_full_rank,rocsparse_zcsrsm_buffer_size_rank_0,rocsparse_zcsrsm_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrsm_analysis
    function rocsparse_scsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrsm_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsm_analysis_full_rank,rocsparse_scsrsm_analysis_rank_0,rocsparse_scsrsm_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsm_analysis
    function rocsparse_dcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrsm_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsm_analysis_full_rank,rocsparse_dcsrsm_analysis_rank_0,rocsparse_dcsrsm_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsm_analysis
    function rocsparse_ccsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrsm_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsm_analysis_full_rank,rocsparse_ccsrsm_analysis_rank_0,rocsparse_ccsrsm_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsm_analysis
    function rocsparse_zcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrsm_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsm_analysis_full_rank,rocsparse_zcsrsm_analysis_rank_0,rocsparse_zcsrsm_analysis_rank_1
#endif

  end interface
  !> ! \ingroup level3_module
  !>   \brief Sparse triangular system solve using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrsm_clear deallocates all memory that was allocated by
  !>   rocsparse_scsrsm_analysis(), rocsparse_dcsrsm_analysis(), rocsparse_ccsrsm_analysis()
  !>   or rocsparse_zcsrsm_analysis(). This is especially useful, if memory is an issue and
  !>   the analysis data is not required for further computation, e.g. when switching to
  !>   another sparse matrix format. Calling \p rocsparse_csrsm_clear is optional. All
  !>   allocated resources will be cleared, when the opaque \ref rocsparse_mat_info struct
  !>   is destroyed using rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[inout]
  !>   info        structure that holds the information collected during the analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>               be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_csrsm_clear
    function rocsparse_csrsm_clear_orig(handle,myInfo) bind(c, name="rocsparse_csrsm_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsm_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_scsrsm_solve
    function rocsparse_scsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer) bind(c, name="rocsparse_scsrsm_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrsm_solve_full_rank,rocsparse_scsrsm_solve_rank_0,rocsparse_scsrsm_solve_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrsm_solve
    function rocsparse_dcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer) bind(c, name="rocsparse_dcsrsm_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrsm_solve_full_rank,rocsparse_dcsrsm_solve_rank_0,rocsparse_dcsrsm_solve_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrsm_solve
    function rocsparse_ccsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer) bind(c, name="rocsparse_ccsrsm_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrsm_solve_full_rank,rocsparse_ccsrsm_solve_rank_0,rocsparse_ccsrsm_solve_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrsm_solve
    function rocsparse_zcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer) bind(c, name="rocsparse_zcsrsm_solve")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_solve_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrsm_solve_full_rank,rocsparse_zcsrsm_solve_rank_0,rocsparse_zcsrsm_solve_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sgemmi
    function rocsparse_sgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc) bind(c, name="rocsparse_sgemmi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgemmi_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sgemmi_full_rank,rocsparse_sgemmi_rank_0,rocsparse_sgemmi_rank_1
#endif

  end interface
  
  interface rocsparse_dgemmi
    function rocsparse_dgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc) bind(c, name="rocsparse_dgemmi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgemmi_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dgemmi_full_rank,rocsparse_dgemmi_rank_0,rocsparse_dgemmi_rank_1
#endif

  end interface
  
  interface rocsparse_cgemmi
    function rocsparse_cgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc) bind(c, name="rocsparse_cgemmi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgemmi_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cgemmi_full_rank,rocsparse_cgemmi_rank_0,rocsparse_cgemmi_rank_1
#endif

  end interface
  
  interface rocsparse_zgemmi
    function rocsparse_zgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc) bind(c, name="rocsparse_zgemmi")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgemmi_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zgemmi_full_rank,rocsparse_zgemmi_rank_0,rocsparse_zgemmi_rank_1
#endif

  end interface
  !> ! \ingroup extra_module
  !>   \brief Sparse matrix sparse matrix addition using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrgeam_nnz computes the total CSR non-zero elements and the CSR row
  !>   offsets, that point to the start of every row of the sparse CSR matrix, of the
  !>   resulting matrix C. It is assumed that \p csr_row_ptr_C has been allocated with
  !>   size \p m + 1.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !>   \note
  !>   Currently, only \ref rocsparse_matrix_type_general is supported.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse CSR matrix \f$A\f$, \f$B\f$ and \f$C\f$.
  !>   @param[in]
  !>   n               number of columns of the sparse CSR matrix \f$A\f$, \f$B\f$ and \f$C\f$.
  !>   @param[in]
  !>   descr_A         descriptor of the sparse CSR matrix \f$A\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   nnz_A           number of non-zero entries of the sparse CSR matrix \f$A\f$.
  !>   @param[in]
  !>   csr_row_ptr_A   array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix \f$A\f$.
  !>   @param[in]
  !>   csr_col_ind_A   array of \p nnz_A elements containing the column indices of the
  !>                   sparse CSR matrix \f$A\f$.
  !>   @param[in]
  !>   descr_B         descriptor of the sparse CSR matrix \f$B\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   nnz_B           number of non-zero entries of the sparse CSR matrix \f$B\f$.
  !>   @param[in]
  !>   csr_row_ptr_B   array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix \f$B\f$.
  !>   @param[in]
  !>   csr_col_ind_B   array of \p nnz_B elements containing the column indices of the
  !>                   sparse CSR matrix \f$B\f$.
  !>   @param[in]
  !>   descr_C         descriptor of the sparse CSR matrix \f$C\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[out]
  !>   csr_row_ptr_C   array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix \f$C\f$.
  !>   @param[out]
  !>   nnz_C           pointer to the number of non-zero entries of the sparse CSR
  !>                   matrix \f$C\f$. \p nnz_C can be a host or device pointer.
  !> 
  !>   \retval rocsparse_status_success the operation completed successfully.
  !>   \retval rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval rocsparse_status_invalid_size \p m, \p n, \p nnz_A or \p nnz_B is invalid.
  !>   \retval rocsparse_status_invalid_pointer \p descr_A, \p csr_row_ptr_A,
  !>           \p csr_col_ind_A, \p descr_B, \p csr_row_ptr_B, \p csr_col_ind_B,
  !>           \p descr_C, \p csr_row_ptr_C or \p nnz_C is invalid.
  !>   \retval rocsparse_status_not_implemented
  !>           \p rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  interface rocsparse_csrgeam_nnz
    function rocsparse_csrgeam_nnz_orig(handle,m,n,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_row_ptr_C,nnz_C) bind(c, name="rocsparse_csrgeam_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgeam_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: nnz_C
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csrgeam_nnz_rank_0,rocsparse_csrgeam_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrgeam
    function rocsparse_scsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_scsrgeam")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrgeam_rank_0,rocsparse_scsrgeam_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrgeam
    function rocsparse_dcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_dcsrgeam")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrgeam_rank_0,rocsparse_dcsrgeam_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrgeam
    function rocsparse_ccsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_ccsrgeam")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrgeam_rank_0,rocsparse_ccsrgeam_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrgeam
    function rocsparse_zcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_zcsrgeam")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgeam_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrgeam_rank_0,rocsparse_zcsrgeam_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrgemm_buffer_size
    function rocsparse_scsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_scsrgemm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrgemm_buffer_size_rank_0,rocsparse_scsrgemm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrgemm_buffer_size
    function rocsparse_dcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_dcsrgemm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrgemm_buffer_size_rank_0,rocsparse_dcsrgemm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrgemm_buffer_size
    function rocsparse_ccsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_ccsrgemm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrgemm_buffer_size_rank_0,rocsparse_ccsrgemm_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrgemm_buffer_size
    function rocsparse_zcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_zcsrgemm_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrgemm_buffer_size_rank_0,rocsparse_zcsrgemm_buffer_size_rank_1
#endif

  end interface
  !> ! \ingroup extra_module
  !>   \brief Sparse matrix sparse matrix multiplication using CSR storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrgemm_nnz computes the total CSR non-zero elements and the CSR row
  !>   offsets, that point to the start of every row of the sparse CSR matrix, of the
  !>   resulting multiplied matrix C. It is assumed that \p csr_row_ptr_C has been allocated
  !>   with size \p m + 1.
  !>   The required buffer size can be obtained by rocsparse_scsrgemm_buffer_size(),
  !>   rocsparse_dcsrgemm_buffer_size(), rocsparse_ccsrgemm_buffer_size() and
  !>   rocsparse_zcsrgemm_buffer_size(), respectively.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !>   \note
  !>   Please note, that for matrix products with more than 8192 intermediate products per
  !>   row, additional temporary storage buffer is allocated by the algorithm.
  !>   \note
  !>   Currently, only \p trans_A == \p trans_B == \ref rocsparse_operation_none is
  !>   supported.
  !>   \note
  !>   Currently, only \ref rocsparse_matrix_type_general is supported.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   trans_A         matrix \f$A\f$ operation type.
  !>   @param[in]
  !>   trans_B         matrix \f$B\f$ operation type.
  !>   @param[in]
  !>   m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
  !>   @param[in]
  !>   n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
  !>                   \f$C\f$.
  !>   @param[in]
  !>   k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
  !>                   rows of the sparse CSR matrix \f$op(B)\f$.
  !>   @param[in]
  !>   descr_A         descriptor of the sparse CSR matrix \f$A\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   nnz_A           number of non-zero entries of the sparse CSR matrix \f$A\f$.
  !>   @param[in]
  !>   csr_row_ptr_A   array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
  !>                   that point to the start of every row of the sparse CSR matrix
  !>                   \f$op(A)\f$.
  !>   @param[in]
  !>   csr_col_ind_A   array of \p nnz_A elements containing the column indices of the
  !>                   sparse CSR matrix \f$A\f$.
  !>   @param[in]
  !>   descr_B         descriptor of the sparse CSR matrix \f$B\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   nnz_B           number of non-zero entries of the sparse CSR matrix \f$B\f$.
  !>   @param[in]
  !>   csr_row_ptr_B   array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
  !>                   that point to the start of every row of the sparse CSR matrix
  !>                   \f$op(B)\f$.
  !>   @param[in]
  !>   csr_col_ind_B   array of \p nnz_B elements containing the column indices of the
  !>                   sparse CSR matrix \f$B\f$.
  !>   @param[in]
  !>   descr_D         descriptor of the sparse CSR matrix \f$D\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   nnz_D           number of non-zero entries of the sparse CSR matrix \f$D\f$.
  !>   @param[in]
  !>   csr_row_ptr_D   array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix \f$D\f$.
  !>   @param[in]
  !>   csr_col_ind_D   array of \p nnz_D elements containing the column indices of the sparse
  !>                   CSR matrix \f$D\f$.
  !>   @param[in]
  !>   descr_C         descriptor of the sparse CSR matrix \f$C\f$. Currenty, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[out]
  !>   csr_row_ptr_C   array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix \f$C\f$.
  !>   @param[out]
  !>   nnz_C           pointer to the number of non-zero entries of the sparse CSR
  !>                   matrix \f$C\f$.
  !>   @param[in]
  !>   info_C          structure that holds meta data for the sparse CSR matrix \f$C\f$.
  !>   @param[in]
  !>   temp_buffer     temporary storage buffer allocated by the user, size is returned
  !>                   by rocsparse_scsrgemm_buffer_size(),
  !>                   rocsparse_dcsrgemm_buffer_size(), rocsparse_ccsrgemm_buffer_size() or
  !>                   rocsparse_zcsrgemm_buffer_size().
  !> 
  !>   \retval rocsparse_status_success the operation completed successfully.
  !>   \retval rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval rocsparse_status_invalid_size \p m, \p n, \p k, \p nnz_A, \p nnz_B or
  !>           \p nnz_D is invalid.
  !>   \retval rocsparse_status_invalid_pointer \p descr_A, \p csr_row_ptr_A,
  !>           \p csr_col_ind_A, \p descr_B, \p csr_row_ptr_B, \p csr_col_ind_B,
  !>           \p descr_D, \p csr_row_ptr_D, \p csr_col_ind_D, \p descr_C,
  !>           \p csr_row_ptr_C, \p nnz_C, \p info_C or \p temp_buffer is invalid.
  !>   \retval rocsparse_status_memory_error additional buffer for long rows could not be
  !>           allocated.
  !>   \retval rocsparse_status_not_implemented
  !>           \p trans_A != \ref rocsparse_operation_none,
  !>           \p trans_B != \ref rocsparse_operation_none, or
  !>           \p rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  interface rocsparse_csrgemm_nnz
    function rocsparse_csrgemm_nnz_orig(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_row_ptr_C,nnz_C,info_C,temp_buffer) bind(c, name="rocsparse_csrgemm_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgemm_nnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: nnz_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csrgemm_nnz_rank_0,rocsparse_csrgemm_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrgemm
    function rocsparse_scsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_scsrgemm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrgemm_rank_0,rocsparse_scsrgemm_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrgemm
    function rocsparse_dcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_dcsrgemm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrgemm_rank_0,rocsparse_dcsrgemm_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrgemm
    function rocsparse_ccsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_ccsrgemm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrgemm_rank_0,rocsparse_ccsrgemm_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrgemm
    function rocsparse_zcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_zcsrgemm")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrgemm_rank_0,rocsparse_zcsrgemm_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>    \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using BSR
  !>    storage format
  !>  
  !>    \details
  !>    \p rocsparse_bsric0_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>    structural or numerical zero has been found during rocsparse_sbsric0(),
  !>    rocsparse_dbsric0(), rocsparse_cbsric0() or rocsparse_zbsric0() computation.
  !>    The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using same
  !>    index base as the BSR matrix.
  !>  
  !>    \p position can be in host or device memory. If no zero pivot has been found,
  !>    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !>  
  !>    \note
  !>    If a zero pivot is found, \p position=j means that either the diagonal block \p A(j,j)
  !>    is missing (structural zero) or the diagonal block \p A(j,j) is not positive definite
  !>    (numerical zero).
  !>  
  !>    \note \p rocsparse_bsric0_zero_pivot is a blocking function. It might influence
  !>    performance negatively.
  !>  
  !>    @param[in]
  !>    handle      handle to the rocsparse library context queue.
  !>    @param[in]
  !>    info        structure that holds the information collected during the analysis step.
  !>    @param[inout]
  !>    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !>  
  !>    \retval     rocsparse_status_success the operation completed successfully.
  !>    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>                invalid.
  !>    \retval     rocsparse_status_internal_error an internal error occurred.
  !>    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !>  
  interface rocsparse_bsric0_zero_pivot
    function rocsparse_bsric0_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_bsric0_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsric0_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_sbsric0_buffer_size
    function rocsparse_sbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_sbsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsric0_buffer_size_rank_0,rocsparse_sbsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dbsric0_buffer_size
    function rocsparse_dbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_dbsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsric0_buffer_size_rank_0,rocsparse_dbsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_cbsric0_buffer_size
    function rocsparse_cbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_cbsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsric0_buffer_size_rank_0,rocsparse_cbsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zbsric0_buffer_size
    function rocsparse_zbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_zbsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsric0_buffer_size_rank_0,rocsparse_zbsric0_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsric0_analysis
    function rocsparse_sbsric0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_sbsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsric0_analysis_rank_0,rocsparse_sbsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dbsric0_analysis
    function rocsparse_dbsric0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dbsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsric0_analysis_rank_0,rocsparse_dbsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_cbsric0_analysis
    function rocsparse_cbsric0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_cbsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsric0_analysis_rank_0,rocsparse_cbsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zbsric0_analysis
    function rocsparse_zbsric0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zbsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsric0_analysis_rank_0,rocsparse_zbsric0_analysis_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>    \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using BSR
  !>    storage format
  !>  
  !>    \details
  !>    \p rocsparse_bsric0_clear deallocates all memory that was allocated by
  !>    rocsparse_sbsric0_analysis(), rocsparse_dbsric0_analysis(), rocsparse_cbsric0_analysis()
  !>    or rocsparse_zbsric0_analysis(). This is especially useful, if memory is an issue and
  !>    the analysis data is not required for further computation.
  !>  
  !>    \note
  !>    Calling \p rocsparse_bsric0_clear is optional. All allocated resources will be
  !>    cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !>    rocsparse_destroy_mat_info().
  !>  
  !>    @param[in]
  !>    handle      handle to the rocsparse library context queue.
  !>    @param[inout]
  !>    info        structure that holds the information collected during the analysis step.
  !>  
  !>    \retval     rocsparse_status_success the operation completed successfully.
  !>    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>                be deallocated.
  !>    \retval     rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_bsric0_clear
    function rocsparse_bsric0_clear_orig(handle,myInfo) bind(c, name="rocsparse_bsric0_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsric0_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_sbsric0
    function rocsparse_sbsric0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_sbsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsric0_rank_0,rocsparse_sbsric0_rank_1
#endif

  end interface
  
  interface rocsparse_dbsric0
    function rocsparse_dbsric0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_dbsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsric0_rank_0,rocsparse_dbsric0_rank_1
#endif

  end interface
  
  interface rocsparse_cbsric0
    function rocsparse_cbsric0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_cbsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsric0_rank_0,rocsparse_cbsric0_rank_1
#endif

  end interface
  
  interface rocsparse_zbsric0
    function rocsparse_zbsric0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_zbsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsric0_rank_0,rocsparse_zbsric0_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>    \brief Incomplete LU factorization with 0 fill-ins and no pivoting using BSR storage
  !>    format
  !>  
  !>    \details
  !>    \p rocsparse_bsrilu0_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>    structural or numerical zero has been found during rocsparse_sbsrilu0(),
  !>    rocsparse_dbsrilu0(), rocsparse_cbsrilu0() or rocsparse_zbsrilu0() computation.
  !>    The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using same
  !>    index base as the BSR matrix.
  !>  
  !>    \p position can be in host or device memory. If no zero pivot has been found,
  !>    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !>  
  !>    \note
  !>    If a zero pivot is found, \p position \f$=j\f$ means that either the diagonal block
  !>    \f$A_{j,j}\f$ is missing (structural zero) or the diagonal block \f$A_{j,j}\f$ is not
  !>    invertible (numerical zero).
  !>  
  !>    \note \p rocsparse_bsrilu0_zero_pivot is a blocking function. It might influence
  !>    performance negatively.
  !>  
  !>    @param[in]
  !>    handle      handle to the rocsparse library context queue.
  !>    @param[in]
  !>    info        structure that holds the information collected during the analysis step.
  !>    @param[inout]
  !>    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !>  
  !>    \retval     rocsparse_status_success the operation completed successfully.
  !>    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>                invalid.
  !>    \retval     rocsparse_status_internal_error an internal error occurred.
  !>    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !>  
  interface rocsparse_bsrilu0_zero_pivot
    function rocsparse_bsrilu0_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_bsrilu0_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsrilu0_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_sbsrilu0_numeric_boost
    function rocsparse_sbsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_sbsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_float) :: boost_tol
      real(c_float) :: boost_val
    end function


  end interface
  
  interface rocsparse_dbsrilu0_numeric_boost
    function rocsparse_dbsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_dbsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: boost_tol
      real(c_double) :: boost_val
    end function


  end interface
  
  interface rocsparse_cbsrilu0_numeric_boost
    function rocsparse_cbsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_cbsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_float) :: boost_tol
      complex(c_float_complex) :: boost_val
    end function


  end interface
  
  interface rocsparse_zbsrilu0_numeric_boost
    function rocsparse_zbsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_zbsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: boost_tol
      complex(c_double_complex) :: boost_val
    end function


  end interface
  !> @{
  interface rocsparse_sbsrilu0_buffer_size
    function rocsparse_sbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_sbsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrilu0_buffer_size_rank_0,rocsparse_sbsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrilu0_buffer_size
    function rocsparse_dbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_dbsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrilu0_buffer_size_rank_0,rocsparse_dbsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrilu0_buffer_size
    function rocsparse_cbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_cbsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrilu0_buffer_size_rank_0,rocsparse_cbsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrilu0_buffer_size
    function rocsparse_zbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size) bind(c, name="rocsparse_zbsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrilu0_buffer_size_rank_0,rocsparse_zbsrilu0_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsrilu0_analysis
    function rocsparse_sbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_sbsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrilu0_analysis_rank_0,rocsparse_sbsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrilu0_analysis
    function rocsparse_dbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dbsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrilu0_analysis_rank_0,rocsparse_dbsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrilu0_analysis
    function rocsparse_cbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_cbsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrilu0_analysis_rank_0,rocsparse_cbsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrilu0_analysis
    function rocsparse_zbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zbsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrilu0_analysis_rank_0,rocsparse_zbsrilu0_analysis_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>    \brief Incomplete LU factorization with 0 fill-ins and no pivoting using BSR storage
  !>    format
  !>  
  !>    \details
  !>    \p rocsparse_bsrilu0_clear deallocates all memory that was allocated by
  !>    rocsparse_sbsrilu0_analysis(), rocsparse_dbsrilu0_analysis(), rocsparse_cbsrilu0_analysis()
  !>    or rocsparse_zbsrilu0_analysis(). This is especially useful, if memory is an issue and
  !>    the analysis data is not required for further computation.
  !>  
  !>    \note
  !>    Calling \p rocsparse_bsrilu0_clear is optional. All allocated resources will be
  !>    cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !>    rocsparse_destroy_mat_info().
  !>  
  !>    @param[in]
  !>    handle      handle to the rocsparse library context queue.
  !>    @param[inout]
  !>    info        structure that holds the information collected during the analysis step.
  !>  
  !>    \retval     rocsparse_status_success the operation completed successfully.
  !>    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>                be deallocated.
  !>    \retval     rocsparse_status_internal_error an internal error occurred.
  !>  
  interface rocsparse_bsrilu0_clear
    function rocsparse_bsrilu0_clear_orig(handle,myInfo) bind(c, name="rocsparse_bsrilu0_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_bsrilu0_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_sbsrilu0
    function rocsparse_sbsrilu0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_sbsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsrilu0_rank_0,rocsparse_sbsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_dbsrilu0
    function rocsparse_dbsrilu0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_dbsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsrilu0_rank_0,rocsparse_dbsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_cbsrilu0
    function rocsparse_cbsrilu0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_cbsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsrilu0_rank_0,rocsparse_cbsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_zbsrilu0
    function rocsparse_zbsrilu0_orig(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer) bind(c, name="rocsparse_zbsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsrilu0_rank_0,rocsparse_zbsrilu0_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>   \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using CSR
  !>   storage format
  !> 
  !>   \details
  !>   \p rocsparse_csric_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>   structural or numerical zero has been found during rocsparse_scsric0() or
  !>   rocsparse_dcsric0() computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$
  !>   is stored in \p position, using same index base as the CSR matrix.
  !> 
  !>   \p position can be in host or device memory. If no zero pivot has been found,
  !>   \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !> 
  !>   \note \p rocsparse_csric0_zero_pivot is a blocking function. It might influence
  !>   performance negatively.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   info        structure that holds the information collected during the analysis step.
  !>   @param[inout]
  !>   position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>               invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !> 
  interface rocsparse_csric0_zero_pivot
    function rocsparse_csric0_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_csric0_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csric0_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_scsric0_buffer_size
    function rocsparse_scsric0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_scsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsric0_buffer_size_rank_0,rocsparse_scsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dcsric0_buffer_size
    function rocsparse_dcsric0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_dcsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsric0_buffer_size_rank_0,rocsparse_dcsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_ccsric0_buffer_size
    function rocsparse_ccsric0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_ccsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsric0_buffer_size_rank_0,rocsparse_ccsric0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zcsric0_buffer_size
    function rocsparse_zcsric0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_zcsric0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsric0_buffer_size_rank_0,rocsparse_zcsric0_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsric0_analysis
    function rocsparse_scsric0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsric0_analysis_rank_0,rocsparse_scsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dcsric0_analysis
    function rocsparse_dcsric0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsric0_analysis_rank_0,rocsparse_dcsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_ccsric0_analysis
    function rocsparse_ccsric0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsric0_analysis_rank_0,rocsparse_ccsric0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zcsric0_analysis
    function rocsparse_zcsric0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsric0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsric0_analysis_rank_0,rocsparse_zcsric0_analysis_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>   \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using CSR
  !>   storage format
  !> 
  !>   \details
  !>   \p rocsparse_csric0_clear deallocates all memory that was allocated by
  !>   rocsparse_scsric0_analysis() or rocsparse_dcsric0_analysis(). This is especially
  !>   useful, if memory is an issue and the analysis data is not required for further
  !>   computation.
  !> 
  !>   \note
  !>   Calling \p rocsparse_csric0_clear is optional. All allocated resources will be
  !>   cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !>   rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[inout]
  !>   info        structure that holds the information collected during the analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>               be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_csric0_clear
    function rocsparse_csric0_clear_orig(handle,myInfo) bind(c, name="rocsparse_csric0_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csric0_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_scsric0
    function rocsparse_scsric0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_scsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsric0_rank_0,rocsparse_scsric0_rank_1
#endif

  end interface
  
  interface rocsparse_dcsric0
    function rocsparse_dcsric0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_dcsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsric0_rank_0,rocsparse_dcsric0_rank_1
#endif

  end interface
  
  interface rocsparse_ccsric0
    function rocsparse_ccsric0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_ccsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsric0_rank_0,rocsparse_ccsric0_rank_1
#endif

  end interface
  
  interface rocsparse_zcsric0
    function rocsparse_zcsric0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_zcsric0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsric0_rank_0,rocsparse_zcsric0_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>   \brief Incomplete LU factorization with 0 fill-ins and no pivoting using CSR
  !>   storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrilu0_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !>   structural or numerical zero has been found during rocsparse_scsrilu0(),
  !>   rocsparse_dcsrilu0(), rocsparse_ccsrilu0() or rocsparse_zcsrilu0() computation. The
  !>   first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using same index
  !>   base as the CSR matrix.
  !> 
  !>   \p position can be in host or device memory. If no zero pivot has been found,
  !>   \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !> 
  !>   \note \p rocsparse_csrilu0_zero_pivot is a blocking function. It might influence
  !>   performance negatively.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   info        structure that holds the information collected during the analysis step.
  !>   @param[inout]
  !>   position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !>               invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !> 
  interface rocsparse_csrilu0_zero_pivot
    function rocsparse_csrilu0_zero_pivot_orig(handle,myInfo,position) bind(c, name="rocsparse_csrilu0_zero_pivot")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrilu0_zero_pivot_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: position
    end function


  end interface
  !> @{
  interface rocsparse_scsrilu0_numeric_boost
    function rocsparse_scsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_scsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_float) :: boost_tol
      real(c_float) :: boost_val
    end function


  end interface
  
  interface rocsparse_dcsrilu0_numeric_boost
    function rocsparse_dcsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_dcsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: boost_tol
      real(c_double) :: boost_val
    end function


  end interface
  
  interface rocsparse_ccsrilu0_numeric_boost
    function rocsparse_ccsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_ccsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_float) :: boost_tol
      complex(c_float_complex) :: boost_val
    end function


  end interface
  
  interface rocsparse_zcsrilu0_numeric_boost
    function rocsparse_zcsrilu0_numeric_boost_orig(handle,myInfo,enable_boost,boost_tol,boost_val) bind(c, name="rocsparse_zcsrilu0_numeric_boost")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_numeric_boost_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int),value :: enable_boost
      real(c_double) :: boost_tol
      complex(c_double_complex) :: boost_val
    end function


  end interface
  !> @{
  interface rocsparse_scsrilu0_buffer_size
    function rocsparse_scsrilu0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_scsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrilu0_buffer_size_rank_0,rocsparse_scsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrilu0_buffer_size
    function rocsparse_dcsrilu0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_dcsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrilu0_buffer_size_rank_0,rocsparse_dcsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrilu0_buffer_size
    function rocsparse_ccsrilu0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_ccsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrilu0_buffer_size_rank_0,rocsparse_ccsrilu0_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrilu0_buffer_size
    function rocsparse_zcsrilu0_buffer_size_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_zcsrilu0_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrilu0_buffer_size_rank_0,rocsparse_zcsrilu0_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsrilu0_analysis
    function rocsparse_scsrilu0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrilu0_analysis_rank_0,rocsparse_scsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrilu0_analysis
    function rocsparse_dcsrilu0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrilu0_analysis_rank_0,rocsparse_dcsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrilu0_analysis
    function rocsparse_ccsrilu0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrilu0_analysis_rank_0,rocsparse_ccsrilu0_analysis_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrilu0_analysis
    function rocsparse_zcsrilu0_analysis_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrilu0_analysis")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_analysis_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrilu0_analysis_rank_0,rocsparse_zcsrilu0_analysis_rank_1
#endif

  end interface
  !> ! \ingroup precond_module
  !>   \brief Incomplete LU factorization with 0 fill-ins and no pivoting using CSR
  !>   storage format
  !> 
  !>   \details
  !>   \p rocsparse_csrilu0_clear deallocates all memory that was allocated by
  !>   rocsparse_scsrilu0_analysis(), rocsparse_dcsrilu0_analysis(),
  !>   rocsparse_ccsrilu0_analysis() or rocsparse_zcsrilu0_analysis(). This is especially
  !>   useful, if memory is an issue and the analysis data is not required for further
  !>   computation.
  !> 
  !>   \note
  !>   Calling \p rocsparse_csrilu0_clear is optional. All allocated resources will be
  !>   cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !>   rocsparse_destroy_mat_info().
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[inout]
  !>   info        structure that holds the information collected during the analysis step.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !>   \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !>               be deallocated.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_csrilu0_clear
    function rocsparse_csrilu0_clear_orig(handle,myInfo) bind(c, name="rocsparse_csrilu0_clear")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrilu0_clear_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
    end function


  end interface
  !> @{
  interface rocsparse_scsrilu0
    function rocsparse_scsrilu0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_scsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsrilu0_rank_0,rocsparse_scsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_dcsrilu0
    function rocsparse_dcsrilu0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_dcsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsrilu0_rank_0,rocsparse_dcsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_ccsrilu0
    function rocsparse_ccsrilu0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_ccsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsrilu0_rank_0,rocsparse_ccsrilu0_rank_1
#endif

  end interface
  
  interface rocsparse_zcsrilu0
    function rocsparse_zcsrilu0_orig(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer) bind(c, name="rocsparse_zcsrilu0")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsrilu0_rank_0,rocsparse_zcsrilu0_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_snnz
    function rocsparse_snnz_orig(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_snnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_snnz_full_rank,rocsparse_snnz_rank_0,rocsparse_snnz_rank_1
#endif

  end interface
  
  interface rocsparse_dnnz
    function rocsparse_dnnz_orig(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_dnnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dnnz_full_rank,rocsparse_dnnz_rank_0,rocsparse_dnnz_rank_1
#endif

  end interface
  
  interface rocsparse_cnnz
    function rocsparse_cnnz_orig(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_cnnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cnnz_full_rank,rocsparse_cnnz_rank_0,rocsparse_cnnz_rank_1
#endif

  end interface
  
  interface rocsparse_znnz
    function rocsparse_znnz_orig(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_znnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_znnz_full_rank,rocsparse_znnz_rank_0,rocsparse_znnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sdense2csr
    function rocsparse_sdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sdense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csr_orig
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
    module procedure rocsparse_sdense2csr_full_rank,rocsparse_sdense2csr_rank_0,rocsparse_sdense2csr_rank_1
#endif

  end interface
  
  interface rocsparse_ddense2csr
    function rocsparse_ddense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_ddense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csr_orig
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
    module procedure rocsparse_ddense2csr_full_rank,rocsparse_ddense2csr_rank_0,rocsparse_ddense2csr_rank_1
#endif

  end interface
  
  interface rocsparse_cdense2csr
    function rocsparse_cdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cdense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csr_orig
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
    module procedure rocsparse_cdense2csr_full_rank,rocsparse_cdense2csr_rank_0,rocsparse_cdense2csr_rank_1
#endif

  end interface
  
  interface rocsparse_zdense2csr
    function rocsparse_zdense2csr_orig(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zdense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csr_orig
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
    module procedure rocsparse_zdense2csr_full_rank,rocsparse_zdense2csr_rank_0,rocsparse_zdense2csr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr_buffer_size
    function rocsparse_sprune_dense2csr_buffer_size_orig(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size) bind(c, name="rocsparse_sprune_dense2csr_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_buffer_size_full_rank,rocsparse_sprune_dense2csr_buffer_size_rank_0,rocsparse_sprune_dense2csr_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr_buffer_size
    function rocsparse_dprune_dense2csr_buffer_size_orig(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size) bind(c, name="rocsparse_dprune_dense2csr_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_buffer_size_full_rank,rocsparse_dprune_dense2csr_buffer_size_rank_0,rocsparse_dprune_dense2csr_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr_nnz
    function rocsparse_sprune_dense2csr_nnz_orig(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer) bind(c, name="rocsparse_sprune_dense2csr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_nnz_full_rank,rocsparse_sprune_dense2csr_nnz_rank_0,rocsparse_sprune_dense2csr_nnz_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr_nnz
    function rocsparse_dprune_dense2csr_nnz_orig(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer) bind(c, name="rocsparse_dprune_dense2csr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_nnz_full_rank,rocsparse_dprune_dense2csr_nnz_rank_0,rocsparse_dprune_dense2csr_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr
    function rocsparse_sprune_dense2csr_orig(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_sprune_dense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_full_rank,rocsparse_sprune_dense2csr_rank_0,rocsparse_sprune_dense2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr
    function rocsparse_dprune_dense2csr_orig(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_dprune_dense2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_full_rank,rocsparse_dprune_dense2csr_rank_0,rocsparse_dprune_dense2csr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr_by_percentage_buffer_size
    function rocsparse_sprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_sprune_dense2csr_by_percentage_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_by_percentage_buffer_size_full_rank,rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_0,rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr_by_percentage_buffer_size
    function rocsparse_dprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size) bind(c, name="rocsparse_dprune_dense2csr_by_percentage_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_by_percentage_buffer_size_full_rank,rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_0,rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr_nnz_by_percentage
    function rocsparse_sprune_dense2csr_nnz_by_percentage_orig(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer) bind(c, name="rocsparse_sprune_dense2csr_nnz_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_nnz_by_percentage_full_rank,rocsparse_sprune_dense2csr_nnz_by_percentage_rank_0,rocsparse_sprune_dense2csr_nnz_by_percentage_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr_nnz_by_percentage
    function rocsparse_dprune_dense2csr_nnz_by_percentage_orig(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer) bind(c, name="rocsparse_dprune_dense2csr_nnz_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_nnz_by_percentage_full_rank,rocsparse_dprune_dense2csr_nnz_by_percentage_rank_0,rocsparse_dprune_dense2csr_nnz_by_percentage_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_dense2csr_by_percentage
    function rocsparse_sprune_dense2csr_by_percentage_orig(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer) bind(c, name="rocsparse_sprune_dense2csr_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_dense2csr_by_percentage_full_rank,rocsparse_sprune_dense2csr_by_percentage_rank_0,rocsparse_sprune_dense2csr_by_percentage_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_dense2csr_by_percentage
    function rocsparse_dprune_dense2csr_by_percentage_orig(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer) bind(c, name="rocsparse_dprune_dense2csr_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_dense2csr_by_percentage_full_rank,rocsparse_dprune_dense2csr_by_percentage_rank_0,rocsparse_dprune_dense2csr_by_percentage_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sdense2csc
    function rocsparse_sdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_sdense2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sdense2csc_full_rank,rocsparse_sdense2csc_rank_0,rocsparse_sdense2csc_rank_1
#endif

  end interface
  
  interface rocsparse_ddense2csc
    function rocsparse_ddense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_ddense2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ddense2csc_full_rank,rocsparse_ddense2csc_rank_0,rocsparse_ddense2csc_rank_1
#endif

  end interface
  
  interface rocsparse_cdense2csc
    function rocsparse_cdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_cdense2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cdense2csc_full_rank,rocsparse_cdense2csc_rank_0,rocsparse_cdense2csc_rank_1
#endif

  end interface
  
  interface rocsparse_zdense2csc
    function rocsparse_zdense2csc_orig(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_zdense2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zdense2csc_full_rank,rocsparse_zdense2csc_rank_0,rocsparse_zdense2csc_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2dense
    function rocsparse_scsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_scsr2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2dense_orig
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
    module procedure rocsparse_scsr2dense_full_rank,rocsparse_scsr2dense_rank_0,rocsparse_scsr2dense_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2dense
    function rocsparse_dcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_dcsr2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2dense_orig
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
    module procedure rocsparse_dcsr2dense_full_rank,rocsparse_dcsr2dense_rank_0,rocsparse_dcsr2dense_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2dense
    function rocsparse_ccsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_ccsr2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2dense_orig
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
    module procedure rocsparse_ccsr2dense_full_rank,rocsparse_ccsr2dense_rank_0,rocsparse_ccsr2dense_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2dense
    function rocsparse_zcsr2dense_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_zcsr2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2dense_orig
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
    module procedure rocsparse_zcsr2dense_full_rank,rocsparse_zcsr2dense_rank_0,rocsparse_zcsr2dense_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsc2dense
    function rocsparse_scsc2dense_orig(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_scsc2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsc2dense_full_rank,rocsparse_scsc2dense_rank_0,rocsparse_scsc2dense_rank_1
#endif

  end interface
  
  interface rocsparse_dcsc2dense
    function rocsparse_dcsc2dense_orig(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_dcsc2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsc2dense_full_rank,rocsparse_dcsc2dense_rank_0,rocsparse_dcsc2dense_rank_1
#endif

  end interface
  
  interface rocsparse_ccsc2dense
    function rocsparse_ccsc2dense_orig(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_ccsc2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsc2dense_full_rank,rocsparse_ccsc2dense_rank_0,rocsparse_ccsc2dense_rank_1
#endif

  end interface
  
  interface rocsparse_zcsc2dense
    function rocsparse_zcsc2dense_orig(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_zcsc2dense")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsc2dense_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsc2dense_full_rank,rocsparse_zcsc2dense_rank_0,rocsparse_zcsc2dense_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_snnz_compress
    function rocsparse_snnz_compress_orig(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_snnz_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      real(c_float),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_snnz_compress_rank_0,rocsparse_snnz_compress_rank_1
#endif

  end interface
  
  interface rocsparse_dnnz_compress
    function rocsparse_dnnz_compress_orig(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_dnnz_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      real(c_double),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dnnz_compress_rank_0,rocsparse_dnnz_compress_rank_1
#endif

  end interface
  
  interface rocsparse_cnnz_compress
    function rocsparse_cnnz_compress_orig(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_cnnz_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      complex(c_float_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cnnz_compress_rank_0,rocsparse_cnnz_compress_rank_1
#endif

  end interface
  
  interface rocsparse_znnz_compress
    function rocsparse_znnz_compress_orig(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_znnz_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      complex(c_double_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_znnz_compress_rank_0,rocsparse_znnz_compress_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Convert a sparse CSR matrix into a sparse COO matrix
  !> 
  !>   \details
  !>   \p rocsparse_csr2coo converts the CSR array containing the row offsets, that point
  !>   to the start of every row, into a COO array of row indices.
  !> 
  !>   \note
  !>   It can also be used to convert a CSC array containing the column offsets into a COO
  !>   array of column indices.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   csr_row_ptr array of \p m+1 elements that point to the start of every row
  !>               of the sparse CSR matrix.
  !>   @param[in]
  !>   nnz         number of non-zero entries of the sparse CSR matrix.
  !>   @param[in]
  !>   m           number of rows of the sparse CSR matrix.
  !>   @param[out]
  !>   coo_row_ind array of \p nnz elements containing the row indices of the sparse COO
  !>               matrix.
  !>   @param[in]
  !>   idx_base    \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csr_row_ptr or \p coo_row_ind
  !>               pointer is invalid.
  !>   \retval     rocsparse_status_arch_mismatch the device is not supported.
  !> 
  !>   \par Example
  !>   This example converts a CSR matrix into a COO matrix.
  !>   \code{.c}
  !>            1 2 0 3 0
  !>        A = 0 4 5 0 0
  !>            6 0 0 7 8
  !> 
  !>       rocsparse_int m   = 3;
  !>       rocsparse_int n   = 5;
  !>       rocsparse_int nnz = 8;
  !> 
  !>       csr_row_ptr[m+1] = {0, 3, 5, 8};              device memory
  !>       csr_col_ind[nnz] = {0, 1, 3, 1, 2, 0, 3, 4};  device memory
  !>       csr_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8};  device memory
  !> 
  !>        Allocate COO matrix arrays
  !>       rocsparse_int coo_row_ind;
  !>       rocsparse_int coo_col_ind;
  !>       float coo_val;
  !> 
  !>       hipMalloc((void)&coo_row_ind, sizeof(rocsparse_int)  nnz);
  !>       hipMalloc((void)&coo_col_ind, sizeof(rocsparse_int)  nnz);
  !>       hipMalloc((void)&coo_val, sizeof(float)  nnz);
  !> 
  !>        Convert the csr row offsets into coo row indices
  !>       rocsparse_csr2coo(handle,
  !>                         csr_row_ptr,
  !>                         nnz,
  !>                         m,
  !>                         coo_row_ind,
  !>                         rocsparse_index_base_zero);
  !> 
  !>        Copy the column and value arrays
  !>       hipMemcpy(coo_col_ind,
  !>                 csr_col_ind,
  !>                 sizeof(rocsparse_int)  nnz,
  !>                 hipMemcpyDeviceToDevice);
  !> 
  !>       hipMemcpy(coo_val,
  !>                 csr_val,
  !>                 sizeof(float)  nnz,
  !>                 hipMemcpyDeviceToDevice);
  !>   \endcode
  !> 
  interface rocsparse_csr2coo
    function rocsparse_csr2coo_orig(handle,csr_row_ptr,nnz,m,coo_row_ind,idx_base) bind(c, name="rocsparse_csr2coo")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2coo_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: csr_row_ptr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: coo_row_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csr2coo_rank_0,rocsparse_csr2coo_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Convert a sparse CSR matrix into a sparse CSC matrix
  !> 
  !>   \details
  !>   \p rocsparse_csr2csc_buffer_size returns the size of the temporary storage buffer
  !>   required by rocsparse_scsr2csc(), rocsparse_dcsr2csc(), rocsparse_ccsr2csc() and
  !>   rocsparse_zcsr2csc(). The temporary storage buffer must be allocated by the user.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m           number of rows of the sparse CSR matrix.
  !>   @param[in]
  !>   n           number of columns of the sparse CSR matrix.
  !>   @param[in]
  !>   nnz         number of non-zero entries of the sparse CSR matrix.
  !>   @param[in]
  !>   csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !>               sparse CSR matrix.
  !>   @param[in]
  !>   csr_col_ind array of \p nnz elements containing the column indices of the sparse
  !>               CSR matrix.
  !>   @param[in]
  !>   copy_values \ref rocsparse_action_symbolic or \ref rocsparse_action_numeric.
  !>   @param[out]
  !>   buffer_size number of bytes of the temporary storage buffer required by
  !>               rocsparse_scsr2csc(), rocsparse_dcsr2csc(), rocsparse_ccsr2csc() and
  !>               rocsparse_zcsr2csc().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csr_row_ptr, \p csr_col_ind or
  !>               \p buffer_size pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_csr2csc_buffer_size
    function rocsparse_csr2csc_buffer_size_orig(handle,m,n,nnz,csr_row_ptr,csr_col_ind,copy_values,buffer_size) bind(c, name="rocsparse_csr2csc_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2csc_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csr2csc_buffer_size_rank_0,rocsparse_csr2csc_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2csc
    function rocsparse_scsr2csc_orig(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_scsr2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsr2csc_rank_0,rocsparse_scsr2csc_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2csc
    function rocsparse_dcsr2csc_orig(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_dcsr2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsr2csc_rank_0,rocsparse_dcsr2csc_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2csc
    function rocsparse_ccsr2csc_orig(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_ccsr2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsr2csc_rank_0,rocsparse_ccsr2csc_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2csc
    function rocsparse_zcsr2csc_orig(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_zcsr2csc")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csc_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsr2csc_rank_0,rocsparse_zcsr2csc_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Convert a sparse CSR matrix into a sparse ELL matrix
  !> 
  !>   \details
  !>   \p rocsparse_csr2ell_width computes the maximum of the per row non-zero elements
  !>   over all rows, the ELL \p width, for a given CSR matrix.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m           number of rows of the sparse CSR matrix.
  !>   @param[in]
  !>   csr_descr   descriptor of the sparse CSR matrix. Currently, only
  !>               \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !>               sparse CSR matrix.
  !>   @param[in]
  !>   ell_descr   descriptor of the sparse ELL matrix. Currently, only
  !>               \ref rocsparse_matrix_type_general is supported.
  !>   @param[out]
  !>   ell_width   pointer to the number of non-zero elements per row in ELL storage
  !>               format.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csr_descr, \p csr_row_ptr, or
  !>               \p ell_width pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_not_implemented
  !>               \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  interface rocsparse_csr2ell_width
    function rocsparse_csr2ell_width_orig(handle,m,csr_descr,csr_row_ptr,ell_descr,ell_width) bind(c, name="rocsparse_csr2ell_width")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2ell_width_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: ell_descr
      type(c_ptr),value :: ell_width
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csr2ell_width_rank_0,rocsparse_csr2ell_width_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2ell
    function rocsparse_scsr2ell_orig(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_scsr2ell")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2ell_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsr2ell_rank_0,rocsparse_scsr2ell_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2ell
    function rocsparse_dcsr2ell_orig(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_dcsr2ell")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2ell_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsr2ell_rank_0,rocsparse_dcsr2ell_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2ell
    function rocsparse_ccsr2ell_orig(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_ccsr2ell")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2ell_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsr2ell_rank_0,rocsparse_ccsr2ell_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2ell
    function rocsparse_zcsr2ell_orig(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_zcsr2ell")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2ell_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsr2ell_rank_0,rocsparse_zcsr2ell_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2hyb
    function rocsparse_scsr2hyb_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_scsr2hyb")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsr2hyb_rank_0,rocsparse_scsr2hyb_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2hyb
    function rocsparse_dcsr2hyb_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_dcsr2hyb")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsr2hyb_rank_0,rocsparse_dcsr2hyb_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2hyb
    function rocsparse_ccsr2hyb_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_ccsr2hyb")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsr2hyb_rank_0,rocsparse_ccsr2hyb_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2hyb
    function rocsparse_zcsr2hyb_orig(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_zcsr2hyb")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2hyb_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsr2hyb_rank_0,rocsparse_zcsr2hyb_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief
  !>   This function computes the number of nonzero block columns per row and the total number of nonzero blocks in a sparse
  !>   BSR matrix given a sparse CSR matrix as input.
  !> 
  !>   \details
  !>   The routine does support asynchronous execution if the pointer mode is set to device.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !> 
  !>   @param[in]
  !>   dir         direction that specified whether to count nonzero elements by \ref rocsparse_direction_row or by
  !>               \ref rocsparse_direction_row.
  !> 
  !>   @param[in]
  !>   m           number of rows of the sparse CSR matrix.
  !> 
  !>   @param[in]
  !>   n           number of columns of the sparse CSR matrix.
  !> 
  !>   @param[in]
  !>   csr_descr    descriptor of the sparse CSR matrix. Currently, only
  !>                \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   csr_row_ptr integer array containing \p m+1 elements that point to the start of each row of the CSR matrix
  !> 
  !>   @param[in]
  !>   csr_col_ind integer array of the column indices for each non-zero element in the CSR matrix
  !> 
  !>   @param[in]
  !>   block_dim   the block dimension of the BSR matrix. Between 1 and min(m, n)
  !> 
  !>   @param[in]
  !>   bsr_descr    descriptor of the sparse BSR matrix. Currently, only
  !>                \ref rocsparse_matrix_type_general is supported.
  !>   @param[out]
  !>   bsr_row_ptr integer array containing \p mb+1 elements that point to the start of each block row of the BSR matrix
  !> 
  !>   @param[out]
  !>   bsr_nnz     total number of nonzero elements in device or host memory.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m or \p n or \p block_dim is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csr_row_ptr or \p csr_col_ind or \p bsr_row_ptr or \p bsr_nnz
  !>               pointer is invalid.
  !> 
  interface rocsparse_csr2bsr_nnz
    function rocsparse_csr2bsr_nnz_orig(handle,dir,m,n,csr_descr,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_row_ptr,bsr_nnz) bind(c, name="rocsparse_csr2bsr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2bsr_nnz_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_nnz
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csr2bsr_nnz_rank_0,rocsparse_csr2bsr_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2bsr
    function rocsparse_scsr2bsr_orig(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_scsr2bsr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsr2bsr_rank_0,rocsparse_scsr2bsr_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2bsr
    function rocsparse_dcsr2bsr_orig(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_dcsr2bsr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsr2bsr_rank_0,rocsparse_dcsr2bsr_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2bsr
    function rocsparse_ccsr2bsr_orig(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_ccsr2bsr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsr2bsr_rank_0,rocsparse_ccsr2bsr_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2bsr
    function rocsparse_zcsr2bsr_orig(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_zcsr2bsr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2bsr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsr2bsr_rank_0,rocsparse_zcsr2bsr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_scsr2csr_compress
    function rocsparse_scsr2csr_compress_orig(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_scsr2csr_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      real(c_float),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_scsr2csr_compress_rank_0,rocsparse_scsr2csr_compress_rank_1
#endif

  end interface
  
  interface rocsparse_dcsr2csr_compress
    function rocsparse_dcsr2csr_compress_orig(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_dcsr2csr_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      real(c_double),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dcsr2csr_compress_rank_0,rocsparse_dcsr2csr_compress_rank_1
#endif

  end interface
  
  interface rocsparse_ccsr2csr_compress
    function rocsparse_ccsr2csr_compress_orig(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_ccsr2csr_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      complex(c_float_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ccsr2csr_compress_rank_0,rocsparse_ccsr2csr_compress_rank_1
#endif

  end interface
  
  interface rocsparse_zcsr2csr_compress
    function rocsparse_zcsr2csr_compress_orig(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_zcsr2csr_compress")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csr_compress_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      complex(c_double_complex),value :: tol
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zcsr2csr_compress_rank_0,rocsparse_zcsr2csr_compress_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr_buffer_size
    function rocsparse_sprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size) bind(c, name="rocsparse_sprune_csr2csr_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_buffer_size_rank_0,rocsparse_sprune_csr2csr_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr_buffer_size
    function rocsparse_dprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size) bind(c, name="rocsparse_dprune_csr2csr_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_buffer_size_rank_0,rocsparse_dprune_csr2csr_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr_nnz
    function rocsparse_sprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer) bind(c, name="rocsparse_sprune_csr2csr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_nnz_rank_0,rocsparse_sprune_csr2csr_nnz_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr_nnz
    function rocsparse_dprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer) bind(c, name="rocsparse_dprune_csr2csr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_nnz_rank_0,rocsparse_dprune_csr2csr_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr
    function rocsparse_sprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer) bind(c, name="rocsparse_sprune_csr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_rank_0,rocsparse_sprune_csr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr
    function rocsparse_dprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer) bind(c, name="rocsparse_dprune_csr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_rank_0,rocsparse_dprune_csr2csr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr_by_percentage_buffer_size
    function rocsparse_sprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size) bind(c, name="rocsparse_sprune_csr2csr_by_percentage_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_0,rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr_by_percentage_buffer_size
    function rocsparse_dprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size) bind(c, name="rocsparse_dprune_csr2csr_by_percentage_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_0,rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr_nnz_by_percentage
    function rocsparse_sprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer) bind(c, name="rocsparse_sprune_csr2csr_nnz_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_nnz_by_percentage_rank_0,rocsparse_sprune_csr2csr_nnz_by_percentage_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr_nnz_by_percentage
    function rocsparse_dprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer) bind(c, name="rocsparse_dprune_csr2csr_nnz_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_nnz_by_percentage_rank_0,rocsparse_dprune_csr2csr_nnz_by_percentage_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sprune_csr2csr_by_percentage
    function rocsparse_sprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer) bind(c, name="rocsparse_sprune_csr2csr_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sprune_csr2csr_by_percentage_rank_0,rocsparse_sprune_csr2csr_by_percentage_rank_1
#endif

  end interface
  
  interface rocsparse_dprune_csr2csr_by_percentage
    function rocsparse_dprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer) bind(c, name="rocsparse_dprune_csr2csr_by_percentage")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dprune_csr2csr_by_percentage_rank_0,rocsparse_dprune_csr2csr_by_percentage_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>    \brief Convert a sparse COO matrix into a sparse CSR matrix
  !>  
  !>    \details
  !>    \p rocsparse_coo2csr converts the COO array containing the row indices into a
  !>    CSR array of row offsets, that point to the start of every row.
  !>    It is assumed that the COO row index array is sorted.
  !>  
  !>    \note It can also be used, to convert a COO array containing the column indices into
  !>    a CSC array of column offsets, that point to the start of every column. Then, it is
  !>    assumed that the COO column index array is sorted, instead.
  !>  
  !>    \note
  !>    This function is non blocking and executed asynchronously with respect to the host.
  !>    It may return before the actual computation has finished.
  !>  
  !>    @param[in]
  !>    handle      handle to the rocsparse library context queue.
  !>    @param[in]
  !>    coo_row_ind array of \p nnz elements containing the row indices of the sparse COO
  !>                matrix.
  !>    @param[in]
  !>    nnz         number of non-zero entries of the sparse CSR matrix.
  !>    @param[in]
  !>    m           number of rows of the sparse CSR matrix.
  !>    @param[out]
  !>    csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !>                sparse CSR matrix.
  !>    @param[in]
  !>    idx_base    \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !>  
  !>    \retval     rocsparse_status_success the operation completed successfully.
  !>    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>    \retval     rocsparse_status_invalid_size \p m or \p nnz is invalid.
  !>    \retval     rocsparse_status_invalid_pointer \p coo_row_ind or \p csr_row_ptr
  !>                pointer is invalid.
  !>  
  !>    \par Example
  !>    This example converts a COO matrix into a CSR matrix.
  !>    \code{.c}
  !>             1 2 0 3 0
  !>         A = 0 4 5 0 0
  !>             6 0 0 7 8
  !>  
  !>        rocsparse_int m   = 3;
  !>        rocsparse_int n   = 5;
  !>        rocsparse_int nnz = 8;
  !>  
  !>        coo_row_ind[nnz] = {0, 0, 0, 1, 1, 2, 2, 2};  device memory
  !>        coo_col_ind[nnz] = {0, 1, 3, 1, 2, 0, 3, 4};  device memory
  !>        coo_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8};  device memory
  !>  
  !>         Allocate CSR matrix arrays
  !>        rocsparse_int csr_row_ptr;
  !>        rocsparse_int csr_col_ind;
  !>        float csr_val;
  !>  
  !>        hipMalloc((void)&csr_row_ptr, sizeof(rocsparse_int)  (m + 1));
  !>        hipMalloc((void)&csr_col_ind, sizeof(rocsparse_int)  nnz);
  !>        hipMalloc((void)&csr_val, sizeof(float)  nnz);
  !>  
  !>         Convert the coo row indices into csr row offsets
  !>        rocsparse_coo2csr(handle,
  !>                          coo_row_ind,
  !>                          nnz,
  !>                          m,
  !>                          csr_row_ptr,
  !>                          rocsparse_index_base_zero);
  !>  
  !>         Copy the column and value arrays
  !>        hipMemcpy(csr_col_ind,
  !>                  coo_col_ind,
  !>                  sizeof(rocsparse_int)  nnz,
  !>                  hipMemcpyDeviceToDevice);
  !>  
  !>        hipMemcpy(csr_val,
  !>                  coo_val,
  !>                  sizeof(float)  nnz,
  !>                  hipMemcpyDeviceToDevice);
  !>    \endcode
  !>  
  interface rocsparse_coo2csr
    function rocsparse_coo2csr_orig(handle,coo_row_ind,nnz,m,csr_row_ptr,idx_base) bind(c, name="rocsparse_coo2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coo2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: coo_row_ind
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: csr_row_ptr
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_coo2csr_rank_0,rocsparse_coo2csr_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Convert a sparse ELL matrix into a sparse CSR matrix
  !> 
  !>   \details
  !>   \p rocsparse_ell2csr_nnz computes the total CSR non-zero elements and the CSR
  !>   row offsets, that point to the start of every row of the sparse CSR matrix, for
  !>   a given ELL matrix. It is assumed that \p csr_row_ptr has been allocated with
  !>   size \p m + 1.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m           number of rows of the sparse ELL matrix.
  !>   @param[in]
  !>   n           number of columns of the sparse ELL matrix.
  !>   @param[in]
  !>   ell_descr   descriptor of the sparse ELL matrix. Currently, only
  !>               \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   ell_width   number of non-zero elements per row in ELL storage format.
  !>   @param[in]
  !>   ell_col_ind array of \p m times \p ell_width elements containing the column indices
  !>               of the sparse ELL matrix.
  !>   @param[in]
  !>   csr_descr   descriptor of the sparse CSR matrix. Currently, only
  !>               \ref rocsparse_matrix_type_general is supported.
  !>   @param[out]
  !>   csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !>               sparse CSR matrix.
  !>   @param[out]
  !>   csr_nnz     pointer to the total number of non-zero elements in CSR storage
  !>               format.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p ell_width is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p ell_descr, \p ell_col_ind,
  !>               \p csr_descr, \p csr_row_ptr or \p csr_nnz pointer is invalid.
  !>   \retval     rocsparse_status_not_implemented
  !>               \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  interface rocsparse_ell2csr_nnz
    function rocsparse_ell2csr_nnz_orig(handle,m,n,ell_descr,ell_width,ell_col_ind,csr_descr,csr_row_ptr,csr_nnz) bind(c, name="rocsparse_ell2csr_nnz")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ell2csr_nnz_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_nnz
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_ell2csr_nnz_rank_0,rocsparse_ell2csr_nnz_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sell2csr
    function rocsparse_sell2csr_orig(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sell2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sell2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sell2csr_rank_0,rocsparse_sell2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dell2csr
    function rocsparse_dell2csr_orig(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_dell2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dell2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dell2csr_rank_0,rocsparse_dell2csr_rank_1
#endif

  end interface
  
  interface rocsparse_cell2csr
    function rocsparse_cell2csr_orig(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cell2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cell2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cell2csr_rank_0,rocsparse_cell2csr_rank_1
#endif

  end interface
  
  interface rocsparse_zell2csr
    function rocsparse_zell2csr_orig(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zell2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zell2csr_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zell2csr_rank_0,rocsparse_zell2csr_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Convert a sparse HYB matrix into a sparse CSR matrix
  !> 
  !>   \details
  !>   \p rocsparse_hyb2csr_buffer_size returns the size of the temporary storage buffer
  !>   required by rocsparse_shyb2csr(), rocsparse_dhyb2csr(), rocsparse_chyb2csr() and
  !>   rocsparse_dhyb2csr(). The temporary storage buffer must be allocated by the user.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   descr           descriptor of the sparse HYB matrix. Currently, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   hyb             sparse matrix in HYB format.
  !>   @param[in]
  !>   csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix.
  !>   @param[out]
  !>   buffer_size     number of bytes of the temporary storage buffer required by
  !>                   rocsparse_shyb2csr(), rocsparse_dhyb2csr(), rocsparse_chyb2csr() and
  !>                   rocsparse_zhyb2csr().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_pointer \p descr, \p hyb, \p csr_row_ptr or
  !>               \p buffer_size pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_not_implemented
  !>               \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  interface rocsparse_hyb2csr_buffer_size
    function rocsparse_hyb2csr_buffer_size_orig(handle,descr,hyb,csr_row_ptr,buffer_size) bind(c, name="rocsparse_hyb2csr_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_hyb2csr_buffer_size_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: csr_row_ptr
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_hyb2csr_buffer_size_rank_0,rocsparse_hyb2csr_buffer_size_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_shyb2csr
    function rocsparse_shyb2csr_orig(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_shyb2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_shyb2csr_rank_0,rocsparse_shyb2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dhyb2csr
    function rocsparse_dhyb2csr_orig(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_dhyb2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dhyb2csr_rank_0,rocsparse_dhyb2csr_rank_1
#endif

  end interface
  
  interface rocsparse_chyb2csr
    function rocsparse_chyb2csr_orig(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_chyb2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_chyb2csr_rank_0,rocsparse_chyb2csr_rank_1
#endif

  end interface
  
  interface rocsparse_zhyb2csr
    function rocsparse_zhyb2csr_orig(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_zhyb2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhyb2csr_orig
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zhyb2csr_rank_0,rocsparse_zhyb2csr_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Create the identity map
  !> 
  !>   \details
  !>   \p rocsparse_create_identity_permutation stores the identity map in \p p, such that
  !>   \f$p = 0:1:(n-1)\f$.
  !> 
  !>   \code{.c}
  !>       for(i = 0; i < n; ++i)
  !>       {
  !>           p[i] = i;
  !>       }
  !>   \endcode
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle      handle to the rocsparse library context queue.
  !>   @param[in]
  !>   n           size of the map \p p.
  !>   @param[out]
  !>   p           array of \p n integers containing the map.
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p n is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p p pointer is invalid.
  !> 
  !>   \par Example
  !>   The following example creates an identity permutation.
  !>   \code{.c}
  !>       rocsparse_int size = 200;
  !> 
  !>        Allocate memory to hold the identity map
  !>       rocsparse_int perm;
  !>       hipMalloc((void)&perm, sizeof(rocsparse_int)  size);
  !> 
  !>        Fill perm with the identity permutation
  !>       rocsparse_create_identity_permutation(handle, size, perm);
  !>   \endcode
  !> 
  interface rocsparse_create_identity_permutation
    function rocsparse_create_identity_permutation_orig(handle,n,p) bind(c, name="rocsparse_create_identity_permutation")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_identity_permutation_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: p
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_create_identity_permutation_rank_0,rocsparse_create_identity_permutation_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse CSR matrix
  !> 
  !>   \details
  !>   \p rocsparse_csrsort_buffer_size returns the size of the temporary storage buffer
  !>   required by rocsparse_csrsort(). The temporary storage buffer must be allocated by
  !>   the user.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse CSR matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse CSR matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse CSR matrix.
  !>   @param[in]
  !>   csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix.
  !>   @param[in]
  !>   csr_col_ind     array of \p nnz elements containing the column indices of the sparse
  !>                   CSR matrix.
  !>   @param[out]
  !>   buffer_size     number of bytes of the temporary storage buffer required by
  !>                   rocsparse_csrsort().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csr_row_ptr, \p csr_col_ind or
  !>               \p buffer_size pointer is invalid.
  !> 
  interface rocsparse_csrsort_buffer_size
    function rocsparse_csrsort_buffer_size_orig(handle,m,n,nnz,csr_row_ptr,csr_col_ind,buffer_size) bind(c, name="rocsparse_csrsort_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csrsort_buffer_size_rank_0,rocsparse_csrsort_buffer_size_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse CSR matrix
  !> 
  !>   \details
  !>   \p rocsparse_csrsort sorts a matrix in CSR format. The sorted permutation vector
  !>   \p perm can be used to obtain sorted \p csr_val array. In this case, \p perm must be
  !>   initialized as the identity permutation, see rocsparse_create_identity_permutation().
  !> 
  !>   \p rocsparse_csrsort requires extra temporary storage buffer that has to be allocated by
  !>   the user. Storage buffer size can be determined by rocsparse_csrsort_buffer_size().
  !> 
  !>   \note
  !>   \p perm can be \p NULL if a sorted permutation vector is not required.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse CSR matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse CSR matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse CSR matrix.
  !>   @param[in]
  !>   descr           descriptor of the sparse CSR matrix. Currently, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !>                   sparse CSR matrix.
  !>   @param[inout]
  !>   csr_col_ind     array of \p nnz elements containing the column indices of the sparse
  !>                   CSR matrix.
  !>   @param[inout]
  !>   perm            array of \p nnz integers containing the unsorted map indices, can be
  !>                   \p NULL.
  !>   @param[in]
  !>   temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !>                   rocsparse_csrsort_buffer_size().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p descr, \p csr_row_ptr, \p csr_col_ind
  !>               or \p temp_buffer pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_not_implemented
  !>               \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  !>   \par Example
  !>   The following example sorts a \f$3 \times 3\f$ CSR matrix.
  !>   \code{.c}
  !>            1 2 3
  !>        A = 4 5 6
  !>            7 8 9
  !>       rocsparse_int m   = 3;
  !>       rocsparse_int n   = 3;
  !>       rocsparse_int nnz = 9;
  !> 
  !>       csr_row_ptr[m + 1] = {0, 3, 6, 9};                 device memory
  !>       csr_col_ind[nnz]   = {2, 0, 1, 0, 1, 2, 0, 2, 1};  device memory
  !>       csr_val[nnz]       = {3, 1, 2, 4, 5, 6, 7, 9, 8};  device memory
  !> 
  !>        Create permutation vector perm as the identity map
  !>       rocsparse_int perm;
  !>       hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !>       rocsparse_create_identity_permutation(handle, nnz, perm);
  !> 
  !>        Allocate temporary buffer
  !>       size_t buffer_size;
  !>       void temp_buffer;
  !>       rocsparse_csrsort_buffer_size(handle, m, n, nnz, csr_row_ptr, csr_col_ind, &buffer_size);
  !>       hipMalloc(&temp_buffer, buffer_size);
  !> 
  !>        Sort the CSR matrix
  !>       rocsparse_csrsort(handle, m, n, nnz, descr, csr_row_ptr, csr_col_ind, perm, temp_buffer);
  !> 
  !>        Gather sorted csr_val array
  !>       float csr_val_sorted;
  !>       hipMalloc((void)&csr_val_sorted, sizeof(float)  nnz);
  !>       rocsparse_sgthr(handle, nnz, csr_val, csr_val_sorted, perm, rocsparse_index_base_zero);
  !> 
  !>        Clean up
  !>       hipFree(temp_buffer);
  !>       hipFree(perm);
  !>       hipFree(csr_val);
  !>   \endcode
  !> 
  interface rocsparse_csrsort
    function rocsparse_csrsort_orig(handle,m,n,nnz,descr,csr_row_ptr,csr_col_ind,perm,temp_buffer) bind(c, name="rocsparse_csrsort")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_csrsort_rank_0,rocsparse_csrsort_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse CSC matrix
  !> 
  !>   \details
  !>   \p rocsparse_cscsort_buffer_size returns the size of the temporary storage buffer
  !>   required by rocsparse_cscsort(). The temporary storage buffer must be allocated by
  !>   the user.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse CSC matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse CSC matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse CSC matrix.
  !>   @param[in]
  !>   csc_col_ptr     array of \p n+1 elements that point to the start of every column of
  !>                   the sparse CSC matrix.
  !>   @param[in]
  !>   csc_row_ind     array of \p nnz elements containing the row indices of the sparse
  !>                   CSC matrix.
  !>   @param[out]
  !>   buffer_size     number of bytes of the temporary storage buffer required by
  !>                   rocsparse_cscsort().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p csc_col_ptr, \p csc_row_ind or
  !>               \p buffer_size pointer is invalid.
  !> 
  interface rocsparse_cscsort_buffer_size
    function rocsparse_cscsort_buffer_size_orig(handle,m,n,nnz,csc_col_ptr,csc_row_ind,buffer_size) bind(c, name="rocsparse_cscsort_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cscsort_buffer_size_rank_0,rocsparse_cscsort_buffer_size_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse CSC matrix
  !> 
  !>   \details
  !>   \p rocsparse_cscsort sorts a matrix in CSC format. The sorted permutation vector
  !>   \p perm can be used to obtain sorted \p csc_val array. In this case, \p perm must be
  !>   initialized as the identity permutation, see rocsparse_create_identity_permutation().
  !> 
  !>   \p rocsparse_cscsort requires extra temporary storage buffer that has to be allocated by
  !>   the user. Storage buffer size can be determined by rocsparse_cscsort_buffer_size().
  !> 
  !>   \note
  !>   \p perm can be \p NULL if a sorted permutation vector is not required.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse CSC matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse CSC matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse CSC matrix.
  !>   @param[in]
  !>   descr           descriptor of the sparse CSC matrix. Currently, only
  !>                   \ref rocsparse_matrix_type_general is supported.
  !>   @param[in]
  !>   csc_col_ptr     array of \p n+1 elements that point to the start of every column of
  !>                   the sparse CSC matrix.
  !>   @param[inout]
  !>   csc_row_ind     array of \p nnz elements containing the row indices of the sparse
  !>                   CSC matrix.
  !>   @param[inout]
  !>   perm            array of \p nnz integers containing the unsorted map indices, can be
  !>                   \p NULL.
  !>   @param[in]
  !>   temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !>                   rocsparse_cscsort_buffer_size().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p descr, \p csc_col_ptr, \p csc_row_ind
  !>               or \p temp_buffer pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !>   \retval     rocsparse_status_not_implemented
  !>               \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !> 
  !>   \par Example
  !>   The following example sorts a \f$3 \times 3\f$ CSC matrix.
  !>   \code{.c}
  !>            1 2 3
  !>        A = 4 5 6
  !>            7 8 9
  !>       rocsparse_int m   = 3;
  !>       rocsparse_int n   = 3;
  !>       rocsparse_int nnz = 9;
  !> 
  !>       csc_col_ptr[m + 1] = {0, 3, 6, 9};                 device memory
  !>       csc_row_ind[nnz]   = {2, 0, 1, 0, 1, 2, 0, 2, 1};  device memory
  !>       csc_val[nnz]       = {7, 1, 4, 2, 5, 8, 3, 9, 6};  device memory
  !> 
  !>        Create permutation vector perm as the identity map
  !>       rocsparse_int perm;
  !>       hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !>       rocsparse_create_identity_permutation(handle, nnz, perm);
  !> 
  !>        Allocate temporary buffer
  !>       size_t buffer_size;
  !>       void temp_buffer;
  !>       rocsparse_cscsort_buffer_size(handle, m, n, nnz, csc_col_ptr, csc_row_ind, &buffer_size);
  !>       hipMalloc(&temp_buffer, buffer_size);
  !> 
  !>        Sort the CSC matrix
  !>       rocsparse_cscsort(handle, m, n, nnz, descr, csc_col_ptr, csc_row_ind, perm, temp_buffer);
  !> 
  !>        Gather sorted csc_val array
  !>       float csc_val_sorted;
  !>       hipMalloc((void)&csc_val_sorted, sizeof(float)  nnz);
  !>       rocsparse_sgthr(handle, nnz, csc_val, csc_val_sorted, perm, rocsparse_index_base_zero);
  !> 
  !>        Clean up
  !>       hipFree(temp_buffer);
  !>       hipFree(perm);
  !>       hipFree(csc_val);
  !>   \endcode
  !> 
  interface rocsparse_cscsort
    function rocsparse_cscsort_orig(handle,m,n,nnz,descr,csc_col_ptr,csc_row_ind,perm,temp_buffer) bind(c, name="rocsparse_cscsort")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cscsort_rank_0,rocsparse_cscsort_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse COO matrix
  !> 
  !>   \details
  !>   \p coosort_buffer_size returns the size of the temporary storage buffer that is
  !>   required by rocsparse_coosort_by_row() and rocsparse_coosort_by_column(). The
  !>   temporary storage buffer has to be allocated by the user.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse COO matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse COO matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse COO matrix.
  !>   @param[in]
  !>   coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !>                   COO matrix.
  !>   @param[in]
  !>   coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !>                   COO matrix.
  !>   @param[out]
  !>   buffer_size     number of bytes of the temporary storage buffer required by
  !>                   rocsparse_coosort_by_row() and rocsparse_coosort_by_column().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !>               \p buffer_size pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  interface rocsparse_coosort_buffer_size
    function rocsparse_coosort_buffer_size_orig(handle,m,n,nnz,coo_row_ind,coo_col_ind,buffer_size) bind(c, name="rocsparse_coosort_buffer_size")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_buffer_size_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      integer(c_size_t) :: buffer_size
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_coosort_buffer_size_rank_0,rocsparse_coosort_buffer_size_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse COO matrix by row
  !> 
  !>   \details
  !>   \p rocsparse_coosort_by_row sorts a matrix in COO format by row. The sorted
  !>   permutation vector \p perm can be used to obtain sorted \p coo_val array. In this
  !>   case, \p perm must be initialized as the identity permutation, see
  !>   rocsparse_create_identity_permutation().
  !> 
  !>   \p rocsparse_coosort_by_row requires extra temporary storage buffer that has to be
  !>   allocated by the user. Storage buffer size can be determined by
  !>   rocsparse_coosort_buffer_size().
  !> 
  !>   \note
  !>   \p perm can be \p NULL if a sorted permutation vector is not required.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse COO matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse COO matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse COO matrix.
  !>   @param[inout]
  !>   coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !>                   COO matrix.
  !>   @param[inout]
  !>   coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !>                   COO matrix.
  !>   @param[inout]
  !>   perm            array of \p nnz integers containing the unsorted map indices, can be
  !>                   \p NULL.
  !>   @param[in]
  !>   temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !>                   rocsparse_coosort_buffer_size().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !>               \p temp_buffer pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  !>   \par Example
  !>   The following example sorts a \f$3 \times 3\f$ COO matrix by row indices.
  !>   \code{.c}
  !>            1 2 3
  !>        A = 4 5 6
  !>            7 8 9
  !>       rocsparse_int m   = 3;
  !>       rocsparse_int n   = 3;
  !>       rocsparse_int nnz = 9;
  !> 
  !>       coo_row_ind[nnz] = {0, 1, 2, 0, 1, 2, 0, 1, 2};  device memory
  !>       coo_col_ind[nnz] = {0, 0, 0, 1, 1, 1, 2, 2, 2};  device memory
  !>       coo_val[nnz]     = {1, 4, 7, 2, 5, 8, 3, 6, 9};  device memory
  !> 
  !>        Create permutation vector perm as the identity map
  !>       rocsparse_int perm;
  !>       hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !>       rocsparse_create_identity_permutation(handle, nnz, perm);
  !> 
  !>        Allocate temporary buffer
  !>       size_t buffer_size;
  !>       void temp_buffer;
  !>       rocsparse_coosort_buffer_size(handle,
  !>                                     m,
  !>                                     n,
  !>                                     nnz,
  !>                                     coo_row_ind,
  !>                                     coo_col_ind,
  !>                                     &buffer_size);
  !>       hipMalloc(&temp_buffer, buffer_size);
  !> 
  !>        Sort the COO matrix
  !>       rocsparse_coosort_by_row(handle,
  !>                                m,
  !>                                n,
  !>                                nnz,
  !>                                coo_row_ind,
  !>                                coo_col_ind,
  !>                                perm,
  !>                                temp_buffer);
  !> 
  !>        Gather sorted coo_val array
  !>       float coo_val_sorted;
  !>       hipMalloc((void)&coo_val_sorted, sizeof(float)  nnz);
  !>       rocsparse_sgthr(handle, nnz, coo_val, coo_val_sorted, perm, rocsparse_index_base_zero);
  !> 
  !>        Clean up
  !>       hipFree(temp_buffer);
  !>       hipFree(perm);
  !>       hipFree(coo_val);
  !>   \endcode
  !> 
  interface rocsparse_coosort_by_row
    function rocsparse_coosort_by_row_orig(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer) bind(c, name="rocsparse_coosort_by_row")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_row_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_coosort_by_row_rank_0,rocsparse_coosort_by_row_rank_1
#endif

  end interface
  !> ! \ingroup conv_module
  !>   \brief Sort a sparse COO matrix by column
  !> 
  !>   \details
  !>   \p rocsparse_coosort_by_column sorts a matrix in COO format by column. The sorted
  !>   permutation vector \p perm can be used to obtain sorted \p coo_val array. In this
  !>   case, \p perm must be initialized as the identity permutation, see
  !>   rocsparse_create_identity_permutation().
  !> 
  !>   \p rocsparse_coosort_by_column requires extra temporary storage buffer that has to be
  !>   allocated by the user. Storage buffer size can be determined by
  !>   rocsparse_coosort_buffer_size().
  !> 
  !>   \note
  !>   \p perm can be \p NULL if a sorted permutation vector is not required.
  !> 
  !>   \note
  !>   This function is non blocking and executed asynchronously with respect to the host.
  !>   It may return before the actual computation has finished.
  !> 
  !>   @param[in]
  !>   handle          handle to the rocsparse library context queue.
  !>   @param[in]
  !>   m               number of rows of the sparse COO matrix.
  !>   @param[in]
  !>   n               number of columns of the sparse COO matrix.
  !>   @param[in]
  !>   nnz             number of non-zero entries of the sparse COO matrix.
  !>   @param[inout]
  !>   coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !>                   COO matrix.
  !>   @param[inout]
  !>   coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !>                   COO matrix.
  !>   @param[inout]
  !>   perm            array of \p nnz integers containing the unsorted map indices, can be
  !>                   \p NULL.
  !>   @param[in]
  !>   temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !>                   rocsparse_coosort_buffer_size().
  !> 
  !>   \retval     rocsparse_status_success the operation completed successfully.
  !>   \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !>   \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !>   \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !>               \p temp_buffer pointer is invalid.
  !>   \retval     rocsparse_status_internal_error an internal error occurred.
  !> 
  !>   \par Example
  !>   The following example sorts a \f$3 \times 3\f$ COO matrix by column indices.
  !>   \code{.c}
  !>            1 2 3
  !>        A = 4 5 6
  !>            7 8 9
  !>       rocsparse_int m   = 3;
  !>       rocsparse_int n   = 3;
  !>       rocsparse_int nnz = 9;
  !> 
  !>       coo_row_ind[nnz] = {0, 0, 0, 1, 1, 1, 2, 2, 2};  device memory
  !>       coo_col_ind[nnz] = {0, 1, 2, 0, 1, 2, 0, 1, 2};  device memory
  !>       coo_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8, 9};  device memory
  !> 
  !>        Create permutation vector perm as the identity map
  !>       rocsparse_int perm;
  !>       hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !>       rocsparse_create_identity_permutation(handle, nnz, perm);
  !> 
  !>        Allocate temporary buffer
  !>       size_t buffer_size;
  !>       void temp_buffer;
  !>       rocsparse_coosort_buffer_size(handle,
  !>                                     m,
  !>                                     n,
  !>                                     nnz,
  !>                                     coo_row_ind,
  !>                                     coo_col_ind,
  !>                                     &buffer_size);
  !>       hipMalloc(&temp_buffer, buffer_size);
  !> 
  !>        Sort the COO matrix
  !>       rocsparse_coosort_by_column(handle,
  !>                                   m,
  !>                                   n,
  !>                                   nnz,
  !>                                   coo_row_ind,
  !>                                   coo_col_ind,
  !>                                   perm,
  !>                                   temp_buffer);
  !> 
  !>        Gather sorted coo_val array
  !>       float coo_val_sorted;
  !>       hipMalloc((void)&coo_val_sorted, sizeof(float)  nnz);
  !>       rocsparse_sgthr(handle, nnz, coo_val, coo_val_sorted, perm, rocsparse_index_base_zero);
  !> 
  !>        Clean up
  !>       hipFree(temp_buffer);
  !>       hipFree(perm);
  !>       hipFree(coo_val);
  !>   \endcode
  !> 
  interface rocsparse_coosort_by_column
    function rocsparse_coosort_by_column_orig(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer) bind(c, name="rocsparse_coosort_by_column")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_column_orig
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_coosort_by_column_rank_0,rocsparse_coosort_by_column_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sbsr2csr
    function rocsparse_sbsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sbsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sbsr2csr_rank_0,rocsparse_sbsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dbsr2csr
    function rocsparse_dbsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_dbsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dbsr2csr_rank_0,rocsparse_dbsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_cbsr2csr
    function rocsparse_cbsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cbsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cbsr2csr_rank_0,rocsparse_cbsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_zbsr2csr
    function rocsparse_zbsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zbsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zbsr2csr_rank_0,rocsparse_zbsr2csr_rank_1
#endif

  end interface
  !> @{
  interface rocsparse_sgebsr2csr
    function rocsparse_sgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sgebsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgebsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_sgebsr2csr_rank_0,rocsparse_sgebsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_dgebsr2csr
    function rocsparse_dgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_dgebsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgebsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_dgebsr2csr_rank_0,rocsparse_dgebsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_cgebsr2csr
    function rocsparse_cgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cgebsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgebsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_cgebsr2csr_rank_0,rocsparse_cgebsr2csr_rank_1
#endif

  end interface
  
  interface rocsparse_zgebsr2csr
    function rocsparse_zgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zgebsr2csr")
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgebsr2csr_orig
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure rocsparse_zgebsr2csr_rank_0,rocsparse_zgebsr2csr_rank_1
#endif

  end interface

#ifdef USE_FPOINTER_INTERFACES
  contains
    function rocsparse_saxpyi_rank_0(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_saxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      real(c_float),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_saxpyi_rank_0 = rocsparse_saxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_saxpyi_rank_1(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_saxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_float),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_saxpyi_rank_1 = rocsparse_saxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_daxpyi_rank_0(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_daxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      real(c_double),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_daxpyi_rank_0 = rocsparse_daxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_daxpyi_rank_1(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_daxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_double),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_daxpyi_rank_1 = rocsparse_daxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_caxpyi_rank_0(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_caxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_float_complex),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_caxpyi_rank_0 = rocsparse_caxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_caxpyi_rank_1(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_caxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_caxpyi_rank_1 = rocsparse_caxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_zaxpyi_rank_0(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zaxpyi_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_double_complex),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zaxpyi_rank_0 = rocsparse_zaxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_zaxpyi_rank_1(handle,nnz,alpha,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zaxpyi_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zaxpyi_rank_1 = rocsparse_zaxpyi_orig(handle,nnz,alpha,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_sdoti_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      real(c_float),target :: y
      real(c_float),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sdoti_rank_0 = rocsparse_sdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_sdoti_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sdoti_rank_1 = rocsparse_sdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_ddoti_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      real(c_double),target :: y
      real(c_double),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_ddoti_rank_0 = rocsparse_ddoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_ddoti_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_ddoti_rank_1 = rocsparse_ddoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_cdoti_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cdoti_rank_0 = rocsparse_cdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_cdoti_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cdoti_rank_1 = rocsparse_cdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_zdoti_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdoti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zdoti_rank_0 = rocsparse_zdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_zdoti_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdoti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zdoti_rank_1 = rocsparse_zdoti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_cdotci_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdotci_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cdotci_rank_0 = rocsparse_cdotci_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_cdotci_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdotci_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cdotci_rank_1 = rocsparse_cdotci_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_zdotci_rank_0(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdotci_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zdotci_rank_0 = rocsparse_zdotci_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_zdotci_rank_1(handle,nnz,x_val,x_ind,y,myResult,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdotci_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zdotci_rank_1 = rocsparse_zdotci_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c_loc(myResult),idx_base)
    end function

    function rocsparse_sgthr_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: y
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sgthr_rank_0 = rocsparse_sgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_sgthr_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sgthr_rank_1 = rocsparse_sgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_dgthr_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: y
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dgthr_rank_0 = rocsparse_dgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_dgthr_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dgthr_rank_1 = rocsparse_dgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_cgthr_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cgthr_rank_0 = rocsparse_cgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_cgthr_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cgthr_rank_1 = rocsparse_cgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_zgthr_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zgthr_rank_0 = rocsparse_zgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_zgthr_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zgthr_rank_1 = rocsparse_zgthr_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_sgthrz_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: y
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sgthrz_rank_0 = rocsparse_sgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_sgthrz_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: y
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sgthrz_rank_1 = rocsparse_sgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_dgthrz_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: y
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dgthrz_rank_0 = rocsparse_dgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_dgthrz_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: y
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dgthrz_rank_1 = rocsparse_dgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_cgthrz_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: y
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cgthrz_rank_0 = rocsparse_cgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_cgthrz_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: y
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_cgthrz_rank_1 = rocsparse_cgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_zgthrz_rank_0(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthrz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: y
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zgthrz_rank_0 = rocsparse_zgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_zgthrz_rank_1(handle,nnz,y,x_val,x_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthrz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: y
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zgthrz_rank_1 = rocsparse_zgthrz_orig(handle,nnz,c_loc(y),c_loc(x_val),c_loc(x_ind),idx_base)
    end function

    function rocsparse_sroti_rank_0(handle,nnz,x_val,x_ind,y,c,s,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sroti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      real(c_float),target :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sroti_rank_0 = rocsparse_sroti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c,s,idx_base)
    end function

    function rocsparse_sroti_rank_1(handle,nnz,x_val,x_ind,y,c,s,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sroti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_float),target,dimension(:) :: y
      real(c_float) :: c
      real(c_float) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_sroti_rank_1 = rocsparse_sroti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c,s,idx_base)
    end function

    function rocsparse_droti_rank_0(handle,nnz,x_val,x_ind,y,c,s,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_droti_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      real(c_double),target :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_droti_rank_0 = rocsparse_droti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c,s,idx_base)
    end function

    function rocsparse_droti_rank_1(handle,nnz,x_val,x_ind,y,c,s,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_droti_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_double),target,dimension(:) :: y
      real(c_double) :: c
      real(c_double) :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_droti_rank_1 = rocsparse_droti_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),c,s,idx_base)
    end function

    function rocsparse_ssctr_rank_0(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ssctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target :: x_val
      integer(c_int),target :: x_ind
      real(c_float),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_ssctr_rank_0 = rocsparse_ssctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_ssctr_rank_1(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ssctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_float),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_ssctr_rank_1 = rocsparse_ssctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_dsctr_rank_0(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target :: x_val
      integer(c_int),target :: x_ind
      real(c_double),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dsctr_rank_0 = rocsparse_dsctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_dsctr_rank_1(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      real(c_double),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_dsctr_rank_1 = rocsparse_dsctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_csctr_rank_0(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_float_complex),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_csctr_rank_0 = rocsparse_csctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_csctr_rank_1(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_csctr_rank_1 = rocsparse_csctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_zsctr_rank_0(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zsctr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: x_val
      integer(c_int),target :: x_ind
      complex(c_double_complex),target :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zsctr_rank_0 = rocsparse_zsctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_zsctr_rank_1(handle,nnz,x_val,x_ind,y,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zsctr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: x_val
      integer(c_int),target,dimension(:) :: x_ind
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_zsctr_rank_1 = rocsparse_zsctr_orig(handle,nnz,c_loc(x_val),c_loc(x_ind),c_loc(y),idx_base)
    end function

    function rocsparse_sbsrmv_rank_0(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      rocsparse_sbsrmv_rank_0 = rocsparse_sbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_sbsrmv_rank_1(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      rocsparse_sbsrmv_rank_1 = rocsparse_sbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dbsrmv_rank_0(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      rocsparse_dbsrmv_rank_0 = rocsparse_dbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dbsrmv_rank_1(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      rocsparse_dbsrmv_rank_1 = rocsparse_dbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_cbsrmv_rank_0(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      rocsparse_cbsrmv_rank_0 = rocsparse_cbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_cbsrmv_rank_1(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      rocsparse_cbsrmv_rank_1 = rocsparse_cbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zbsrmv_rank_0(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      rocsparse_zbsrmv_rank_0 = rocsparse_zbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zbsrmv_rank_1(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      rocsparse_zbsrmv_rank_1 = rocsparse_zbsrmv_orig(handle,dir,trans,mb,nb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_sbsrsv_buffer_size_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsrsv_buffer_size_rank_0 = rocsparse_sbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsrsv_buffer_size_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsrsv_buffer_size_rank_1 = rocsparse_sbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsrsv_buffer_size_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsrsv_buffer_size_rank_0 = rocsparse_dbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsrsv_buffer_size_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsrsv_buffer_size_rank_1 = rocsparse_dbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsrsv_buffer_size_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsrsv_buffer_size_rank_0 = rocsparse_cbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsrsv_buffer_size_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsrsv_buffer_size_rank_1 = rocsparse_cbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsrsv_buffer_size_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsrsv_buffer_size_rank_0 = rocsparse_zbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsrsv_buffer_size_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsrsv_buffer_size_rank_1 = rocsparse_zbsrsv_buffer_size_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsrsv_analysis_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrsv_analysis_rank_0 = rocsparse_sbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsrsv_analysis_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrsv_analysis_rank_1 = rocsparse_sbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsrsv_analysis_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrsv_analysis_rank_0 = rocsparse_dbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsrsv_analysis_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrsv_analysis_rank_1 = rocsparse_dbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsrsv_analysis_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrsv_analysis_rank_0 = rocsparse_cbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsrsv_analysis_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrsv_analysis_rank_1 = rocsparse_cbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsrsv_analysis_rank_0(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrsv_analysis_rank_0 = rocsparse_zbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsrsv_analysis_rank_1(handle,dir,trans,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrsv_analysis_rank_1 = rocsparse_zbsrsv_analysis_orig(handle,dir,trans,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsrsv_solve_rank_0(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      real(c_float),target :: x
      real(c_float),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrsv_solve_rank_0 = rocsparse_sbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_sbsrsv_solve_rank_1(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      real(c_float),target,dimension(:) :: x
      real(c_float),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrsv_solve_rank_1 = rocsparse_sbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_dbsrsv_solve_rank_0(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      real(c_double),target :: x
      real(c_double),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrsv_solve_rank_0 = rocsparse_dbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_dbsrsv_solve_rank_1(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      real(c_double),target,dimension(:) :: x
      real(c_double),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrsv_solve_rank_1 = rocsparse_dbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_cbsrsv_solve_rank_0(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target :: x
      complex(c_float_complex),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrsv_solve_rank_0 = rocsparse_cbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_cbsrsv_solve_rank_1(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrsv_solve_rank_1 = rocsparse_cbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_zbsrsv_solve_rank_0(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target :: x
      complex(c_double_complex),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrsv_solve_rank_0 = rocsparse_zbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_zbsrsv_solve_rank_1(handle,dir,trans,mb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrsv_solve_rank_1 = rocsparse_zbsrsv_solve_orig(handle,dir,trans,mb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),bsr_dim,myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_scoomv_rank_0(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scoomv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: coo_val
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      rocsparse_scoomv_rank_0 = rocsparse_scoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_scoomv_rank_1(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scoomv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: coo_val
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      rocsparse_scoomv_rank_1 = rocsparse_scoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dcoomv_rank_0(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcoomv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: coo_val
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      rocsparse_dcoomv_rank_0 = rocsparse_dcoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dcoomv_rank_1(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcoomv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: coo_val
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      rocsparse_dcoomv_rank_1 = rocsparse_dcoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_ccoomv_rank_0(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccoomv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: coo_val
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      rocsparse_ccoomv_rank_0 = rocsparse_ccoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_ccoomv_rank_1(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccoomv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: coo_val
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      rocsparse_ccoomv_rank_1 = rocsparse_ccoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zcoomv_rank_0(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcoomv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: coo_val
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      rocsparse_zcoomv_rank_0 = rocsparse_zcoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zcoomv_rank_1(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcoomv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: coo_val
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      rocsparse_zcoomv_rank_1 = rocsparse_zcoomv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(coo_val),c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_scsrmv_analysis_rank_0(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_scsrmv_analysis_rank_0 = rocsparse_scsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_scsrmv_analysis_rank_1(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_scsrmv_analysis_rank_1 = rocsparse_scsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_dcsrmv_analysis_rank_0(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_dcsrmv_analysis_rank_0 = rocsparse_dcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_dcsrmv_analysis_rank_1(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_dcsrmv_analysis_rank_1 = rocsparse_dcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_ccsrmv_analysis_rank_0(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_ccsrmv_analysis_rank_0 = rocsparse_ccsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_ccsrmv_analysis_rank_1(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_ccsrmv_analysis_rank_1 = rocsparse_ccsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_zcsrmv_analysis_rank_0(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_zcsrmv_analysis_rank_0 = rocsparse_zcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_zcsrmv_analysis_rank_1(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      !
      rocsparse_zcsrmv_analysis_rank_1 = rocsparse_zcsrmv_analysis_orig(handle,trans,m,n,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo)
    end function

    function rocsparse_scsrmv_rank_0(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      rocsparse_scsrmv_rank_0 = rocsparse_scsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_scsrmv_rank_1(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      rocsparse_scsrmv_rank_1 = rocsparse_scsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dcsrmv_rank_0(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      rocsparse_dcsrmv_rank_0 = rocsparse_dcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dcsrmv_rank_1(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      rocsparse_dcsrmv_rank_1 = rocsparse_dcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_ccsrmv_rank_0(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      rocsparse_ccsrmv_rank_0 = rocsparse_ccsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_ccsrmv_rank_1(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      rocsparse_ccsrmv_rank_1 = rocsparse_ccsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zcsrmv_rank_0(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      rocsparse_zcsrmv_rank_0 = rocsparse_zcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zcsrmv_rank_1(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      rocsparse_zcsrmv_rank_1 = rocsparse_zcsrmv_orig(handle,trans,m,n,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_scsrsv_buffer_size_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrsv_buffer_size_rank_0 = rocsparse_scsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsrsv_buffer_size_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrsv_buffer_size_rank_1 = rocsparse_scsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsrsv_buffer_size_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrsv_buffer_size_rank_0 = rocsparse_dcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsrsv_buffer_size_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrsv_buffer_size_rank_1 = rocsparse_dcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsrsv_buffer_size_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrsv_buffer_size_rank_0 = rocsparse_ccsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsrsv_buffer_size_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrsv_buffer_size_rank_1 = rocsparse_ccsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsrsv_buffer_size_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrsv_buffer_size_rank_0 = rocsparse_zcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsrsv_buffer_size_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrsv_buffer_size_rank_1 = rocsparse_zcsrsv_buffer_size_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsrsv_analysis_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsv_analysis_rank_0 = rocsparse_scsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrsv_analysis_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsv_analysis_rank_1 = rocsparse_scsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrsv_analysis_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsv_analysis_rank_0 = rocsparse_dcsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrsv_analysis_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsv_analysis_rank_1 = rocsparse_dcsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrsv_analysis_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsv_analysis_rank_0 = rocsparse_ccsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrsv_analysis_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsv_analysis_rank_1 = rocsparse_ccsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrsv_analysis_rank_0(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsv_analysis_rank_0 = rocsparse_zcsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrsv_analysis_rank_1(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsv_analysis_rank_1 = rocsparse_zcsrsv_analysis_orig(handle,trans,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrsv_solve_rank_0(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_float),target :: x
      real(c_float),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsv_solve_rank_0 = rocsparse_scsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_scsrsv_solve_rank_1(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_float),target,dimension(:) :: x
      real(c_float),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsv_solve_rank_1 = rocsparse_scsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_dcsrsv_solve_rank_0(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_double),target :: x
      real(c_double),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsv_solve_rank_0 = rocsparse_dcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_dcsrsv_solve_rank_1(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      real(c_double),target,dimension(:) :: x
      real(c_double),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsv_solve_rank_1 = rocsparse_dcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_ccsrsv_solve_rank_0(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target :: x
      complex(c_float_complex),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsv_solve_rank_0 = rocsparse_ccsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_ccsrsv_solve_rank_1(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsv_solve_rank_1 = rocsparse_ccsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_zcsrsv_solve_rank_0(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target :: x
      complex(c_double_complex),target :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsv_solve_rank_0 = rocsparse_zcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_zcsrsv_solve_rank_1(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,x,y,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex),target,dimension(:) :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsv_solve_rank_1 = rocsparse_zcsrsv_solve_orig(handle,trans,m,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,c_loc(x),c_loc(y),policy,temp_buffer)
    end function

    function rocsparse_sellmv_rank_0(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sellmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: ell_val
      integer(c_int),target :: ell_col_ind
      integer(c_int),value :: ell_width
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      rocsparse_sellmv_rank_0 = rocsparse_sellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_sellmv_rank_1(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sellmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      integer(c_int),value :: ell_width
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      rocsparse_sellmv_rank_1 = rocsparse_sellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dellmv_rank_0(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dellmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: ell_val
      integer(c_int),target :: ell_col_ind
      integer(c_int),value :: ell_width
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      rocsparse_dellmv_rank_0 = rocsparse_dellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dellmv_rank_1(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dellmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      integer(c_int),value :: ell_width
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      rocsparse_dellmv_rank_1 = rocsparse_dellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_cellmv_rank_0(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cellmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      integer(c_int),value :: ell_width
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      rocsparse_cellmv_rank_0 = rocsparse_cellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_cellmv_rank_1(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cellmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      integer(c_int),value :: ell_width
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      rocsparse_cellmv_rank_1 = rocsparse_cellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zellmv_rank_0(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zellmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      integer(c_int),value :: ell_width
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      rocsparse_zellmv_rank_0 = rocsparse_zellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zellmv_rank_1(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zellmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      integer(c_int),value :: ell_width
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      rocsparse_zellmv_rank_1 = rocsparse_zellmv_orig(handle,trans,m,n,alpha,descr,c_loc(ell_val),c_loc(ell_col_ind),ell_width,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_shybmv_rank_0(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_float),target :: x
      real(c_float) :: beta
      real(c_float),target :: y
      !
      rocsparse_shybmv_rank_0 = rocsparse_shybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_shybmv_rank_1(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_float),target,dimension(:) :: x
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: y
      !
      rocsparse_shybmv_rank_1 = rocsparse_shybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dhybmv_rank_0(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_double),target :: x
      real(c_double) :: beta
      real(c_double),target :: y
      !
      rocsparse_dhybmv_rank_0 = rocsparse_dhybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_dhybmv_rank_1(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_double),target,dimension(:) :: x
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: y
      !
      rocsparse_dhybmv_rank_1 = rocsparse_dhybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_chybmv_rank_0(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_float_complex),target :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: y
      !
      rocsparse_chybmv_rank_0 = rocsparse_chybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_chybmv_rank_1(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_float_complex),target,dimension(:) :: x
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: y
      !
      rocsparse_chybmv_rank_1 = rocsparse_chybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zhybmv_rank_0(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhybmv_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_double_complex),target :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: y
      !
      rocsparse_zhybmv_rank_0 = rocsparse_zhybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_zhybmv_rank_1(handle,trans,alpha,descr,hyb,x,beta,y)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhybmv_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_double_complex),target,dimension(:) :: x
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: y
      !
      rocsparse_zhybmv_rank_1 = rocsparse_zhybmv_orig(handle,trans,alpha,descr,hyb,c_loc(x),beta,c_loc(y))
    end function

    function rocsparse_sbsrmm_full_rank(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sbsrmm_full_rank = rocsparse_sbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_sbsrmm_rank_0(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_float),target :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sbsrmm_rank_0 = rocsparse_sbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_sbsrmm_rank_1(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sbsrmm_rank_1 = rocsparse_sbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dbsrmm_full_rank(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dbsrmm_full_rank = rocsparse_dbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dbsrmm_rank_0(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_double),target :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dbsrmm_rank_0 = rocsparse_dbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dbsrmm_rank_1(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dbsrmm_rank_1 = rocsparse_dbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_cbsrmm_full_rank(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cbsrmm_full_rank = rocsparse_cbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_cbsrmm_rank_0(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cbsrmm_rank_0 = rocsparse_cbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_cbsrmm_rank_1(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cbsrmm_rank_1 = rocsparse_cbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zbsrmm_full_rank(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zbsrmm_full_rank = rocsparse_zbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zbsrmm_rank_0(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zbsrmm_rank_0 = rocsparse_zbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zbsrmm_rank_1(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zbsrmm_rank_1 = rocsparse_zbsrmm_orig(handle,dir,trans_A,trans_B,mb,n,kb,nnzb,alpha,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_scsrmm_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_scsrmm_full_rank = rocsparse_scsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_scsrmm_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_scsrmm_rank_0 = rocsparse_scsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_scsrmm_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_scsrmm_rank_1 = rocsparse_scsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dcsrmm_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dcsrmm_full_rank = rocsparse_dcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dcsrmm_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dcsrmm_rank_0 = rocsparse_dcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_dcsrmm_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dcsrmm_rank_1 = rocsparse_dcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_ccsrmm_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_ccsrmm_full_rank = rocsparse_ccsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_ccsrmm_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_ccsrmm_rank_0 = rocsparse_ccsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_ccsrmm_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_ccsrmm_rank_1 = rocsparse_ccsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zcsrmm_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmm_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zcsrmm_full_rank = rocsparse_zcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zcsrmm_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zcsrmm_rank_0 = rocsparse_zcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_zcsrmm_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zcsrmm_rank_1 = rocsparse_zcsrmm_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,beta,c_loc(C),ldc)
    end function

    function rocsparse_scsrsm_buffer_size_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrsm_buffer_size_full_rank = rocsparse_scsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_scsrsm_buffer_size_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrsm_buffer_size_rank_0 = rocsparse_scsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_scsrsm_buffer_size_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrsm_buffer_size_rank_1 = rocsparse_scsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_dcsrsm_buffer_size_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrsm_buffer_size_full_rank = rocsparse_dcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_dcsrsm_buffer_size_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrsm_buffer_size_rank_0 = rocsparse_dcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_dcsrsm_buffer_size_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrsm_buffer_size_rank_1 = rocsparse_dcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_ccsrsm_buffer_size_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrsm_buffer_size_full_rank = rocsparse_ccsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_ccsrsm_buffer_size_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrsm_buffer_size_rank_0 = rocsparse_ccsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_ccsrsm_buffer_size_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrsm_buffer_size_rank_1 = rocsparse_ccsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_zcsrsm_buffer_size_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrsm_buffer_size_full_rank = rocsparse_zcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_zcsrsm_buffer_size_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrsm_buffer_size_rank_0 = rocsparse_zcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_zcsrsm_buffer_size_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrsm_buffer_size_rank_1 = rocsparse_zcsrsm_buffer_size_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,buffer_size)
    end function

    function rocsparse_scsrsm_analysis_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_analysis_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_analysis_full_rank = rocsparse_scsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrsm_analysis_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_analysis_rank_0 = rocsparse_scsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrsm_analysis_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_analysis_rank_1 = rocsparse_scsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrsm_analysis_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_analysis_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_analysis_full_rank = rocsparse_dcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrsm_analysis_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_analysis_rank_0 = rocsparse_dcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrsm_analysis_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_analysis_rank_1 = rocsparse_dcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrsm_analysis_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_analysis_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_analysis_full_rank = rocsparse_ccsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrsm_analysis_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_analysis_rank_0 = rocsparse_ccsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrsm_analysis_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_analysis_rank_1 = rocsparse_ccsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrsm_analysis_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_analysis_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_analysis_full_rank = rocsparse_zcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrsm_analysis_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_analysis_rank_0 = rocsparse_zcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrsm_analysis_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_analysis_rank_1 = rocsparse_zcsrsm_analysis_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrsm_solve_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_solve_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_solve_full_rank = rocsparse_scsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsrsm_solve_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_solve_rank_0 = rocsparse_scsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsrsm_solve_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrsm_solve_rank_1 = rocsparse_scsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsrsm_solve_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_solve_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_solve_full_rank = rocsparse_dcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsrsm_solve_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_solve_rank_0 = rocsparse_dcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsrsm_solve_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrsm_solve_rank_1 = rocsparse_dcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsrsm_solve_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_solve_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_solve_full_rank = rocsparse_ccsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsrsm_solve_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_solve_rank_0 = rocsparse_ccsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsrsm_solve_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrsm_solve_rank_1 = rocsparse_ccsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsrsm_solve_full_rank(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_solve_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_solve_full_rank = rocsparse_zcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsrsm_solve_rank_0(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_solve_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_solve_rank_0 = rocsparse_zcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsrsm_solve_rank_1(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_solve_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrsm_solve_rank_1 = rocsparse_zcsrsm_solve_orig(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(B),ldb,myInfo,policy,temp_buffer)
    end function

    function rocsparse_sgemmi_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgemmi_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float) :: beta
      real(c_float),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sgemmi_full_rank = rocsparse_sgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_sgemmi_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgemmi_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float) :: beta
      real(c_float),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sgemmi_rank_0 = rocsparse_sgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_sgemmi_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgemmi_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float) :: beta
      real(c_float),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_sgemmi_rank_1 = rocsparse_sgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_dgemmi_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgemmi_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double) :: beta
      real(c_double),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dgemmi_full_rank = rocsparse_dgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_dgemmi_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgemmi_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double) :: beta
      real(c_double),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dgemmi_rank_0 = rocsparse_dgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_dgemmi_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgemmi_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double) :: beta
      real(c_double),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_dgemmi_rank_1 = rocsparse_dgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_cgemmi_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgemmi_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cgemmi_full_rank = rocsparse_cgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_cgemmi_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgemmi_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex) :: beta
      complex(c_float_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cgemmi_rank_0 = rocsparse_cgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_cgemmi_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgemmi_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex) :: beta
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_cgemmi_rank_1 = rocsparse_cgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_zgemmi_full_rank(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgemmi_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zgemmi_full_rank = rocsparse_zgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_zgemmi_rank_0(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgemmi_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex) :: beta
      complex(c_double_complex),target :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zgemmi_rank_0 = rocsparse_zgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_zgemmi_rank_1(handle,trans_A,trans_B,m,n,k,nnz,alpha,A,lda,descr,csr_val,csr_row_ptr,csr_col_ind,beta,C,ldc)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgemmi_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex) :: beta
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int),value :: ldc
      !
      rocsparse_zgemmi_rank_1 = rocsparse_zgemmi_orig(handle,trans_A,trans_B,m,n,k,nnz,alpha,c_loc(A),lda,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),beta,c_loc(C),ldc)
    end function

    function rocsparse_csrgeam_nnz_rank_0(handle,m,n,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_row_ptr_C,nnz_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgeam_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: nnz_C
      !
      rocsparse_csrgeam_nnz_rank_0 = rocsparse_csrgeam_nnz_orig(handle,m,n,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_row_ptr_C),c_loc(nnz_C))
    end function

    function rocsparse_csrgeam_nnz_rank_1(handle,m,n,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_row_ptr_C,nnz_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgeam_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: nnz_C
      !
      rocsparse_csrgeam_nnz_rank_1 = rocsparse_csrgeam_nnz_orig(handle,m,n,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_row_ptr_C),c_loc(nnz_C))
    end function

    function rocsparse_scsrgeam_rank_0(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_float),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      !
      rocsparse_scsrgeam_rank_0 = rocsparse_scsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_scsrgeam_rank_1(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_float),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      !
      rocsparse_scsrgeam_rank_1 = rocsparse_scsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_dcsrgeam_rank_0(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_double),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      !
      rocsparse_dcsrgeam_rank_0 = rocsparse_dcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_dcsrgeam_rank_1(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_double),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      !
      rocsparse_dcsrgeam_rank_1 = rocsparse_dcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_ccsrgeam_rank_0(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_float_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_float_complex),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      complex(c_float_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      !
      rocsparse_ccsrgeam_rank_0 = rocsparse_ccsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_ccsrgeam_rank_1(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_float_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_float_complex),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      complex(c_float_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      !
      rocsparse_ccsrgeam_rank_1 = rocsparse_ccsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_zcsrgeam_rank_0(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgeam_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_double_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_double_complex),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      complex(c_double_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      !
      rocsparse_zcsrgeam_rank_0 = rocsparse_zcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_zcsrgeam_rank_1(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgeam_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_double_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_double_complex),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_C
      complex(c_double_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      !
      rocsparse_zcsrgeam_rank_1 = rocsparse_zcsrgeam_orig(handle,m,n,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),beta,descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C))
    end function

    function rocsparse_scsrgemm_buffer_size_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrgemm_buffer_size_rank_0 = rocsparse_scsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_scsrgemm_buffer_size_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrgemm_buffer_size_rank_1 = rocsparse_scsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_dcsrgemm_buffer_size_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrgemm_buffer_size_rank_0 = rocsparse_dcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_dcsrgemm_buffer_size_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrgemm_buffer_size_rank_1 = rocsparse_dcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_ccsrgemm_buffer_size_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrgemm_buffer_size_rank_0 = rocsparse_ccsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_ccsrgemm_buffer_size_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrgemm_buffer_size_rank_1 = rocsparse_ccsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_zcsrgemm_buffer_size_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrgemm_buffer_size_rank_0 = rocsparse_zcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_zcsrgemm_buffer_size_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: info_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrgemm_buffer_size_rank_1 = rocsparse_zcsrgemm_buffer_size_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),info_C,buffer_size)
    end function

    function rocsparse_csrgemm_nnz_rank_0(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_row_ptr_C,nnz_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgemm_nnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: nnz_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_csrgemm_nnz_rank_0 = rocsparse_csrgemm_nnz_orig(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_row_ptr_C),c_loc(nnz_C),info_C,temp_buffer)
    end function

    function rocsparse_csrgemm_nnz_rank_1(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_row_ptr_C,nnz_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgemm_nnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: nnz_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_csrgemm_nnz_rank_1 = rocsparse_csrgemm_nnz_orig(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),descr_D,nnz_D,c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_row_ptr_C),c_loc(nnz_C),info_C,temp_buffer)
    end function

    function rocsparse_scsrgemm_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_float),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      real(c_float),target :: csr_val_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrgemm_rank_0 = rocsparse_scsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_scsrgemm_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_float),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      real(c_float) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      real(c_float),target,dimension(:) :: csr_val_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrgemm_rank_1 = rocsparse_scsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_dcsrgemm_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_double),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      real(c_double),target :: csr_val_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrgemm_rank_0 = rocsparse_dcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_dcsrgemm_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      real(c_double),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      real(c_double) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      real(c_double),target,dimension(:) :: csr_val_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrgemm_rank_1 = rocsparse_dcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_ccsrgemm_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_float_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_float_complex),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      complex(c_float_complex),target :: csr_val_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      complex(c_float_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrgemm_rank_0 = rocsparse_ccsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_ccsrgemm_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_float_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_float_complex),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      complex(c_float_complex),target,dimension(:) :: csr_val_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      complex(c_float_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrgemm_rank_1 = rocsparse_ccsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_zcsrgemm_rank_0(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_double_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_double_complex),target :: csr_val_B
      integer(c_int),target :: csr_row_ptr_B
      integer(c_int),target :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      complex(c_double_complex),target :: csr_val_D
      integer(c_int),target :: csr_row_ptr_D
      integer(c_int),target :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      complex(c_double_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrgemm_rank_0 = rocsparse_zcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_zcsrgemm_rank_1(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descr_A
      integer(c_int),value :: nnz_A
      complex(c_double_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      type(c_ptr),value :: descr_B
      integer(c_int),value :: nnz_B
      complex(c_double_complex),target,dimension(:) :: csr_val_B
      integer(c_int),target,dimension(:) :: csr_row_ptr_B
      integer(c_int),target,dimension(:) :: csr_col_ind_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descr_D
      integer(c_int),value :: nnz_D
      complex(c_double_complex),target,dimension(:) :: csr_val_D
      integer(c_int),target,dimension(:) :: csr_row_ptr_D
      integer(c_int),target,dimension(:) :: csr_col_ind_D
      type(c_ptr),value :: descr_C
      complex(c_double_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: info_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrgemm_rank_1 = rocsparse_zcsrgemm_orig(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),descr_B,nnz_B,c_loc(csr_val_B),c_loc(csr_row_ptr_B),c_loc(csr_col_ind_B),beta,descr_D,nnz_D,c_loc(csr_val_D),c_loc(csr_row_ptr_D),c_loc(csr_col_ind_D),descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),info_C,temp_buffer)
    end function

    function rocsparse_sbsric0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsric0_buffer_size_rank_0 = rocsparse_sbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsric0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsric0_buffer_size_rank_1 = rocsparse_sbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsric0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsric0_buffer_size_rank_0 = rocsparse_dbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsric0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsric0_buffer_size_rank_1 = rocsparse_dbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsric0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsric0_buffer_size_rank_0 = rocsparse_cbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsric0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsric0_buffer_size_rank_1 = rocsparse_cbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsric0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsric0_buffer_size_rank_0 = rocsparse_zbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsric0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsric0_buffer_size_rank_1 = rocsparse_zbsric0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsric0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsric0_analysis_rank_0 = rocsparse_sbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsric0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsric0_analysis_rank_1 = rocsparse_sbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsric0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsric0_analysis_rank_0 = rocsparse_dbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsric0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsric0_analysis_rank_1 = rocsparse_dbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsric0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsric0_analysis_rank_0 = rocsparse_cbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsric0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsric0_analysis_rank_1 = rocsparse_cbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsric0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsric0_analysis_rank_0 = rocsparse_zbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsric0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsric0_analysis_rank_1 = rocsparse_zbsric0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsric0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsric0_rank_0 = rocsparse_sbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_sbsric0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsric0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsric0_rank_1 = rocsparse_sbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dbsric0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsric0_rank_0 = rocsparse_dbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dbsric0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsric0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsric0_rank_1 = rocsparse_dbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_cbsric0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsric0_rank_0 = rocsparse_cbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_cbsric0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsric0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsric0_rank_1 = rocsparse_cbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zbsric0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsric0_rank_0 = rocsparse_zbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zbsric0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsric0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsric0_rank_1 = rocsparse_zbsric0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_sbsrilu0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsrilu0_buffer_size_rank_0 = rocsparse_sbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsrilu0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sbsrilu0_buffer_size_rank_1 = rocsparse_sbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsrilu0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsrilu0_buffer_size_rank_0 = rocsparse_dbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_dbsrilu0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dbsrilu0_buffer_size_rank_1 = rocsparse_dbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsrilu0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsrilu0_buffer_size_rank_0 = rocsparse_cbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_cbsrilu0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cbsrilu0_buffer_size_rank_1 = rocsparse_cbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsrilu0_buffer_size_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsrilu0_buffer_size_rank_0 = rocsparse_zbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_zbsrilu0_buffer_size_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zbsrilu0_buffer_size_rank_1 = rocsparse_zbsrilu0_buffer_size_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,buffer_size)
    end function

    function rocsparse_sbsrilu0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrilu0_analysis_rank_0 = rocsparse_sbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsrilu0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrilu0_analysis_rank_1 = rocsparse_sbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsrilu0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrilu0_analysis_rank_0 = rocsparse_dbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dbsrilu0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrilu0_analysis_rank_1 = rocsparse_dbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsrilu0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrilu0_analysis_rank_0 = rocsparse_cbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_cbsrilu0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrilu0_analysis_rank_1 = rocsparse_cbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsrilu0_analysis_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrilu0_analysis_rank_0 = rocsparse_zbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zbsrilu0_analysis_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrilu0_analysis_rank_1 = rocsparse_zbsrilu0_analysis_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_sbsrilu0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrilu0_rank_0 = rocsparse_sbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_sbsrilu0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sbsrilu0_rank_1 = rocsparse_sbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dbsrilu0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrilu0_rank_0 = rocsparse_dbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_dbsrilu0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dbsrilu0_rank_1 = rocsparse_dbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_cbsrilu0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrilu0_rank_0 = rocsparse_cbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_cbsrilu0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cbsrilu0_rank_1 = rocsparse_cbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zbsrilu0_rank_0(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrilu0_rank_0 = rocsparse_zbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_zbsrilu0_rank_1(handle,dir,mb,nnzb,descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zbsrilu0_rank_1 = rocsparse_zbsrilu0_orig(handle,dir,mb,nnzb,descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsric0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsric0_buffer_size_rank_0 = rocsparse_scsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsric0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsric0_buffer_size_rank_1 = rocsparse_scsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsric0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsric0_buffer_size_rank_0 = rocsparse_dcsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsric0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsric0_buffer_size_rank_1 = rocsparse_dcsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsric0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsric0_buffer_size_rank_0 = rocsparse_ccsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsric0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsric0_buffer_size_rank_1 = rocsparse_ccsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsric0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsric0_buffer_size_rank_0 = rocsparse_zcsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsric0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsric0_buffer_size_rank_1 = rocsparse_zcsric0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsric0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsric0_analysis_rank_0 = rocsparse_scsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsric0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsric0_analysis_rank_1 = rocsparse_scsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsric0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsric0_analysis_rank_0 = rocsparse_dcsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsric0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsric0_analysis_rank_1 = rocsparse_dcsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsric0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsric0_analysis_rank_0 = rocsparse_ccsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsric0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsric0_analysis_rank_1 = rocsparse_ccsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsric0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsric0_analysis_rank_0 = rocsparse_zcsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsric0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsric0_analysis_rank_1 = rocsparse_zcsric0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsric0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsric0_rank_0 = rocsparse_scsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsric0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsric0_rank_1 = rocsparse_scsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsric0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsric0_rank_0 = rocsparse_dcsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsric0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsric0_rank_1 = rocsparse_dcsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsric0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsric0_rank_0 = rocsparse_ccsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsric0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsric0_rank_1 = rocsparse_ccsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsric0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsric0_rank_0 = rocsparse_zcsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsric0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsric0_rank_1 = rocsparse_zcsric0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsrilu0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrilu0_buffer_size_rank_0 = rocsparse_scsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsrilu0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_scsrilu0_buffer_size_rank_1 = rocsparse_scsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsrilu0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrilu0_buffer_size_rank_0 = rocsparse_dcsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dcsrilu0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dcsrilu0_buffer_size_rank_1 = rocsparse_dcsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsrilu0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrilu0_buffer_size_rank_0 = rocsparse_ccsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_ccsrilu0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_ccsrilu0_buffer_size_rank_1 = rocsparse_ccsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsrilu0_buffer_size_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrilu0_buffer_size_rank_0 = rocsparse_zcsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_zcsrilu0_buffer_size_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_zcsrilu0_buffer_size_rank_1 = rocsparse_zcsrilu0_buffer_size_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_scsrilu0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrilu0_analysis_rank_0 = rocsparse_scsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrilu0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrilu0_analysis_rank_1 = rocsparse_scsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrilu0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrilu0_analysis_rank_0 = rocsparse_dcsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_dcsrilu0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrilu0_analysis_rank_1 = rocsparse_dcsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrilu0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrilu0_analysis_rank_0 = rocsparse_ccsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_ccsrilu0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrilu0_analysis_rank_1 = rocsparse_ccsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrilu0_analysis_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_analysis_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrilu0_analysis_rank_0 = rocsparse_zcsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_zcsrilu0_analysis_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,analysis,solve,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_analysis_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrilu0_analysis_rank_1 = rocsparse_zcsrilu0_analysis_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,analysis,solve,temp_buffer)
    end function

    function rocsparse_scsrilu0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrilu0_rank_0 = rocsparse_scsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_scsrilu0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsrilu0_rank_1 = rocsparse_scsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsrilu0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrilu0_rank_0 = rocsparse_dcsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_dcsrilu0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsrilu0_rank_1 = rocsparse_dcsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsrilu0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrilu0_rank_0 = rocsparse_ccsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_ccsrilu0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsrilu0_rank_1 = rocsparse_ccsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsrilu0_rank_0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrilu0_rank_0 = rocsparse_zcsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_zcsrilu0_rank_1(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,policy,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsrilu0_rank_1 = rocsparse_zcsrilu0_orig(handle,m,nnz,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,policy,temp_buffer)
    end function

    function rocsparse_snnz_full_rank(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_snnz_full_rank = rocsparse_snnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_snnz_rank_0(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_snnz_rank_0 = rocsparse_snnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_snnz_rank_1(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_snnz_rank_1 = rocsparse_snnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_dnnz_full_rank(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_dnnz_full_rank = rocsparse_dnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_dnnz_rank_0(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_dnnz_rank_0 = rocsparse_dnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_dnnz_rank_1(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_dnnz_rank_1 = rocsparse_dnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_cnnz_full_rank(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_cnnz_full_rank = rocsparse_cnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_cnnz_rank_0(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_cnnz_rank_0 = rocsparse_cnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_cnnz_rank_1(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_cnnz_rank_1 = rocsparse_cnnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_znnz_full_rank(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_full_rank
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_znnz_full_rank = rocsparse_znnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_znnz_rank_0(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_znnz_rank_0 = rocsparse_znnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_znnz_rank_1(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_row_columns
      integer(c_int) :: nnz_total_dev_host_ptr
      !
      rocsparse_znnz_rank_1 = rocsparse_znnz_orig(handle,dir,m,n,descr,c_loc(A),ld,c_loc(nnz_per_row_columns),nnz_total_dev_host_ptr)
    end function

    function rocsparse_sdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csr_full_rank
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
      rocsparse_sdense2csr_full_rank = rocsparse_sdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csr_rank_0
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
      rocsparse_sdense2csr_rank_0 = rocsparse_sdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csr_rank_1
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
      rocsparse_sdense2csr_rank_1 = rocsparse_sdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_ddense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csr_full_rank
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
      rocsparse_ddense2csr_full_rank = rocsparse_ddense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_ddense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csr_rank_0
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
      rocsparse_ddense2csr_rank_0 = rocsparse_ddense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_ddense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csr_rank_1
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
      rocsparse_ddense2csr_rank_1 = rocsparse_ddense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csr_full_rank
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
      rocsparse_cdense2csr_full_rank = rocsparse_cdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csr_rank_0
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
      rocsparse_cdense2csr_rank_0 = rocsparse_cdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csr_rank_1
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
      rocsparse_cdense2csr_rank_1 = rocsparse_cdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zdense2csr_full_rank(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csr_full_rank
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
      rocsparse_zdense2csr_full_rank = rocsparse_zdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zdense2csr_rank_0(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csr_rank_0
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
      rocsparse_zdense2csr_rank_0 = rocsparse_zdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zdense2csr_rank_1(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csr_rank_1
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
      rocsparse_zdense2csr_rank_1 = rocsparse_zdense2csr_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_rows),c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sprune_dense2csr_buffer_size_full_rank(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_buffer_size_full_rank = rocsparse_sprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_sprune_dense2csr_buffer_size_rank_0(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_buffer_size_rank_0 = rocsparse_sprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_sprune_dense2csr_buffer_size_rank_1(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_buffer_size_rank_1 = rocsparse_sprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_dprune_dense2csr_buffer_size_full_rank(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_buffer_size_full_rank = rocsparse_dprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_dprune_dense2csr_buffer_size_rank_0(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_buffer_size_rank_0 = rocsparse_dprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_dprune_dense2csr_buffer_size_rank_1(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_buffer_size_rank_1 = rocsparse_dprune_dense2csr_buffer_size_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_sprune_dense2csr_nnz_full_rank(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_full_rank = rocsparse_sprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_nnz_rank_0(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_rank_0 = rocsparse_sprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_nnz_rank_1(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_rank_1 = rocsparse_sprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_full_rank(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_full_rank = rocsparse_dprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_rank_0(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_rank_0 = rocsparse_dprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_rank_1(handle,m,n,A,lda,threshold,descr,csr_row_ptr,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_rank_1 = rocsparse_dprune_dense2csr_nnz_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_full_rank(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_full_rank = rocsparse_sprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_rank_0(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_rank_0 = rocsparse_sprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_rank_1(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float) :: threshold
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_rank_1 = rocsparse_sprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_full_rank(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_full_rank = rocsparse_dprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_rank_0(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_rank_0 = rocsparse_dprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_rank_1(handle,m,n,A,lda,threshold,descr,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double) :: threshold
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_rank_1 = rocsparse_dprune_dense2csr_orig(handle,m,n,c_loc(A),lda,threshold,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_buffer_size_full_rank(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_by_percentage_buffer_size_full_rank = rocsparse_sprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_0(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_0 = rocsparse_sprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_1(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_dense2csr_by_percentage_buffer_size_rank_1 = rocsparse_sprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_buffer_size_full_rank(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_buffer_size_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_by_percentage_buffer_size_full_rank = rocsparse_dprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_0(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_0 = rocsparse_dprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_1(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_dense2csr_by_percentage_buffer_size_rank_1 = rocsparse_dprune_dense2csr_by_percentage_buffer_size_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,buffer_size)
    end function

    function rocsparse_sprune_dense2csr_nnz_by_percentage_full_rank(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_by_percentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_by_percentage_full_rank = rocsparse_sprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_nnz_by_percentage_rank_0(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_by_percentage_rank_0 = rocsparse_sprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_nnz_by_percentage_rank_1(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_nnz_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_nnz_by_percentage_rank_1 = rocsparse_sprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_by_percentage_full_rank(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_by_percentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_by_percentage_full_rank = rocsparse_dprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_by_percentage_rank_0(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_by_percentage_rank_0 = rocsparse_dprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_nnz_by_percentage_rank_1(handle,m,n,A,lda,percentage,descr,csr_row_ptr,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_nnz_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_nnz_by_percentage_rank_1 = rocsparse_dprune_dense2csr_nnz_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_row_ptr),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_full_rank(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_by_percentage_full_rank = rocsparse_sprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_rank_0(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_by_percentage_rank_0 = rocsparse_sprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_sprune_dense2csr_by_percentage_rank_1(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_dense2csr_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_float),value :: percentage
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_dense2csr_by_percentage_rank_1 = rocsparse_sprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_full_rank(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_by_percentage_full_rank = rocsparse_dprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_rank_0(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_by_percentage_rank_0 = rocsparse_dprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_dprune_dense2csr_by_percentage_rank_1(handle,m,n,A,lda,percentage,descr,csr_val,csr_row_ptr,csr_col_ind,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_dense2csr_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: lda
      real(c_double),value :: percentage
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_dense2csr_by_percentage_rank_1 = rocsparse_dprune_dense2csr_by_percentage_orig(handle,m,n,c_loc(A),lda,percentage,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),myInfo,temp_buffer)
    end function

    function rocsparse_sdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_sdense2csc_full_rank = rocsparse_sdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_sdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      real(c_float),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      !
      rocsparse_sdense2csc_rank_0 = rocsparse_sdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_sdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_sdense2csc_rank_1 = rocsparse_sdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_ddense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_ddense2csc_full_rank = rocsparse_ddense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_ddense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      real(c_double),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      !
      rocsparse_ddense2csc_rank_0 = rocsparse_ddense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_ddense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_ddense2csc_rank_1 = rocsparse_ddense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_cdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_cdense2csc_full_rank = rocsparse_cdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_cdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      complex(c_float_complex),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      !
      rocsparse_cdense2csc_rank_0 = rocsparse_cdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_cdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_cdense2csc_rank_1 = rocsparse_cdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_zdense2csc_full_rank(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csc_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_zdense2csc_full_rank = rocsparse_zdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_zdense2csc_rank_0(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      integer(c_int),target :: nnz_per_columns
      complex(c_double_complex),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      !
      rocsparse_zdense2csc_rank_0 = rocsparse_zdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_zdense2csc_rank_1(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      integer(c_int),target,dimension(:) :: nnz_per_columns
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      !
      rocsparse_zdense2csc_rank_1 = rocsparse_zdense2csc_orig(handle,m,n,descr,c_loc(A),ld,c_loc(nnz_per_columns),c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind))
    end function

    function rocsparse_scsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2dense_full_rank
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
      rocsparse_scsr2dense_full_rank = rocsparse_scsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_scsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2dense_rank_0
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
      rocsparse_scsr2dense_rank_0 = rocsparse_scsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_scsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2dense_rank_1
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
      rocsparse_scsr2dense_rank_1 = rocsparse_scsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2dense_full_rank
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
      rocsparse_dcsr2dense_full_rank = rocsparse_dcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2dense_rank_0
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
      rocsparse_dcsr2dense_rank_0 = rocsparse_dcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2dense_rank_1
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
      rocsparse_dcsr2dense_rank_1 = rocsparse_dcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2dense_full_rank
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
      rocsparse_ccsr2dense_full_rank = rocsparse_ccsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2dense_rank_0
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
      rocsparse_ccsr2dense_rank_0 = rocsparse_ccsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2dense_rank_1
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
      rocsparse_ccsr2dense_rank_1 = rocsparse_ccsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsr2dense_full_rank(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2dense_full_rank
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
      rocsparse_zcsr2dense_full_rank = rocsparse_zcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsr2dense_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2dense_rank_0
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
      rocsparse_zcsr2dense_rank_0 = rocsparse_zcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsr2dense_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2dense_rank_1
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
      rocsparse_zcsr2dense_rank_1 = rocsparse_zcsr2dense_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(A),ld)
    end function

    function rocsparse_scsc2dense_full_rank(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      real(c_float),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_scsc2dense_full_rank = rocsparse_scsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_scsc2dense_rank_0(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      real(c_float),target :: A
      integer(c_int),value :: ld
      !
      rocsparse_scsc2dense_rank_0 = rocsparse_scsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_scsc2dense_rank_1(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      real(c_float),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_scsc2dense_rank_1 = rocsparse_scsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsc2dense_full_rank(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      real(c_double),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_dcsc2dense_full_rank = rocsparse_dcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsc2dense_rank_0(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      real(c_double),target :: A
      integer(c_int),value :: ld
      !
      rocsparse_dcsc2dense_rank_0 = rocsparse_dcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_dcsc2dense_rank_1(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      real(c_double),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_dcsc2dense_rank_1 = rocsparse_dcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsc2dense_full_rank(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_ccsc2dense_full_rank = rocsparse_ccsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsc2dense_rank_0(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      complex(c_float_complex),target :: A
      integer(c_int),value :: ld
      !
      rocsparse_ccsc2dense_rank_0 = rocsparse_ccsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_ccsc2dense_rank_1(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_ccsc2dense_rank_1 = rocsparse_ccsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsc2dense_full_rank(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsc2dense_full_rank
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_zcsc2dense_full_rank = rocsparse_zcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsc2dense_rank_0(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsc2dense_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csc_val
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      complex(c_double_complex),target :: A
      integer(c_int),value :: ld
      !
      rocsparse_zcsc2dense_rank_0 = rocsparse_zcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_zcsc2dense_rank_1(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsc2dense_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int),value :: ld
      !
      rocsparse_zcsc2dense_rank_1 = rocsparse_zcsc2dense_orig(handle,m,n,descr,c_loc(csc_val),c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(A),ld)
    end function

    function rocsparse_snnz_compress_rank_0(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: nnz_per_row
      integer(c_int),target :: nnz_C
      real(c_float),value :: tol
      !
      rocsparse_snnz_compress_rank_0 = rocsparse_snnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_snnz_compress_rank_1(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      integer(c_int),target,dimension(:) :: nnz_C
      real(c_float),value :: tol
      !
      rocsparse_snnz_compress_rank_1 = rocsparse_snnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_dnnz_compress_rank_0(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: nnz_per_row
      integer(c_int),target :: nnz_C
      real(c_double),value :: tol
      !
      rocsparse_dnnz_compress_rank_0 = rocsparse_dnnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_dnnz_compress_rank_1(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      integer(c_int),target,dimension(:) :: nnz_C
      real(c_double),value :: tol
      !
      rocsparse_dnnz_compress_rank_1 = rocsparse_dnnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_cnnz_compress_rank_0(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      complex(c_float_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: nnz_per_row
      integer(c_int),target :: nnz_C
      complex(c_float_complex),value :: tol
      !
      rocsparse_cnnz_compress_rank_0 = rocsparse_cnnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_cnnz_compress_rank_1(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      complex(c_float_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      integer(c_int),target,dimension(:) :: nnz_C
      complex(c_float_complex),value :: tol
      !
      rocsparse_cnnz_compress_rank_1 = rocsparse_cnnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_znnz_compress_rank_0(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      complex(c_double_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: nnz_per_row
      integer(c_int),target :: nnz_C
      complex(c_double_complex),value :: tol
      !
      rocsparse_znnz_compress_rank_0 = rocsparse_znnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_znnz_compress_rank_1(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descr_A
      complex(c_double_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      integer(c_int),target,dimension(:) :: nnz_C
      complex(c_double_complex),value :: tol
      !
      rocsparse_znnz_compress_rank_1 = rocsparse_znnz_compress_orig(handle,m,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(nnz_per_row),c_loc(nnz_C),tol)
    end function

    function rocsparse_csr2coo_rank_0(handle,csr_row_ptr,nnz,m,coo_row_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2coo_rank_0
      type(c_ptr),value :: handle
      integer(c_int),target :: csr_row_ptr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target :: coo_row_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_csr2coo_rank_0 = rocsparse_csr2coo_orig(handle,c_loc(csr_row_ptr),nnz,m,c_loc(coo_row_ind),idx_base)
    end function

    function rocsparse_csr2coo_rank_1(handle,csr_row_ptr,nnz,m,coo_row_ind,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2coo_rank_1
      type(c_ptr),value :: handle
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_csr2coo_rank_1 = rocsparse_csr2coo_orig(handle,c_loc(csr_row_ptr),nnz,m,c_loc(coo_row_ind),idx_base)
    end function

    function rocsparse_csr2csc_buffer_size_rank_0(handle,m,n,nnz,csr_row_ptr,csr_col_ind,copy_values,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2csc_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(c_size_t) :: buffer_size
      !
      rocsparse_csr2csc_buffer_size_rank_0 = rocsparse_csr2csc_buffer_size_orig(handle,m,n,nnz,c_loc(csr_row_ptr),c_loc(csr_col_ind),copy_values,buffer_size)
    end function

    function rocsparse_csr2csc_buffer_size_rank_1(handle,m,n,nnz,csr_row_ptr,csr_col_ind,copy_values,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2csc_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(c_size_t) :: buffer_size
      !
      rocsparse_csr2csc_buffer_size_rank_1 = rocsparse_csr2csc_buffer_size_orig(handle,m,n,nnz,c_loc(csr_row_ptr),c_loc(csr_col_ind),copy_values,buffer_size)
    end function

    function rocsparse_scsr2csc_rank_0(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_float),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsr2csc_rank_0 = rocsparse_scsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_scsr2csc_rank_1(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_float),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_scsr2csc_rank_1 = rocsparse_scsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_dcsr2csc_rank_0(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      real(c_double),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsr2csc_rank_0 = rocsparse_dcsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_dcsr2csc_rank_1(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      real(c_double),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dcsr2csc_rank_1 = rocsparse_dcsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_ccsr2csc_rank_0(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_float_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsr2csc_rank_0 = rocsparse_ccsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_ccsr2csc_rank_1(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_float_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_ccsr2csc_rank_1 = rocsparse_ccsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_zcsr2csc_rank_0(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csc_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      complex(c_double_complex),target :: csc_val
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsr2csc_rank_0 = rocsparse_zcsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_zcsr2csc_rank_1(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csc_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      complex(c_double_complex),target,dimension(:) :: csc_val
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zcsr2csc_rank_1 = rocsparse_zcsr2csc_orig(handle,m,n,nnz,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(csc_val),c_loc(csc_row_ind),c_loc(csc_col_ptr),copy_values,idx_base,temp_buffer)
    end function

    function rocsparse_csr2ell_width_rank_0(handle,m,csr_descr,csr_row_ptr,ell_descr,ell_width)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2ell_width_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      integer(c_int),target :: csr_row_ptr
      type(c_ptr),value :: ell_descr
      integer(c_int),target :: ell_width
      !
      rocsparse_csr2ell_width_rank_0 = rocsparse_csr2ell_width_orig(handle,m,csr_descr,c_loc(csr_row_ptr),ell_descr,c_loc(ell_width))
    end function

    function rocsparse_csr2ell_width_rank_1(handle,m,csr_descr,csr_row_ptr,ell_descr,ell_width)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2ell_width_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      type(c_ptr),value :: ell_descr
      integer(c_int),target,dimension(:) :: ell_width
      !
      rocsparse_csr2ell_width_rank_1 = rocsparse_csr2ell_width_orig(handle,m,csr_descr,c_loc(csr_row_ptr),ell_descr,c_loc(ell_width))
    end function

    function rocsparse_scsr2ell_rank_0(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2ell_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_float),target :: ell_val
      integer(c_int),target :: ell_col_ind
      !
      rocsparse_scsr2ell_rank_0 = rocsparse_scsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_scsr2ell_rank_1(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2ell_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_float),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      !
      rocsparse_scsr2ell_rank_1 = rocsparse_scsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_dcsr2ell_rank_0(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2ell_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_double),target :: ell_val
      integer(c_int),target :: ell_col_ind
      !
      rocsparse_dcsr2ell_rank_0 = rocsparse_dcsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_dcsr2ell_rank_1(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2ell_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_double),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      !
      rocsparse_dcsr2ell_rank_1 = rocsparse_dcsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_ccsr2ell_rank_0(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2ell_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_float_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      !
      rocsparse_ccsr2ell_rank_0 = rocsparse_ccsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_ccsr2ell_rank_1(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2ell_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_float_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      !
      rocsparse_ccsr2ell_rank_1 = rocsparse_ccsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_zcsr2ell_rank_0(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2ell_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_double_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      !
      rocsparse_zcsr2ell_rank_0 = rocsparse_zcsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_zcsr2ell_rank_1(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2ell_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_double_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      !
      rocsparse_zcsr2ell_rank_1 = rocsparse_zcsr2ell_orig(handle,m,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind))
    end function

    function rocsparse_scsr2hyb_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_scsr2hyb_rank_0 = rocsparse_scsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_scsr2hyb_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_scsr2hyb_rank_1 = rocsparse_scsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_dcsr2hyb_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_dcsr2hyb_rank_0 = rocsparse_dcsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_dcsr2hyb_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_dcsr2hyb_rank_1 = rocsparse_dcsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_ccsr2hyb_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_ccsr2hyb_rank_0 = rocsparse_ccsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_ccsr2hyb_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_ccsr2hyb_rank_1 = rocsparse_ccsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_zcsr2hyb_rank_0(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2hyb_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_zcsr2hyb_rank_0 = rocsparse_zcsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_zcsr2hyb_rank_1(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2hyb_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
      !
      rocsparse_zcsr2hyb_rank_1 = rocsparse_zcsr2hyb_orig(handle,m,n,descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),hyb,user_ell_width,partition_type)
    end function

    function rocsparse_csr2bsr_nnz_rank_0(handle,dir,m,n,csr_descr,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_row_ptr,bsr_nnz)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2bsr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_nnz
      !
      rocsparse_csr2bsr_nnz_rank_0 = rocsparse_csr2bsr_nnz_orig(handle,dir,m,n,csr_descr,c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_row_ptr),c_loc(bsr_nnz))
    end function

    function rocsparse_csr2bsr_nnz_rank_1(handle,dir,m,n,csr_descr,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_row_ptr,bsr_nnz)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2bsr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_nnz
      !
      rocsparse_csr2bsr_nnz_rank_1 = rocsparse_csr2bsr_nnz_orig(handle,dir,m,n,csr_descr,c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_row_ptr),c_loc(bsr_nnz))
    end function

    function rocsparse_scsr2bsr_rank_0(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      !
      rocsparse_scsr2bsr_rank_0 = rocsparse_scsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_scsr2bsr_rank_1(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      !
      rocsparse_scsr2bsr_rank_1 = rocsparse_scsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_dcsr2bsr_rank_0(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      !
      rocsparse_dcsr2bsr_rank_0 = rocsparse_dcsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_dcsr2bsr_rank_1(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      !
      rocsparse_dcsr2bsr_rank_1 = rocsparse_dcsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_ccsr2bsr_rank_0(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      !
      rocsparse_ccsr2bsr_rank_0 = rocsparse_ccsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_ccsr2bsr_rank_1(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      !
      rocsparse_ccsr2bsr_rank_1 = rocsparse_ccsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_zcsr2bsr_rank_0(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2bsr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      !
      rocsparse_zcsr2bsr_rank_0 = rocsparse_zcsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_zcsr2bsr_rank_1(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2bsr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      !
      rocsparse_zcsr2bsr_rank_1 = rocsparse_zcsr2bsr_orig(handle,dir,m,n,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),block_dim,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind))
    end function

    function rocsparse_scsr2csr_compress_rank_0(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: nnz_per_row
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      real(c_float),value :: tol
      !
      rocsparse_scsr2csr_compress_rank_0 = rocsparse_scsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_scsr2csr_compress_rank_1(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      real(c_float),value :: tol
      !
      rocsparse_scsr2csr_compress_rank_1 = rocsparse_scsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_dcsr2csr_compress_rank_0(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: nnz_per_row
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      real(c_double),value :: tol
      !
      rocsparse_dcsr2csr_compress_rank_0 = rocsparse_dcsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_dcsr2csr_compress_rank_1(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      real(c_double),value :: tol
      !
      rocsparse_dcsr2csr_compress_rank_1 = rocsparse_dcsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_ccsr2csr_compress_rank_0(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      complex(c_float_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: nnz_per_row
      complex(c_float_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      complex(c_float_complex),value :: tol
      !
      rocsparse_ccsr2csr_compress_rank_0 = rocsparse_ccsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_ccsr2csr_compress_rank_1(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      complex(c_float_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      complex(c_float_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      complex(c_float_complex),value :: tol
      !
      rocsparse_ccsr2csr_compress_rank_1 = rocsparse_ccsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_zcsr2csr_compress_rank_0(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csr_compress_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      complex(c_double_complex),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target :: nnz_per_row
      complex(c_double_complex),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      complex(c_double_complex),value :: tol
      !
      rocsparse_zcsr2csr_compress_rank_0 = rocsparse_zcsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_zcsr2csr_compress_rank_1(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csr_compress_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr_A
      complex(c_double_complex),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      integer(c_int),target,dimension(:) :: nnz_per_row
      complex(c_double_complex),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      complex(c_double_complex),value :: tol
      !
      rocsparse_zcsr2csr_compress_rank_1 = rocsparse_zcsr2csr_compress_orig(handle,m,n,descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),nnz_A,c_loc(nnz_per_row),c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),tol)
    end function

    function rocsparse_sprune_csr2csr_buffer_size_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_csr2csr_buffer_size_rank_0 = rocsparse_sprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),buffer_size)
    end function

    function rocsparse_sprune_csr2csr_buffer_size_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_csr2csr_buffer_size_rank_1 = rocsparse_sprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),buffer_size)
    end function

    function rocsparse_dprune_csr2csr_buffer_size_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_csr2csr_buffer_size_rank_0 = rocsparse_dprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),buffer_size)
    end function

    function rocsparse_dprune_csr2csr_buffer_size_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_csr2csr_buffer_size_rank_1 = rocsparse_dprune_csr2csr_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),buffer_size)
    end function

    function rocsparse_sprune_csr2csr_nnz_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_nnz_rank_0 = rocsparse_sprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_nnz_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_nnz_rank_1 = rocsparse_sprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_nnz_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_nnz_rank_0 = rocsparse_dprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_nnz_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_nnz_rank_1 = rocsparse_dprune_csr2csr_nnz_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_rank_0 = rocsparse_sprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_rank_1 = rocsparse_sprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_rank_0 = rocsparse_dprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,threshold,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double) :: threshold
      type(c_ptr),value :: csr_descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_rank_1 = rocsparse_dprune_csr2csr_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),threshold,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_0 = rocsparse_sprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,buffer_size)
    end function

    function rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_sprune_csr2csr_by_percentage_buffer_size_rank_1 = rocsparse_sprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,buffer_size)
    end function

    function rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_0 = rocsparse_dprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,buffer_size)
    end function

    function rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      integer(c_size_t) :: buffer_size
      !
      rocsparse_dprune_csr2csr_by_percentage_buffer_size_rank_1 = rocsparse_dprune_csr2csr_by_percentage_buffer_size_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,buffer_size)
    end function

    function rocsparse_sprune_csr2csr_nnz_by_percentage_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_nnz_by_percentage_rank_0 = rocsparse_sprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_nnz_by_percentage_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_nnz_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_nnz_by_percentage_rank_1 = rocsparse_sprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_nnz_by_percentage_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_nnz_by_percentage_rank_0 = rocsparse_dprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_nnz_by_percentage_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_row_ptr_C,nnz_total_dev_host_ptr,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_nnz_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int) :: nnz_total_dev_host_ptr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_nnz_by_percentage_rank_1 = rocsparse_dprune_csr2csr_nnz_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_row_ptr_C),nnz_total_dev_host_ptr,myInfo,temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_by_percentage_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_float),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_by_percentage_rank_0 = rocsparse_sprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,temp_buffer)
    end function

    function rocsparse_sprune_csr2csr_by_percentage_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sprune_csr2csr_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_float),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_float),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_float),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_sprune_csr2csr_by_percentage_rank_1 = rocsparse_sprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_by_percentage_rank_0(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target :: csr_val_A
      integer(c_int),target :: csr_row_ptr_A
      integer(c_int),target :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_double),target :: csr_val_C
      integer(c_int),target :: csr_row_ptr_C
      integer(c_int),target :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_by_percentage_rank_0 = rocsparse_dprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,temp_buffer)
    end function

    function rocsparse_dprune_csr2csr_by_percentage_rank_1(handle,m,n,nnz_A,csr_descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,percentage,csr_descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,myInfo,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dprune_csr2csr_by_percentage_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_descr_A
      real(c_double),target,dimension(:) :: csr_val_A
      integer(c_int),target,dimension(:) :: csr_row_ptr_A
      integer(c_int),target,dimension(:) :: csr_col_ind_A
      real(c_double),value :: percentage
      type(c_ptr),value :: csr_descr_C
      real(c_double),target,dimension(:) :: csr_val_C
      integer(c_int),target,dimension(:) :: csr_row_ptr_C
      integer(c_int),target,dimension(:) :: csr_col_ind_C
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dprune_csr2csr_by_percentage_rank_1 = rocsparse_dprune_csr2csr_by_percentage_orig(handle,m,n,nnz_A,csr_descr_A,c_loc(csr_val_A),c_loc(csr_row_ptr_A),c_loc(csr_col_ind_A),percentage,csr_descr_C,c_loc(csr_val_C),c_loc(csr_row_ptr_C),c_loc(csr_col_ind_C),myInfo,temp_buffer)
    end function

    function rocsparse_coo2csr_rank_0(handle,coo_row_ind,nnz,m,csr_row_ptr,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coo2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),target :: coo_row_ind
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target :: csr_row_ptr
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_coo2csr_rank_0 = rocsparse_coo2csr_orig(handle,c_loc(coo_row_ind),nnz,m,c_loc(csr_row_ptr),idx_base)
    end function

    function rocsparse_coo2csr_rank_1(handle,coo_row_ind,nnz,m,csr_row_ptr,idx_base)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coo2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      !
      rocsparse_coo2csr_rank_1 = rocsparse_coo2csr_orig(handle,c_loc(coo_row_ind),nnz,m,c_loc(csr_row_ptr),idx_base)
    end function

    function rocsparse_ell2csr_nnz_rank_0(handle,m,n,ell_descr,ell_width,ell_col_ind,csr_descr,csr_row_ptr,csr_nnz)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ell2csr_nnz_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      integer(c_int),target :: ell_col_ind
      type(c_ptr),value :: csr_descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_nnz
      !
      rocsparse_ell2csr_nnz_rank_0 = rocsparse_ell2csr_nnz_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_col_ind),csr_descr,c_loc(csr_row_ptr),c_loc(csr_nnz))
    end function

    function rocsparse_ell2csr_nnz_rank_1(handle,m,n,ell_descr,ell_width,ell_col_ind,csr_descr,csr_row_ptr,csr_nnz)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ell2csr_nnz_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      integer(c_int),target,dimension(:) :: ell_col_ind
      type(c_ptr),value :: csr_descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_nnz
      !
      rocsparse_ell2csr_nnz_rank_1 = rocsparse_ell2csr_nnz_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_col_ind),csr_descr,c_loc(csr_row_ptr),c_loc(csr_nnz))
    end function

    function rocsparse_sell2csr_rank_0(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sell2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_float),target :: ell_val
      integer(c_int),target :: ell_col_ind
      type(c_ptr),value :: csr_descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_sell2csr_rank_0 = rocsparse_sell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sell2csr_rank_1(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sell2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_float),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      type(c_ptr),value :: csr_descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_sell2csr_rank_1 = rocsparse_sell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dell2csr_rank_0(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dell2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_double),target :: ell_val
      integer(c_int),target :: ell_col_ind
      type(c_ptr),value :: csr_descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_dell2csr_rank_0 = rocsparse_dell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dell2csr_rank_1(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dell2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      real(c_double),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      type(c_ptr),value :: csr_descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_dell2csr_rank_1 = rocsparse_dell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cell2csr_rank_0(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cell2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_float_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_cell2csr_rank_0 = rocsparse_cell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cell2csr_rank_1(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cell2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_float_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_cell2csr_rank_1 = rocsparse_cell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zell2csr_rank_0(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zell2csr_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_double_complex),target :: ell_val
      integer(c_int),target :: ell_col_ind
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_zell2csr_rank_0 = rocsparse_zell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zell2csr_rank_1(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zell2csr_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: ell_descr
      integer(c_int),value :: ell_width
      complex(c_double_complex),target,dimension(:) :: ell_val
      integer(c_int),target,dimension(:) :: ell_col_ind
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_zell2csr_rank_1 = rocsparse_zell2csr_orig(handle,m,n,ell_descr,ell_width,c_loc(ell_val),c_loc(ell_col_ind),csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_hyb2csr_buffer_size_rank_0(handle,descr,hyb,csr_row_ptr,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_hyb2csr_buffer_size_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      integer(c_int),target :: csr_row_ptr
      integer(c_size_t) :: buffer_size
      !
      rocsparse_hyb2csr_buffer_size_rank_0 = rocsparse_hyb2csr_buffer_size_orig(handle,descr,hyb,c_loc(csr_row_ptr),buffer_size)
    end function

    function rocsparse_hyb2csr_buffer_size_rank_1(handle,descr,hyb,csr_row_ptr,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_hyb2csr_buffer_size_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_size_t) :: buffer_size
      !
      rocsparse_hyb2csr_buffer_size_rank_1 = rocsparse_hyb2csr_buffer_size_orig(handle,descr,hyb,c_loc(csr_row_ptr),buffer_size)
    end function

    function rocsparse_shyb2csr_rank_0(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_shyb2csr_rank_0 = rocsparse_shyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_shyb2csr_rank_1(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_shyb2csr_rank_1 = rocsparse_shyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_dhyb2csr_rank_0(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dhyb2csr_rank_0 = rocsparse_dhyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_dhyb2csr_rank_1(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_dhyb2csr_rank_1 = rocsparse_dhyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_chyb2csr_rank_0(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_chyb2csr_rank_0 = rocsparse_chyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_chyb2csr_rank_1(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_chyb2csr_rank_1 = rocsparse_chyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_zhyb2csr_rank_0(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhyb2csr_rank_0
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zhyb2csr_rank_0 = rocsparse_zhyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_zhyb2csr_rank_1(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhyb2csr_rank_1
      type(c_ptr),value :: handle
      type(c_ptr),value :: descr
      type(c_ptr),value :: hyb
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_zhyb2csr_rank_1 = rocsparse_zhyb2csr_orig(handle,descr,hyb,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind),temp_buffer)
    end function

    function rocsparse_create_identity_permutation_rank_0(handle,n,p)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_identity_permutation_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),target :: p
      !
      rocsparse_create_identity_permutation_rank_0 = rocsparse_create_identity_permutation_orig(handle,n,c_loc(p))
    end function

    function rocsparse_create_identity_permutation_rank_1(handle,n,p)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_identity_permutation_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),target,dimension(:) :: p
      !
      rocsparse_create_identity_permutation_rank_1 = rocsparse_create_identity_permutation_orig(handle,n,c_loc(p))
    end function

    function rocsparse_csrsort_buffer_size_rank_0(handle,m,n,nnz,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_csrsort_buffer_size_rank_0 = rocsparse_csrsort_buffer_size_orig(handle,m,n,nnz,c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_csrsort_buffer_size_rank_1(handle,m,n,nnz,csr_row_ptr,csr_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_csrsort_buffer_size_rank_1 = rocsparse_csrsort_buffer_size_orig(handle,m,n,nnz,c_loc(csr_row_ptr),c_loc(csr_col_ind),buffer_size)
    end function

    function rocsparse_csrsort_rank_0(handle,m,n,nnz,descr,csr_row_ptr,csr_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      integer(c_int),target :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_csrsort_rank_0 = rocsparse_csrsort_orig(handle,m,n,nnz,descr,c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_csrsort_rank_1(handle,m,n,nnz,descr,csr_row_ptr,csr_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      integer(c_int),target,dimension(:) :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_csrsort_rank_1 = rocsparse_csrsort_orig(handle,m,n,nnz,descr,c_loc(csr_row_ptr),c_loc(csr_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_cscsort_buffer_size_rank_0(handle,m,n,nnz,csc_col_ptr,csc_row_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cscsort_buffer_size_rank_0 = rocsparse_cscsort_buffer_size_orig(handle,m,n,nnz,c_loc(csc_col_ptr),c_loc(csc_row_ind),buffer_size)
    end function

    function rocsparse_cscsort_buffer_size_rank_1(handle,m,n,nnz,csc_col_ptr,csc_row_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_cscsort_buffer_size_rank_1 = rocsparse_cscsort_buffer_size_orig(handle,m,n,nnz,c_loc(csc_col_ptr),c_loc(csc_row_ind),buffer_size)
    end function

    function rocsparse_cscsort_rank_0(handle,m,n,nnz,descr,csc_col_ptr,csc_row_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      integer(c_int),target :: csc_col_ptr
      integer(c_int),target :: csc_row_ind
      integer(c_int),target :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cscsort_rank_0 = rocsparse_cscsort_orig(handle,m,n,nnz,descr,c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_cscsort_rank_1(handle,m,n,nnz,descr,csc_col_ptr,csc_row_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descr
      integer(c_int),target,dimension(:) :: csc_col_ptr
      integer(c_int),target,dimension(:) :: csc_row_ind
      integer(c_int),target,dimension(:) :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_cscsort_rank_1 = rocsparse_cscsort_orig(handle,m,n,nnz,descr,c_loc(csc_col_ptr),c_loc(csc_row_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_coosort_buffer_size_rank_0(handle,m,n,nnz,coo_row_ind,coo_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_buffer_size_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_coosort_buffer_size_rank_0 = rocsparse_coosort_buffer_size_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),buffer_size)
    end function

    function rocsparse_coosort_buffer_size_rank_1(handle,m,n,nnz,coo_row_ind,coo_col_ind,buffer_size)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_buffer_size_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      integer(c_size_t) :: buffer_size
      !
      rocsparse_coosort_buffer_size_rank_1 = rocsparse_coosort_buffer_size_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),buffer_size)
    end function

    function rocsparse_coosort_by_row_rank_0(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_row_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      integer(c_int),target :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_coosort_by_row_rank_0 = rocsparse_coosort_by_row_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_coosort_by_row_rank_1(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_row_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      integer(c_int),target,dimension(:) :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_coosort_by_row_rank_1 = rocsparse_coosort_by_row_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_coosort_by_column_rank_0(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_column_rank_0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target :: coo_row_ind
      integer(c_int),target :: coo_col_ind
      integer(c_int),target :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_coosort_by_column_rank_0 = rocsparse_coosort_by_column_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_coosort_by_column_rank_1(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_column_rank_1
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      integer(c_int),target,dimension(:) :: coo_row_ind
      integer(c_int),target,dimension(:) :: coo_col_ind
      integer(c_int),target,dimension(:) :: perm
      type(c_ptr),value :: temp_buffer
      !
      rocsparse_coosort_by_column_rank_1 = rocsparse_coosort_by_column_orig(handle,m,n,nnz,c_loc(coo_row_ind),c_loc(coo_col_ind),c_loc(perm),temp_buffer)
    end function

    function rocsparse_sbsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_sbsr2csr_rank_0 = rocsparse_sbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sbsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_sbsr2csr_rank_1 = rocsparse_sbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dbsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_dbsr2csr_rank_0 = rocsparse_dbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dbsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_dbsr2csr_rank_1 = rocsparse_dbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cbsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_cbsr2csr_rank_0 = rocsparse_cbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cbsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_cbsr2csr_rank_1 = rocsparse_cbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zbsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_zbsr2csr_rank_0 = rocsparse_zbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zbsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_zbsr2csr_rank_1 = rocsparse_zbsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sgebsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgebsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_float),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      real(c_float),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_sgebsr2csr_rank_0 = rocsparse_sgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_sgebsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgebsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_float),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      real(c_float),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_sgebsr2csr_rank_1 = rocsparse_sgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dgebsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgebsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_double),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      real(c_double),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_dgebsr2csr_rank_0 = rocsparse_dgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_dgebsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgebsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      real(c_double),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      real(c_double),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_dgebsr2csr_rank_1 = rocsparse_dgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cgebsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgebsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_cgebsr2csr_rank_0 = rocsparse_cgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_cgebsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgebsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_float_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      complex(c_float_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_cgebsr2csr_rank_1 = rocsparse_cgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zgebsr2csr_rank_0(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgebsr2csr_rank_0
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target :: bsr_val
      integer(c_int),target :: bsr_row_ptr
      integer(c_int),target :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target :: csr_val
      integer(c_int),target :: csr_row_ptr
      integer(c_int),target :: csr_col_ind
      !
      rocsparse_zgebsr2csr_rank_0 = rocsparse_zgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

    function rocsparse_zgebsr2csr_rank_1(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,row_block_dim,col_block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind)
      use iso_c_binding
      use hipfort_rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgebsr2csr_rank_1
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: bsr_descr
      complex(c_double_complex),target,dimension(:) :: bsr_val
      integer(c_int),target,dimension(:) :: bsr_row_ptr
      integer(c_int),target,dimension(:) :: bsr_col_ind
      integer(c_int),value :: row_block_dim
      integer(c_int),value :: col_block_dim
      type(c_ptr),value :: csr_descr
      complex(c_double_complex),target,dimension(:) :: csr_val
      integer(c_int),target,dimension(:) :: csr_row_ptr
      integer(c_int),target,dimension(:) :: csr_col_ind
      !
      rocsparse_zgebsr2csr_rank_1 = rocsparse_zgebsr2csr_orig(handle,dir,mb,nb,bsr_descr,c_loc(bsr_val),c_loc(bsr_row_ptr),c_loc(bsr_col_ind),row_block_dim,col_block_dim,csr_descr,c_loc(csr_val),c_loc(csr_row_ptr),c_loc(csr_col_ind))
    end function

  
#endif
end module hipfort_rocsparse