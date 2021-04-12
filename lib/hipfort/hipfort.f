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
          
           
module hipfort
#ifdef USE_CUDA_NAMES
  use hipfort_cuda_errors
#endif
  use hipfort_enums
  use hipfort_types
  use hipfort_hipmalloc
  use hipfort_hipmemcpy
  implicit none

 
  !> 
  !>   @brief Waits on all active streams on current device
  !>  
  !>   When this command is invoked, the host thread gets blocked until all the commands associated
  !>   with streams associated with the device. HIP does not support multiple blocking modes (yet!).
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipSetDevice, hipDeviceReset
  !>  
  interface hipDeviceSynchronize
#ifdef USE_CUDA_NAMES
    function hipDeviceSynchronize_orig() bind(c, name="cudaDeviceSynchronize")
#else
    function hipDeviceSynchronize_orig() bind(c, name="hipDeviceSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSynchronize_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceSynchronize_orig
#endif
    end function


  end interface
  !> 
  !>   @brief The state of current device is discarded and updated to a fresh state.
  !>  
  !>   Calling this function deletes all streams created, memory allocated, kernels running, events
  !>   created. Make sure that no other thread is using the device or streams, memory, kernels, events
  !>   associated with the current device.
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipDeviceSynchronize
  !>  
  interface hipDeviceReset
#ifdef USE_CUDA_NAMES
    function hipDeviceReset_orig() bind(c, name="cudaDeviceReset")
#else
    function hipDeviceReset_orig() bind(c, name="hipDeviceReset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceReset_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceReset_orig
#endif
    end function


  end interface
  !> 
  !>   @brief Set default device to be used for subsequent hip API calls from this thread.
  !>  
  !>   @param[in] deviceId Valid device in range 0...hipGetDeviceCount().
  !>  
  !>   Sets @p device as the default device for the calling host thread.  Valid device id's are 0...
  !>   (hipGetDeviceCount()-1).
  !>  
  !>   Many HIP APIs implicitly use the "default device" :
  !>  
  !>   - Any device memory subsequently allocated from this host thread (using hipMalloc) will be
  !>   allocated on device.
  !>   - Any streams or events created from this host thread will be associated with device.
  !>   - Any kernels launched from this host thread (using hipLaunchKernel) will be executed on device
  !>   (unless a specific stream is specified, in which case the device associated with that stream will
  !>   be used).
  !>  
  !>   This function may be called from any host thread.  Multiple host threads may use the same device.
  !>   This function does no synchronization with the previous or new device, and has very little
  !>   runtime overhead. Applications can use hipSetDevice to quickly switch the default device before
  !>   making a HIP runtime call which uses the default device.
  !>  
  !>   The default device is stored in thread-local-storage for each thread.
  !>   Thread-pool implementations may inherit the default device of the previous thread.  A good
  !>   practice is to always call hipSetDevice at the start of HIP coding sequency to establish a known
  !>   standard device.
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorDeviceAlreadyInUse
  !>  
  !>   @see hipGetDevice, hipGetDeviceCount
  !>  
  interface hipSetDevice
#ifdef USE_CUDA_NAMES
    function hipSetDevice_orig(deviceId) bind(c, name="cudaSetDevice")
#else
    function hipSetDevice_orig(deviceId) bind(c, name="hipSetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetDevice_orig
#else
      integer(kind(hipSuccess)) :: hipSetDevice_orig
#endif
      integer(c_int),value :: deviceId
    end function


  end interface
  !> 
  !>   @brief Return the default device id for the calling host thread.
  !>  
  !>   @param [out] device device is written with the default device
  !>  
  !>   HIP maintains an default device for each thread using thread-local-storage.
  !>   This device is used implicitly for HIP runtime APIs called by this thread.
  !>   hipGetDevice returns in  @p device the default device for the calling host thread.
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !>  
  !>   @see hipSetDevice, hipGetDevicesizeBytes
  !>  
  interface hipGetDevice
#ifdef USE_CUDA_NAMES
    function hipGetDevice_orig(deviceId) bind(c, name="cudaGetDevice")
#else
    function hipGetDevice_orig(deviceId) bind(c, name="hipGetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDevice_orig
#else
      integer(kind(hipSuccess)) :: hipGetDevice_orig
#endif
      integer(c_int) :: deviceId
    end function


  end interface
  !> 
  !>   @brief Return number of compute-capable devices.
  !>  
  !>   @param [output] count Returns number of compute-capable devices.
  !>  
  !>   @returns #hipSuccess, #hipErrorNoDevice
  !>  
  !>  
  !>   Returns in @p count the number of devices that have ability to run compute commands.  If there
  !>   are no such devices, then @ref hipGetDeviceCount will return #hipErrorNoDevice. If 1 or more
  !>   devices can be found, then hipGetDeviceCount returns #hipSuccess.
  !>  
  interface hipGetDeviceCount
#ifdef USE_CUDA_NAMES
    function hipGetDeviceCount_orig(count) bind(c, name="cudaGetDeviceCount")
#else
    function hipGetDeviceCount_orig(count) bind(c, name="hipGetDeviceCount")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceCount_orig
#else
      integer(kind(hipSuccess)) :: hipGetDeviceCount_orig
#endif
      integer(c_int) :: count
    end function


  end interface
  !> 
  !>   @brief Query for a specific device attribute.
  !>  
  !>   @param [out] pi pointer to value to return
  !>   @param [in] attr attribute to query
  !>   @param [in] deviceId which device to query for information
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !>  
  interface hipDeviceGetAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceGetAttribute_orig(pi,attr,deviceId) bind(c, name="cudaDeviceGetAttribute")
#else
    function hipDeviceGetAttribute_orig(pi,attr,deviceId) bind(c, name="hipDeviceGetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetAttribute_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetAttribute_orig
#endif
      type(c_ptr),value :: pi
      integer(kind(hipDeviceAttributeMaxThreadsPerBlock)),value :: attr
      integer(c_int),value :: deviceId
    end function


  end interface
  !> 
  !>   @brief Returns device properties.
  !>  
  !>   @param [out] prop written with device properties
  !>   @param [in]  deviceId which device to query for information
  !>  
  !>   @return #hipSuccess, #hipErrorInvalidDevice
  !>   @bug HCC always returns 0 for maxThreadsPerMultiProcessor
  !>   @bug HCC always returns 0 for regsPerBlock
  !>   @bug HCC always returns 0 for l2CacheSize
  !>  
  !>   Populates hipGetDeviceProperties with information for the specified device.
  !>  
  interface hipGetDeviceProperties
#ifdef USE_CUDA_NAMES
    function hipGetDeviceProperties_orig(prop,deviceId) bind(c, name="cudaGetDeviceProperties")
#else
    function hipGetDeviceProperties_orig(prop,deviceId) bind(c, name="hipGetDeviceProperties")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceProperties_orig
#else
      integer(kind(hipSuccess)) :: hipGetDeviceProperties_orig
#endif
      type(c_ptr) :: prop
      integer(c_int),value :: deviceId
    end function


  end interface
  !> 
  !>   @brief Set L1Shared cache partition.
  !>  
  !>   @param [in] cacheConfig
  !>  
  !>   @returns #hipSuccess, #hipErrorNotInitialized
  !>   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !>   on those architectures.
  !>  
  !>  
  interface hipDeviceSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceSetCacheConfig_orig(cacheConfig) bind(c, name="cudaDeviceSetCacheConfig")
#else
    function hipDeviceSetCacheConfig_orig(cacheConfig) bind(c, name="hipDeviceSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSetCacheConfig_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceSetCacheConfig_orig
#endif
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function


  end interface
  !> 
  !>   @brief Set Cache configuration for a specific function
  !>  
  !>   @param [in] cacheConfig
  !>  
  !>   @returns #hipSuccess, #hipErrorNotInitialized
  !>   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !>   on those architectures.
  !>  
  !>  
  interface hipDeviceGetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceGetCacheConfig_orig(cacheConfig) bind(c, name="cudaDeviceGetCacheConfig")
#else
    function hipDeviceGetCacheConfig_orig(cacheConfig) bind(c, name="hipDeviceGetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetCacheConfig_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetCacheConfig_orig
#endif
      type(c_ptr),value :: cacheConfig
    end function


  end interface
  !> 
  !>   @brief Get Resource limits of current device
  !>  
  !>   @param [out] pValue
  !>   @param [in]  limit
  !>  
  !>   @returns #hipSuccess, #hipErrorUnsupportedLimit, #hipErrorInvalidValue
  !>   Note: Currently, only hipLimitMallocHeapSize is available
  !>  
  !>  
  interface hipDeviceGetLimit
#ifdef USE_CUDA_NAMES
    function hipDeviceGetLimit_orig(pValue,limit) bind(c, name="cudaDeviceGetLimit")
#else
    function hipDeviceGetLimit_orig(pValue,limit) bind(c, name="hipDeviceGetLimit")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetLimit_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetLimit_orig
#endif
      integer(c_size_t) :: pValue
      integer(kind(hipLimitMallocHeapSize)),value :: limit
    end function


  end interface
  !> 
  !>   @brief Set attribute for a specific function
  !>  
  !>   @param [in] func;
  !>   @param [in] attr;
  !>   @param [in] value;
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
  !>  
  !>   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>   ignored on those architectures.
  !>  
  !>  
  interface hipFuncSetAttribute
#ifdef USE_CUDA_NAMES
    function hipFuncSetAttribute_orig(func,attr,myValue) bind(c, name="cudaFuncSetAttribute")
#else
    function hipFuncSetAttribute_orig(func,attr,myValue) bind(c, name="hipFuncSetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncSetAttribute_orig
#else
      integer(kind(hipSuccess)) :: hipFuncSetAttribute_orig
#endif
      type(c_ptr),value :: func
      integer(kind(hipFuncAttributeMaxDynamicSharedMemorySize)),value :: attr
      integer(c_int),value :: myValue
    end function


  end interface
  !> 
  !>   @brief Set Cache configuration for a specific function
  !>  
  !>   @param [in] config;
  !>  
  !>   @returns #hipSuccess, #hipErrorNotInitialized
  !>   Note: AMD devices and some Nvidia GPUS do not support reconfigurable cache.  This hint is ignored
  !>   on those architectures.
  !>  
  !>  
  interface hipFuncSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipFuncSetCacheConfig_orig(func,config) bind(c, name="cudaFuncSetCacheConfig")
#else
    function hipFuncSetCacheConfig_orig(func,config) bind(c, name="hipFuncSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncSetCacheConfig_orig
#else
      integer(kind(hipSuccess)) :: hipFuncSetCacheConfig_orig
#endif
      type(c_ptr),value :: func
      integer(kind(hipFuncCachePreferNone)),value :: config
    end function


  end interface
  !> 
  !>   @brief Set shared memory configuation for a specific function
  !>  
  !>   @param [in] func
  !>   @param [in] config
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDeviceFunction, #hipErrorInvalidValue
  !>  
  !>   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>   ignored on those architectures.
  !>  
  !>  
  interface hipFuncSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipFuncSetSharedMemConfig_orig(func,config) bind(c, name="cudaFuncSetSharedMemConfig")
#else
    function hipFuncSetSharedMemConfig_orig(func,config) bind(c, name="hipFuncSetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncSetSharedMemConfig_orig
#else
      integer(kind(hipSuccess)) :: hipFuncSetSharedMemConfig_orig
#endif
      type(c_ptr),value :: func
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function


  end interface
  !> 
  !>   @brief Returns bank width of shared memory for current device
  !>  
  !>   @param [out] pConfig
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  !>   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>   ignored on those architectures.
  !>  
  !>  
  interface hipDeviceGetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceGetSharedMemConfig_orig(pConfig) bind(c, name="cudaDeviceGetSharedMemConfig")
#else
    function hipDeviceGetSharedMemConfig_orig(pConfig) bind(c, name="hipDeviceGetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetSharedMemConfig_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetSharedMemConfig_orig
#endif
      type(c_ptr),value :: pConfig
    end function


  end interface
  !> 
  !>   @brief Gets the flags set for current device
  !>  
  !>   @param [out] flags
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !>  
  interface hipGetDeviceFlags
#ifdef USE_CUDA_NAMES
    function hipGetDeviceFlags_orig(flags) bind(c, name="cudaGetDeviceFlags")
#else
    function hipGetDeviceFlags_orig(flags) bind(c, name="hipGetDeviceFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceFlags_orig
#else
      integer(kind(hipSuccess)) :: hipGetDeviceFlags_orig
#endif
      type(c_ptr),value :: flags
    end function


  end interface
  !> 
  !>   @brief The bank width of shared memory on current device is set
  !>  
  !>   @param [in] config
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  !>   Note: AMD devices and some Nvidia GPUS do not support shared cache banking, and the hint is
  !>   ignored on those architectures.
  !>  
  !>  
  interface hipDeviceSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipDeviceSetSharedMemConfig_orig(config) bind(c, name="cudaDeviceSetSharedMemConfig")
#else
    function hipDeviceSetSharedMemConfig_orig(config) bind(c, name="hipDeviceSetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceSetSharedMemConfig_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceSetSharedMemConfig_orig
#endif
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function


  end interface
  !> 
  !>   @brief The current device behavior is changed according the flags passed.
  !>  
  !>   @param [in] flags
  !>  
  !>   The schedule flags impact how HIP waits for the completion of a command running on a device.
  !>   hipDeviceScheduleSpin         : HIP runtime will actively spin in the thread which submitted the
  !>   work until the command completes.  This offers the lowest latency, but will consume a CPU core
  !>   and may increase power. hipDeviceScheduleYield        : The HIP runtime will yield the CPU to
  !>   system so that other tasks can use it.  This may increase latency to detect the completion but
  !>   will consume less power and is friendlier to other tasks in the system.
  !>   hipDeviceScheduleBlockingSync : On ROCm platform, this is a synonym for hipDeviceScheduleYield.
  !>   hipDeviceScheduleAuto         : Use a hueristic to select between Spin and Yield modes.  If the
  !>   number of HIP contexts is greater than the number of logical processors in the system, use Spin
  !>   scheduling.  Else use Yield scheduling.
  !>  
  !>  
  !>   hipDeviceMapHost              : Allow mapping host memory.  On ROCM, this is always allowed and
  !>   the flag is ignored. hipDeviceLmemResizeToMax      : @warning ROCm silently ignores this flag.
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorSetOnActiveProcess
  !>  
  !>  
  !>  
  interface hipSetDeviceFlags
#ifdef USE_CUDA_NAMES
    function hipSetDeviceFlags_orig(flags) bind(c, name="cudaSetDeviceFlags")
#else
    function hipSetDeviceFlags_orig(flags) bind(c, name="hipSetDeviceFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetDeviceFlags_orig
#else
      integer(kind(hipSuccess)) :: hipSetDeviceFlags_orig
#endif
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Device which matches hipDeviceProp_t is returned
  !>  
  !>   @param [out] device ID
  !>   @param [in]  device properties pointer
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipChooseDevice
#ifdef USE_CUDA_NAMES
    function hipChooseDevice_orig(device,prop) bind(c, name="cudaChooseDevice")
#else
    function hipChooseDevice_orig(device,prop) bind(c, name="hipChooseDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipChooseDevice_orig
#else
      integer(kind(hipSuccess)) :: hipChooseDevice_orig
#endif
      integer(c_int) :: device
      type(c_ptr) :: prop
    end function


  end interface
  !> 
  !>   @brief Returns the link type and hop count between two devices
  !>  
  !>   @param [in] device1 Ordinal for device1
  !>   @param [in] device2 Ordinal for device2
  !>   @param [out] linktype Returns the link type (See hsa_amd_link_info_type_t) between the two devices
  !>   @param [out] hopcount Returns the hop count between the two devices
  !>  
  !>   Queries and returns the HSA link type and the hop count between the two specified devices.
  !>  
  !>   @returns #hipSuccess, #hipInvalidDevice, #hipErrorRuntimeOther
  !>  
  interface hipExtGetLinkTypeAndHopCount
#ifdef USE_CUDA_NAMES
    function hipExtGetLinkTypeAndHopCount_orig(device1,device2,linktype,hopcount) bind(c, name="cudaExtGetLinkTypeAndHopCount")
#else
    function hipExtGetLinkTypeAndHopCount_orig(device1,device2,linktype,hopcount) bind(c, name="hipExtGetLinkTypeAndHopCount")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtGetLinkTypeAndHopCount_orig
#else
      integer(kind(hipSuccess)) :: hipExtGetLinkTypeAndHopCount_orig
#endif
      integer(c_int),value :: device1
      integer(c_int),value :: device2
      type(c_ptr),value :: linktype
      type(c_ptr),value :: hopcount
    end function


  end interface
  !> 
  !>   @brief Return last error returned by any HIP runtime API call and resets the stored error code to
  !>   #hipSuccess
  !>  
  !>   @returns return code from last HIP called from the active host thread
  !>  
  !>   Returns the last error that has been returned by any of the runtime calls in the same host
  !>   thread, and then resets the saved error to #hipSuccess.
  !>  
  !>   @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  !>  
  interface hipGetLastError
#ifdef USE_CUDA_NAMES
    function hipGetLastError_orig() bind(c, name="cudaGetLastError")
#else
    function hipGetLastError_orig() bind(c, name="hipGetLastError")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetLastError_orig
#else
      integer(kind(hipSuccess)) :: hipGetLastError_orig
#endif
    end function


  end interface
  !> 
  !>   @brief Return last error returned by any HIP runtime API call.
  !>  
  !>   @return #hipSuccess
  !>  
  !>   Returns the last error that has been returned by any of the runtime calls in the same host
  !>   thread. Unlike hipGetLastError, this function does not reset the saved error code.
  !>  
  !>   @see hipGetErrorString, hipGetLastError, hipPeakAtLastError, hipError_t
  !>  
  interface hipPeekAtLastError
#ifdef USE_CUDA_NAMES
    function hipPeekAtLastError_orig() bind(c, name="cudaPeekAtLastError")
#else
    function hipPeekAtLastError_orig() bind(c, name="hipPeekAtLastError")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipPeekAtLastError_orig
#else
      integer(kind(hipSuccess)) :: hipPeekAtLastError_orig
#endif
    end function


  end interface
  !> 
  !>   @brief Create an asynchronous stream.
  !>  
  !>   @param[in, out] stream Valid pointer to hipStream_t.  This function writes the memory with the
  !>   newly created stream.
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  !>   Create a new asynchronous stream.  @p stream returns an opaque handle that can be used to
  !>   reference the newly created stream in subsequent hipStream commands.  The stream is allocated on
  !>   the heap and will remain allocated even if the handle goes out-of-scope.  To release the memory
  !>   used by the stream, applicaiton must call hipStreamDestroy.
  !>  
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  !>   @see hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !>  
  interface hipStreamCreate
#ifdef USE_CUDA_NAMES
    function hipStreamCreate_orig(stream) bind(c, name="cudaStreamCreate")
#else
    function hipStreamCreate_orig(stream) bind(c, name="hipStreamCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreate_orig
#else
      integer(kind(hipSuccess)) :: hipStreamCreate_orig
#endif
      type(c_ptr) :: stream
    end function


  end interface
  !> 
  !>   @brief Create an asynchronous stream.
  !>  
  !>   @param[in, out] stream Pointer to new stream
  !>   @param[in ] flags to control stream creation.
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  !>   Create a new asynchronous stream.  @p stream returns an opaque handle that can be used to
  !>   reference the newly created stream in subsequent hipStream commands.  The stream is allocated on
  !>   the heap and will remain allocated even if the handle goes out-of-scope.  To release the memory
  !>   used by the stream, applicaiton must call hipStreamDestroy. Flags controls behavior of the
  !>   stream.  See #hipStreamDefault, #hipStreamNonBlocking.
  !>  
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !>  
  interface hipStreamCreateWithFlags
#ifdef USE_CUDA_NAMES
    function hipStreamCreateWithFlags_orig(stream,flags) bind(c, name="cudaStreamCreateWithFlags")
#else
    function hipStreamCreateWithFlags_orig(stream,flags) bind(c, name="hipStreamCreateWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreateWithFlags_orig
#else
      integer(kind(hipSuccess)) :: hipStreamCreateWithFlags_orig
#endif
      type(c_ptr) :: stream
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Create an asynchronous stream with the specified priority.
  !>  
  !>   @param[in, out] stream Pointer to new stream
  !>   @param[in ] flags to control stream creation.
  !>   @param[in ] priority of the stream. Lower numbers represent higher priorities.
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  !>   Create a new asynchronous stream with the specified priority.  @p stream returns an opaque handle
  !>   that can be used to reference the newly created stream in subsequent hipStream commands.  The
  !>   stream is allocated on the heap and will remain allocated even if the handle goes out-of-scope.
  !>   To release the memory used by the stream, applicaiton must call hipStreamDestroy. Flags controls
  !>   behavior of the stream.  See #hipStreamDefault, #hipStreamNonBlocking.
  !>  
  !>  
  !>   @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !>  
  interface hipStreamCreateWithPriority
#ifdef USE_CUDA_NAMES
    function hipStreamCreateWithPriority_orig(stream,flags,priority) bind(c, name="cudaStreamCreateWithPriority")
#else
    function hipStreamCreateWithPriority_orig(stream,flags,priority) bind(c, name="hipStreamCreateWithPriority")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamCreateWithPriority_orig
#else
      integer(kind(hipSuccess)) :: hipStreamCreateWithPriority_orig
#endif
      type(c_ptr) :: stream
      integer(kind=4),value :: flags
      integer(c_int),value :: priority
    end function


  end interface
  !> 
  !>   @brief Returns numerical values that correspond to the least and greatest stream priority.
  !>  
  !>   @param[in, out] leastPriority pointer in which value corresponding to least priority is returned.
  !>   @param[in, out] greatestPriority pointer in which value corresponding to greatest priority is returned.
  !>  
  !>   Returns in leastPriority and greatestPriority the numerical values that correspond to the least
  !>   and greatest stream priority respectively. Stream priorities follow a convention where lower numbers
  !>   imply greater priorities. The range of meaningful stream priorities is given by
  !>   [greatestPriority, leastPriority]. If the user attempts to create a stream with a priority value
  !>   that is outside the the meaningful range as specified by this API, the priority is automatically
  !>   clamped to within the valid range.
  !>  
  interface hipDeviceGetStreamPriorityRange
#ifdef USE_CUDA_NAMES
    function hipDeviceGetStreamPriorityRange_orig(leastPriority,greatestPriority) bind(c, name="cudaDeviceGetStreamPriorityRange")
#else
    function hipDeviceGetStreamPriorityRange_orig(leastPriority,greatestPriority) bind(c, name="hipDeviceGetStreamPriorityRange")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetStreamPriorityRange_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetStreamPriorityRange_orig
#endif
      type(c_ptr),value :: leastPriority
      type(c_ptr),value :: greatestPriority
    end function


  end interface
  !> 
  !>   @brief Destroys the specified stream.
  !>  
  !>   @param[in, out] stream Valid pointer to hipStream_t.  This function writes the memory with the
  !>   newly created stream.
  !>   @return #hipSuccess #hipErrorInvalidHandle
  !>  
  !>   Destroys the specified stream.
  !>  
  !>   If commands are still executing on the specified stream, some may complete execution before the
  !>   queue is deleted.
  !>  
  !>   The queue may be destroyed while some commands are still inflight, or may wait for all commands
  !>   queued to the stream before destroying it.
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamQuery, hipStreamWaitEvent,
  !>   hipStreamSynchronize
  !>  
  interface hipStreamDestroy
#ifdef USE_CUDA_NAMES
    function hipStreamDestroy_orig(stream) bind(c, name="cudaStreamDestroy")
#else
    function hipStreamDestroy_orig(stream) bind(c, name="hipStreamDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamDestroy_orig
#else
      integer(kind(hipSuccess)) :: hipStreamDestroy_orig
#endif
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Return #hipSuccess if all of the operations in the specified @p stream have completed, or
  !>   #hipErrorNotReady if not.
  !>  
  !>   @param[in] stream stream to query
  !>  
  !>   @return #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle
  !>  
  !>   This is thread-safe and returns a snapshot of the current state of the queue.  However, if other
  !>   host threads are sending work to the stream, the status may change immediately after the function
  !>   is called.  It is typically used for debug.
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamWaitEvent, hipStreamSynchronize,
  !>   hipStreamDestroy
  !>  
  interface hipStreamQuery
#ifdef USE_CUDA_NAMES
    function hipStreamQuery_orig(stream) bind(c, name="cudaStreamQuery")
#else
    function hipStreamQuery_orig(stream) bind(c, name="hipStreamQuery")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamQuery_orig
#else
      integer(kind(hipSuccess)) :: hipStreamQuery_orig
#endif
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Wait for all commands in stream to complete.
  !>  
  !>   @param[in] stream stream identifier.
  !>  
  !>   @return #hipSuccess, #hipErrorInvalidHandle
  !>  
  !>   This command is host-synchronous : the host will block until the specified stream is empty.
  !>  
  !>   This command follows standard null-stream semantics.  Specifically, specifying the null stream
  !>   will cause the command to wait for other streams on the same device to complete all pending
  !>   operations.
  !>  
  !>   This command honors the hipDeviceLaunchBlocking flag, which controls whether the wait is active
  !>   or blocking.
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamWaitEvent, hipStreamDestroy
  !>  
  !>  
  interface hipStreamSynchronize
#ifdef USE_CUDA_NAMES
    function hipStreamSynchronize_orig(stream) bind(c, name="cudaStreamSynchronize")
#else
    function hipStreamSynchronize_orig(stream) bind(c, name="hipStreamSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamSynchronize_orig
#else
      integer(kind(hipSuccess)) :: hipStreamSynchronize_orig
#endif
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Make the specified compute stream wait for an event
  !>  
  !>   @param[in] stream stream to make wait.
  !>   @param[in] event event to wait on
  !>   @param[in] flags control operation [must be 0]
  !>  
  !>   @return #hipSuccess, #hipErrorInvalidHandle
  !>  
  !>   This function inserts a wait operation into the specified stream.
  !>   All future work submitted to @p stream will wait until @p event reports completion before
  !>   beginning execution.
  !>  
  !>   This function only waits for commands in the current stream to complete.  Notably,, this function
  !>   does not impliciy wait for commands in the default stream to complete, even if the specified
  !>   stream is created with hipStreamNonBlocking = 0.
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamCreateWithPriority, hipStreamSynchronize, hipStreamDestroy
  !>  
  interface hipStreamWaitEvent
#ifdef USE_CUDA_NAMES
    function hipStreamWaitEvent_orig(stream,event,flags) bind(c, name="cudaStreamWaitEvent")
#else
    function hipStreamWaitEvent_orig(stream,event,flags) bind(c, name="hipStreamWaitEvent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamWaitEvent_orig
#else
      integer(kind(hipSuccess)) :: hipStreamWaitEvent_orig
#endif
      type(c_ptr),value :: stream
      type(c_ptr),value :: event
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Return flags associated with this stream.
  !>  
  !>   @param[in] stream stream to be queried
  !>   @param[in,out] flags Pointer to an unsigned integer in which the stream's flags are returned
  !>   @return #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle
  !>  
  !>   @returns #hipSuccess #hipErrorInvalidValue #hipErrorInvalidHandle
  !>  
  !>   Return flags associated with this stream in @p flags.
  !>  
  !>   @see hipStreamCreateWithFlags
  !>  
  interface hipStreamGetFlags
#ifdef USE_CUDA_NAMES
    function hipStreamGetFlags_orig(stream,flags) bind(c, name="cudaStreamGetFlags")
#else
    function hipStreamGetFlags_orig(stream,flags) bind(c, name="hipStreamGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamGetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipStreamGetFlags_orig
#endif
      type(c_ptr),value :: stream
      type(c_ptr),value :: flags
    end function


  end interface
  !> 
  !>   @brief Query the priority of a stream.
  !>  
  !>   @param[in] stream stream to be queried
  !>   @param[in,out] priority Pointer to an unsigned integer in which the stream's priority is returned
  !>   @return #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidHandle
  !>  
  !>   @returns #hipSuccess #hipErrorInvalidValue #hipErrorInvalidHandle
  !>  
  !>   Query the priority of a stream. The priority is returned in in priority.
  !>  
  !>   @see hipStreamCreateWithFlags
  !>  
  interface hipStreamGetPriority
#ifdef USE_CUDA_NAMES
    function hipStreamGetPriority_orig(stream,priority) bind(c, name="cudaStreamGetPriority")
#else
    function hipStreamGetPriority_orig(stream,priority) bind(c, name="hipStreamGetPriority")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamGetPriority_orig
#else
      integer(kind(hipSuccess)) :: hipStreamGetPriority_orig
#endif
      type(c_ptr),value :: stream
      type(c_ptr),value :: priority
    end function


  end interface
  !> 
  !>   @brief Create an asynchronous stream with the specified CU mask.
  !>  
  !>   @param[in, out] stream Pointer to new stream
  !>   @param[in ] cuMaskSize Size of CU mask bit array passed in.
  !>   @param[in ] cuMask Bit-vector representing the CU mask. Each active bit represents using one CU.
  !>   The first 32 bits represent the first 32 CUs, and so on. If its size is greater than physical
  !>   CU number (i.e., multiProcessorCount member of hipDeviceProp_t), the extra elements are ignored.
  !>   It is user's responsibility to make sure the input is meaningful.
  !>   @return #hipSuccess, #hipErrorInvalidHandle, #hipErrorInvalidValue
  !>  
  !>   Create a new asynchronous stream with the specified CU mask.  @p stream returns an opaque handle
  !>   that can be used to reference the newly created stream in subsequent hipStream commands.  The
  !>   stream is allocated on the heap and will remain allocated even if the handle goes out-of-scope.
  !>   To release the memory used by the stream, application must call hipStreamDestroy.
  !>  
  !>  
  !>   @see hipStreamCreate, hipStreamSynchronize, hipStreamWaitEvent, hipStreamDestroy
  !>  
  interface hipExtStreamCreateWithCUMask
#ifdef USE_CUDA_NAMES
    function hipExtStreamCreateWithCUMask_orig(stream,cuMaskSize,cuMask) bind(c, name="cudaExtStreamCreateWithCUMask")
#else
    function hipExtStreamCreateWithCUMask_orig(stream,cuMaskSize,cuMask) bind(c, name="hipExtStreamCreateWithCUMask")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtStreamCreateWithCUMask_orig
#else
      integer(kind(hipSuccess)) :: hipExtStreamCreateWithCUMask_orig
#endif
      type(c_ptr) :: stream
      integer(kind=4),value :: cuMaskSize
      type(c_ptr),value :: cuMask
    end function


  end interface
  !> 
  !>   @brief Adds a callback to be called on the host after all currently enqueued
  !>   items in the stream have completed.  For each
  !>   cudaStreamAddCallback call, a callback will be executed exactly once.
  !>   The callback will block later work in the stream until it is finished.
  !>   @param[in] stream   - Stream to add callback to
  !>   @param[in] callback - The function to call once preceding stream operations are complete
  !>   @param[in] userData - User specified data to be passed to the callback function
  !>   @param[in] flags    - Reserved for future use, must be 0
  !>   @return #hipSuccess, #hipErrorInvalidHandle, #hipErrorNotSupported
  !>  
  !>   @see hipStreamCreate, hipStreamCreateWithFlags, hipStreamQuery, hipStreamSynchronize,
  !>   hipStreamWaitEvent, hipStreamDestroy, hipStreamCreateWithPriority
  !>  
  !>  
  interface hipStreamAddCallback
#ifdef USE_CUDA_NAMES
    function hipStreamAddCallback_orig(stream,callback,userData,flags) bind(c, name="cudaStreamAddCallback")
#else
    function hipStreamAddCallback_orig(stream,callback,userData,flags) bind(c, name="hipStreamAddCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipStreamAddCallback_orig
#else
      integer(kind(hipSuccess)) :: hipStreamAddCallback_orig
#endif
      type(c_ptr),value :: stream
      type(c_funptr),value :: callback
      type(c_ptr),value :: userData
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Create an event with the specified flags
  !>  
  !>   @param[in,out] event Returns the newly created event.
  !>   @param[in] flags     Flags to control event behavior.  Valid values are #hipEventDefault,
  !>  #hipEventBlockingSync, #hipEventDisableTiming, #hipEventInterprocess
  !> 
  !>   #hipEventDefault : Default flag.  The event will use active synchronization and will support
  !>  timing.  Blocking synchronization provides lowest possible latency at the expense of dedicating a
  !>  CPU to poll on the event.
  !>   #hipEventBlockingSync : The event will use blocking synchronization : if hipEventSynchronize is
  !>  called on this event, the thread will block until the event completes.  This can increase latency
  !>  for the synchroniation but can result in lower power and more resources for other CPU threads.
  !>   #hipEventDisableTiming : Disable recording of timing information.  On ROCM platform, timing
  !>  information is always recorded and this flag has no performance benefit.
  !> 
  !>   @warning On AMD platform, hipEventInterprocess support is under development.  Use of this flag
  !>  will return an error.
  !>  
  !>   @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !>  #hipErrorLaunchFailure, #hipErrorOutOfMemory
  !>  
  !>   @see hipEventCreate, hipEventSynchronize, hipEventDestroy, hipEventElapsedTime
  !>  
  interface hipEventCreateWithFlags
#ifdef USE_CUDA_NAMES
    function hipEventCreateWithFlags_orig(event,flags) bind(c, name="cudaEventCreateWithFlags")
#else
    function hipEventCreateWithFlags_orig(event,flags) bind(c, name="hipEventCreateWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventCreateWithFlags_orig
#else
      integer(kind(hipSuccess)) :: hipEventCreateWithFlags_orig
#endif
      type(c_ptr) :: event
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>    Create an event
  !>  
  !>   @param[in,out] event Returns the newly created event.
  !>  
  !>   @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !>   #hipErrorLaunchFailure, #hipErrorOutOfMemory
  !>  
  !>   @see hipEventCreateWithFlags, hipEventRecord, hipEventQuery, hipEventSynchronize,
  !>   hipEventDestroy, hipEventElapsedTime
  !>  
  interface hipEventCreate
#ifdef USE_CUDA_NAMES
    function hipEventCreate_orig(event) bind(c, name="cudaEventCreate")
#else
    function hipEventCreate_orig(event) bind(c, name="hipEventCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventCreate_orig
#else
      integer(kind(hipSuccess)) :: hipEventCreate_orig
#endif
      type(c_ptr) :: event
    end function


  end interface
  !> 
  !>   @brief Record an event in the specified stream.
  !>  
  !>   @param[in] event event to record.
  !>   @param[in] stream stream in which to record event.
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
  !>   #hipErrorInvalidHandle, #hipErrorLaunchFailure
  !>  
  !>   hipEventQuery() or hipEventSynchronize() must be used to determine when the event
  !>   transitions from "recording" (after hipEventRecord() is called) to "recorded"
  !>   (when timestamps are set, if requested).
  !>  
  !>   Events which are recorded in a non-NULL stream will transition to
  !>   from recording to "recorded" state when they reach the head of
  !>   the specified stream, after all previous
  !>   commands in that stream have completed executing.
  !>  
  !>   If hipEventRecord() has been previously called on this event, then this call will overwrite any
  !>   existing state in event.
  !>  
  !>   If this function is called on an event that is currently being recorded, results are undefined
  !>   - either outstanding recording may save state into the event, and the order is not guaranteed.
  !>  
  !>   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize,
  !>   hipEventDestroy, hipEventElapsedTime
  !>  
  !>  
  interface hipEventRecord
#ifdef USE_CUDA_NAMES
    function hipEventRecord_orig(event,stream) bind(c, name="cudaEventRecord")
#else
    function hipEventRecord_orig(event,stream) bind(c, name="hipEventRecord")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventRecord_orig
#else
      integer(kind(hipSuccess)) :: hipEventRecord_orig
#endif
      type(c_ptr),value :: event
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Destroy the specified event.
  !>  
  !>    @param[in] event Event to destroy.
  !>    @returns #hipSuccess, #hipErrorNotInitialized, #hipErrorInvalidValue,
  !>   #hipErrorLaunchFailure
  !>  
  !>    Releases memory associated with the event.  If the event is recording but has not completed
  !>   recording when hipEventDestroy() is called, the function will return immediately and the
  !>   completion_future resources will be released later, when the hipDevice is synchronized.
  !>  
  !>   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventSynchronize, hipEventRecord,
  !>   hipEventElapsedTime
  !>  
  !>   @returns #hipSuccess
  !>  
  interface hipEventDestroy
#ifdef USE_CUDA_NAMES
    function hipEventDestroy_orig(event) bind(c, name="cudaEventDestroy")
#else
    function hipEventDestroy_orig(event) bind(c, name="hipEventDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventDestroy_orig
#else
      integer(kind(hipSuccess)) :: hipEventDestroy_orig
#endif
      type(c_ptr),value :: event
    end function


  end interface
  !> 
  !>    @brief Wait for an event to complete.
  !>  
  !>    This function will block until the event is ready, waiting for all previous work in the stream
  !>   specified when event was recorded with hipEventRecord().
  !>  
  !>    If hipEventRecord() has not been called on @p event, this function returns immediately.
  !>  
  !>    TODO-hip- This function needs to support hipEventBlockingSync parameter.
  !>  
  !>    @param[in] event Event on which to wait.
  !>    @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized,
  !>   #hipErrorInvalidHandle, #hipErrorLaunchFailure
  !>  
  !>    @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !>   hipEventElapsedTime
  !>  
  interface hipEventSynchronize
#ifdef USE_CUDA_NAMES
    function hipEventSynchronize_orig(event) bind(c, name="cudaEventSynchronize")
#else
    function hipEventSynchronize_orig(event) bind(c, name="hipEventSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventSynchronize_orig
#else
      integer(kind(hipSuccess)) :: hipEventSynchronize_orig
#endif
      type(c_ptr),value :: event
    end function


  end interface
  !> 
  !>   @brief Return the elapsed time between two events.
  !>  
  !>   @param[out] ms : Return time between start and stop in ms.
  !>   @param[in]   start : Start event.
  !>   @param[in]   stop  : Stop event.
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorNotReady, #hipErrorInvalidHandle,
  !>   #hipErrorNotInitialized, #hipErrorLaunchFailure
  !>  
  !>   Computes the elapsed time between two events. Time is computed in ms, with
  !>   a resolution of approximately 1 us.
  !>  
  !>   Events which are recorded in a NULL stream will block until all commands
  !>   on all other streams complete execution, and then record the timestamp.
  !>  
  !>   Events which are recorded in a non-NULL stream will record their timestamp
  !>   when they reach the head of the specified stream, after all previous
  !>   commands in that stream have completed executing.  Thus the time that
  !>   the event recorded may be significantly after the host calls hipEventRecord().
  !>  
  !>   If hipEventRecord() has not been called on either event, then #hipErrorInvalidHandle is
  !>   returned. If hipEventRecord() has been called on both events, but the timestamp has not yet been
  !>   recorded on one or both events (that is, hipEventQuery() would return #hipErrorNotReady on at
  !>   least one of the events), then #hipErrorNotReady is returned.
  !>  
  !>   @see hipEventCreate, hipEventCreateWithFlags, hipEventQuery, hipEventDestroy, hipEventRecord,
  !>   hipEventSynchronize
  !>  
  interface hipEventElapsedTime
#ifdef USE_CUDA_NAMES
    function hipEventElapsedTime_orig(ms,start,myStop) bind(c, name="cudaEventElapsedTime")
#else
    function hipEventElapsedTime_orig(ms,start,myStop) bind(c, name="hipEventElapsedTime")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventElapsedTime_orig
#else
      integer(kind(hipSuccess)) :: hipEventElapsedTime_orig
#endif
      type(c_ptr),value :: ms
      type(c_ptr),value :: start
      type(c_ptr),value :: myStop
    end function


  end interface
  !> 
  !>   @brief Query event status
  !>  
  !>   @param[in] event Event to query.
  !>   @returns #hipSuccess, #hipErrorNotReady, #hipErrorInvalidHandle, #hipErrorInvalidValue,
  !>   #hipErrorNotInitialized, #hipErrorLaunchFailure
  !>  
  !>   Query the status of the specified event.  This function will return #hipErrorNotReady if all
  !>   commands in the appropriate stream (specified to hipEventRecord()) have completed.  If that work
  !>   has not completed, or if hipEventRecord() was not called on the event, then #hipSuccess is
  !>   returned.
  !>  
  !>   @see hipEventCreate, hipEventCreateWithFlags, hipEventRecord, hipEventDestroy,
  !>   hipEventSynchronize, hipEventElapsedTime
  !>  
  interface hipEventQuery
#ifdef USE_CUDA_NAMES
    function hipEventQuery_orig(event) bind(c, name="cudaEventQuery")
#else
    function hipEventQuery_orig(event) bind(c, name="hipEventQuery")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipEventQuery_orig
#else
      integer(kind(hipSuccess)) :: hipEventQuery_orig
#endif
      type(c_ptr),value :: event
    end function


  end interface
  !> 
  !>    @brief Return attributes for the specified pointer
  !>  
  !>    @param[out] attributes for the specified pointer
  !>    @param[in]  pointer to get attributes for
  !>  
  !>    @return #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !>  
  !>    @see hipGetDeviceCount, hipGetDevice, hipSetDevice, hipChooseDevice
  !>  
  interface hipPointerGetAttributes
#ifdef USE_CUDA_NAMES
    function hipPointerGetAttributes_orig(attributes,ptr) bind(c, name="cudaPointerGetAttributes")
#else
    function hipPointerGetAttributes_orig(attributes,ptr) bind(c, name="hipPointerGetAttributes")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipPointerGetAttributes_orig
#else
      integer(kind(hipSuccess)) :: hipPointerGetAttributes_orig
#endif
      type(c_ptr) :: attributes
      type(c_ptr),value :: ptr
    end function


  end interface
  !> 
  !>    @brief Allocate memory on the default accelerator
  !>  
  !>    @param[out] ptr Pointer to the allocated memory
  !>    @param[in]  size Requested memory size
  !>    @param[in]  flags Type of memory allocation
  !>  
  !>    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !>  
  !>    @return #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue (bad context, null ptr)
  !>  
  !>    @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
  !>   hipHostFree, hipHostMalloc
  !>  
  interface hipExtMallocWithFlags
#ifdef USE_CUDA_NAMES
    function hipExtMallocWithFlags_orig(ptr,sizeBytes,flags) bind(c, name="cudaExtMallocWithFlags")
#else
    function hipExtMallocWithFlags_orig(ptr,sizeBytes,flags) bind(c, name="hipExtMallocWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtMallocWithFlags_orig
#else
      integer(kind(hipSuccess)) :: hipExtMallocWithFlags_orig
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipMallocHost
#ifdef USE_CUDA_NAMES
    function hipMallocHost_orig(ptr,mySize) bind(c, name="cudaMallocHost")
#else
    function hipMallocHost_orig(ptr,mySize) bind(c, name="hipMallocHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMallocHost_orig
#else
      integer(kind(hipSuccess)) :: hipMallocHost_orig
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function


  end interface
  
  interface hipMemAllocHost
#ifdef USE_CUDA_NAMES
    function hipMemAllocHost_orig(ptr,mySize) bind(c, name="cudaMemAllocHost")
#else
    function hipMemAllocHost_orig(ptr,mySize) bind(c, name="hipMemAllocHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemAllocHost_orig
#else
      integer(kind(hipSuccess)) :: hipMemAllocHost_orig
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function


  end interface
  
  interface hipHostAlloc
#ifdef USE_CUDA_NAMES
    function hipHostAlloc_orig(ptr,mySize,flags) bind(c, name="cudaHostAlloc")
#else
    function hipHostAlloc_orig(ptr,mySize,flags) bind(c, name="hipHostAlloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostAlloc_orig
#else
      integer(kind(hipSuccess)) :: hipHostAlloc_orig
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>    @brief Get Device pointer from Host Pointer allocated through hipHostMalloc
  !>  
  !>    @param[out] dstPtr Device Pointer mapped to passed host pointer
  !>    @param[in]  hstPtr Host Pointer allocated through hipHostMalloc
  !>    @param[in]  flags Flags to be passed for extension
  !>  
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
  !>  
  !>    @see hipSetDeviceFlags, hipHostMalloc
  !>  
  interface hipHostGetDevicePointer
#ifdef USE_CUDA_NAMES
    function hipHostGetDevicePointer_orig(devPtr,hstPtr,flags) bind(c, name="cudaHostGetDevicePointer")
#else
    function hipHostGetDevicePointer_orig(devPtr,hstPtr,flags) bind(c, name="hipHostGetDevicePointer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_orig
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_orig
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: hstPtr
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>    @brief Return flags associated with host pointer
  !>  
  !>    @param[out] flagsPtr Memory location to store flags
  !>    @param[in]  hostPtr Host Pointer allocated through hipHostMalloc
  !>    @return #hipSuccess, #hipErrorInvalidValue
  !>  
  !>    @see hipHostMalloc
  !>  
  interface hipHostGetFlags
#ifdef USE_CUDA_NAMES
    function hipHostGetFlags_orig(flagsPtr,hostPtr) bind(c, name="cudaHostGetFlags")
#else
    function hipHostGetFlags_orig(flagsPtr,hostPtr) bind(c, name="hipHostGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipHostGetFlags_orig
#endif
      type(c_ptr),value :: flagsPtr
      type(c_ptr),value :: hostPtr
    end function


  end interface
  !> 
  !>    @brief Register host memory so it can be accessed from the current device.
  !>  
  !>    @param[out] hostPtr Pointer to host memory to be registered.
  !>    @param[in] sizeBytes size of the host memory
  !>    @param[in] flags.  See below.
  !>  
  !>    Flags:
  !>    - #hipHostRegisterDefault   Memory is Mapped and Portable
  !>    - #hipHostRegisterPortable  Memory is considered registered by all contexts.  HIP only supports
  !>   one context so this is always assumed true.
  !>    - #hipHostRegisterMapped    Map the allocation into the address space for the current device.
  !>   The device pointer can be obtained with #hipHostGetDevicePointer.
  !>  
  !>  
  !>    After registering the memory, use #hipHostGetDevicePointer to obtain the mapped device pointer.
  !>    On many systems, the mapped device pointer will have a different value than the mapped host
  !>   pointer.  Applications must use the device pointer in device code, and the host pointer in device
  !>   code.
  !>  
  !>    On some systems, registered memory is pinned.  On some systems, registered memory may not be
  !>   actually be pinned but uses OS or hardware facilities to all GPU access to the host memory.
  !>  
  !>    Developers are strongly encouraged to register memory blocks which are aligned to the host
  !>   cache-line size. (typically 64-bytes but can be obtains from the CPUID instruction).
  !>  
  !>    If registering non-aligned pointers, the application must take care when register pointers from
  !>   the same cache line on different devices.  HIP's coarse-grained synchronization model does not
  !>   guarantee correct results if different devices write to different parts of the same cache block -
  !>   typically one of the writes will "win" and overwrite data from the other registered memory
  !>   region.
  !>  
  !>    @return #hipSuccess, #hipErrorOutOfMemory
  !>  
  !>    @see hipHostUnregister, hipHostGetFlags, hipHostGetDevicePointer
  !>  
  interface hipHostRegister
#ifdef USE_CUDA_NAMES
    function hipHostRegister_orig(hostPtr,sizeBytes,flags) bind(c, name="cudaHostRegister")
#else
    function hipHostRegister_orig(hostPtr,sizeBytes,flags) bind(c, name="hipHostRegister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_orig
#else
      integer(kind(hipSuccess)) :: hipHostRegister_orig
#endif
      type(c_ptr),value :: hostPtr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>    @brief Un-register host pointer
  !>  
  !>    @param[in] hostPtr Host pointer previously registered with #hipHostRegister
  !>    @return Error code
  !>  
  !>    @see hipHostRegister
  !>  
  interface hipHostUnregister
#ifdef USE_CUDA_NAMES
    function hipHostUnregister_orig(hostPtr) bind(c, name="cudaHostUnregister")
#else
    function hipHostUnregister_orig(hostPtr) bind(c, name="hipHostUnregister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_orig
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_orig
#endif
      type(c_ptr),value :: hostPtr
    end function


  end interface
  !> 
  !>    Allocates at least width (in bytes)  height bytes of linear memory
  !>    Padding may occur to ensure alighnment requirements are met for the given row
  !>    The change in width size due to padding will be returned in pitch.
  !>    Currently the alignment is set to 128 bytes
  !>  
  !>    @param[out] ptr Pointer to the allocated device memory
  !>    @param[out] pitch Pitch for allocation (in bytes)
  !>    @param[in]  width Requested pitched allocation width (in bytes)
  !>    @param[in]  height Requested pitched allocation height
  !>  
  !>    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !>  
  !>    @return Error code
  !>  
  !>    @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !>   hipMalloc3DArray, hipHostMalloc
  !>  
  interface hipMallocPitch
#ifdef USE_CUDA_NAMES
    function hipMallocPitch_orig(ptr,pitch,width,height) bind(c, name="cudaMallocPitch")
#else
    function hipMallocPitch_orig(ptr,pitch,width,height) bind(c, name="hipMallocPitch")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMallocPitch_orig
#else
      integer(kind(hipSuccess)) :: hipMallocPitch_orig
#endif
      type(c_ptr) :: ptr
      integer(c_size_t) :: pitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function


  end interface
  !> 
  !>    Allocates at least width (in bytes)  height bytes of linear memory
  !>    Padding may occur to ensure alighnment requirements are met for the given row
  !>    The change in width size due to padding will be returned in pitch.
  !>    Currently the alignment is set to 128 bytes
  !>  
  !>    @param[out] dptr Pointer to the allocated device memory
  !>    @param[out] pitch Pitch for allocation (in bytes)
  !>    @param[in]  width Requested pitched allocation width (in bytes)
  !>    @param[in]  height Requested pitched allocation height
  !>  
  !>    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
  !>    The intended usage of pitch is as a separate parameter of the allocation, used to compute addresses within the 2D array. 
  !>    Given the row and column of an array element of type T, the address is computed as:
  !>    T pElement = (T)((char)BaseAddress + Row  Pitch) + Column;
  !>  
  !>    @return Error code
  !>  
  !>    @see hipMalloc, hipFree, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
  !>   hipMalloc3DArray, hipHostMalloc
  !>  
  interface hipMemAllocPitch
#ifdef USE_CUDA_NAMES
    function hipMemAllocPitch_orig(dptr,pitch,widthInBytes,height,elementSizeBytes) bind(c, name="cudaMemAllocPitch")
#else
    function hipMemAllocPitch_orig(dptr,pitch,widthInBytes,height,elementSizeBytes) bind(c, name="hipMemAllocPitch")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemAllocPitch_orig
#else
      integer(kind(hipSuccess)) :: hipMemAllocPitch_orig
#endif
      type(c_ptr) :: dptr
      integer(c_size_t) :: pitch
      integer(c_size_t),value :: widthInBytes
      integer(c_size_t),value :: height
      integer(kind=4),value :: elementSizeBytes
    end function


  end interface
  
  interface hipFreeHost
#ifdef USE_CUDA_NAMES
    function hipFreeHost_orig(ptr) bind(c, name="cudaFreeHost")
#else
    function hipFreeHost_orig(ptr) bind(c, name="hipFreeHost")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeHost_orig
#else
      integer(kind(hipSuccess)) :: hipFreeHost_orig
#endif
      type(c_ptr),value :: ptr
    end function


  end interface
  
  interface hipMemcpyWithStream
#ifdef USE_CUDA_NAMES
    function hipMemcpyWithStream_orig(dst,src,sizeBytes,myKind,stream) bind(c, name="cudaMemcpyWithStream")
#else
    function hipMemcpyWithStream_orig(dst,src,sizeBytes,myKind,stream) bind(c, name="hipMemcpyWithStream")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyWithStream_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyWithStream_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copy data from Host to Device
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyHtoD
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoD_orig(dst,src,sizeBytes) bind(c, name="cudaMemcpyHtoD")
#else
    function hipMemcpyHtoD_orig(dst,src,sizeBytes) bind(c, name="hipMemcpyHtoD")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoD_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoD_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function


  end interface
  !> 
  !>    @brief Copy data from Device to Host
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyDtoH
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoH_orig(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoH")
#else
    function hipMemcpyDtoH_orig(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoH")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoH_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoH_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function


  end interface
  !> 
  !>    @brief Copy data from Device to Device
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyDtoD
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoD_orig(dst,src,sizeBytes) bind(c, name="cudaMemcpyDtoD")
#else
    function hipMemcpyDtoD_orig(dst,src,sizeBytes) bind(c, name="hipMemcpyDtoD")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoD_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoD_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
    end function


  end interface
  !> 
  !>    @brief Copy data from Host to Device asynchronously
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyHtoDAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoDAsync_orig(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyHtoDAsync")
#else
    function hipMemcpyHtoDAsync_orig(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyHtoDAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoDAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoDAsync_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copy data from Device to Host asynchronously
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyDtoHAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoHAsync_orig(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoHAsync")
#else
    function hipMemcpyDtoHAsync_orig(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoHAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoHAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoHAsync_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copy data from Device to Device asynchronously
  !>  
  !>    @param[out]  dst Data being copy to
  !>    @param[in]   src Data being copy from
  !>    @param[in]   sizeBytes Data size in bytes
  !>  
  !>    @return #hipSuccess, #hipErrorDeInitialized, #hipErrorNotInitialized, #hipErrorInvalidContext,
  !>   #hipErrorInvalidValue
  !>  
  !>    @see hipArrayCreate, hipArrayDestroy, hipArrayGetDescriptor, hipMemAlloc, hipMemAllocHost,
  !>   hipMemAllocPitch, hipMemcpy2D, hipMemcpy2DAsync, hipMemcpy2DUnaligned, hipMemcpyAtoA,
  !>   hipMemcpyAtoD, hipMemcpyAtoH, hipMemcpyAtoHAsync, hipMemcpyDtoA, hipMemcpyDtoD,
  !>   hipMemcpyDtoDAsync, hipMemcpyDtoH, hipMemcpyDtoHAsync, hipMemcpyHtoA, hipMemcpyHtoAAsync,
  !>   hipMemcpyHtoDAsync, hipMemFree, hipMemFreeHost, hipMemGetAddressRange, hipMemGetInfo,
  !>   hipMemHostAlloc, hipMemHostGetDevicePointer
  !>  
  interface hipMemcpyDtoDAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyDtoDAsync_orig(dst,src,sizeBytes,stream) bind(c, name="cudaMemcpyDtoDAsync")
#else
    function hipMemcpyDtoDAsync_orig(dst,src,sizeBytes,stream) bind(c, name="hipMemcpyDtoDAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyDtoDAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyDtoDAsync_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function


  end interface
  
  interface hipModuleGetGlobal
#ifdef USE_CUDA_NAMES
    function hipModuleGetGlobal_orig(dptr,bytes,hmod,name) bind(c, name="cudaModuleGetGlobal")
#else
    function hipModuleGetGlobal_orig(dptr,bytes,hmod,name) bind(c, name="hipModuleGetGlobal")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetGlobal_orig
#else
      integer(kind(hipSuccess)) :: hipModuleGetGlobal_orig
#endif
      type(c_ptr) :: dptr
      integer(c_size_t) :: bytes
      type(c_ptr),value :: hmod
      type(c_ptr),value :: name
    end function


  end interface
  
  interface hipGetSymbolAddress
#ifdef USE_CUDA_NAMES
    function hipGetSymbolAddress_orig(devPtr,symbol) bind(c, name="cudaGetSymbolAddress")
#else
    function hipGetSymbolAddress_orig(devPtr,symbol) bind(c, name="hipGetSymbolAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetSymbolAddress_orig
#else
      integer(kind(hipSuccess)) :: hipGetSymbolAddress_orig
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: symbol
    end function


  end interface
  
  interface hipGetSymbolSize
#ifdef USE_CUDA_NAMES
    function hipGetSymbolSize_orig(mySize,symbol) bind(c, name="cudaGetSymbolSize")
#else
    function hipGetSymbolSize_orig(mySize,symbol) bind(c, name="hipGetSymbolSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetSymbolSize_orig
#else
      integer(kind(hipSuccess)) :: hipGetSymbolSize_orig
#endif
      integer(c_size_t) :: mySize
      type(c_ptr),value :: symbol
    end function


  end interface
  
  interface hipMemcpyToSymbolAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyToSymbolAsync_orig(symbol,src,sizeBytes,offset,myKind,stream) bind(c, name="cudaMemcpyToSymbolAsync")
#else
    function hipMemcpyToSymbolAsync_orig(symbol,src,sizeBytes,offset,myKind,stream) bind(c, name="hipMemcpyToSymbolAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyToSymbolAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyToSymbolAsync_orig
#endif
      type(c_ptr),value :: symbol
      type(c_ptr),value :: src
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function


  end interface
  
  interface hipMemcpyFromSymbolAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromSymbolAsync_orig(dst,symbol,sizeBytes,offset,myKind,stream) bind(c, name="cudaMemcpyFromSymbolAsync")
#else
    function hipMemcpyFromSymbolAsync_orig(dst,symbol,sizeBytes,offset,myKind,stream) bind(c, name="hipMemcpyFromSymbolAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyFromSymbolAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyFromSymbolAsync_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: symbol
      integer(c_size_t),value :: sizeBytes
      integer(c_size_t),value :: offset
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !>   byte value value.
  !>  
  !>    @param[out] dst Data being filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  sizeBytes Data size in bytes
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemset
#ifdef USE_CUDA_NAMES
    function hipMemset_orig(dst,myValue,sizeBytes) bind(c, name="cudaMemset")
#else
    function hipMemset_orig(dst,myValue,sizeBytes) bind(c, name="hipMemset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset_orig
#else
      integer(kind(hipSuccess)) :: hipMemset_orig
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !>   byte value value.
  !>  
  !>    @param[out] dst Data ptr to be filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  number of values to be set
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemsetD8
#ifdef USE_CUDA_NAMES
    function hipMemsetD8_orig(dest,myValue,count) bind(c, name="cudaMemsetD8")
#else
    function hipMemsetD8_orig(dest,myValue,count) bind(c, name="hipMemsetD8")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD8_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD8_orig
#endif
      type(c_ptr),value :: dest
      integer(kind=1),value :: myValue
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !>   byte value value.
  !>  
  !>   hipMemsetD8Async() is asynchronous with respect to the host, so the call may return before the
  !>   memset is complete. The operation can optionally be associated to a stream by passing a non-zero
  !>   stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>   streams.
  !>  
  !>    @param[out] dst Data ptr to be filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  number of values to be set
  !>    @param[in]  stream - Stream identifier
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemsetD8Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD8Async_orig(dest,myValue,count,stream) bind(c, name="cudaMemsetD8Async")
#else
    function hipMemsetD8Async_orig(dest,myValue,count,stream) bind(c, name="hipMemsetD8Async")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD8Async_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD8Async_orig
#endif
      type(c_ptr),value :: dest
      integer(kind=1),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !>   short value value.
  !>  
  !>    @param[out] dst Data ptr to be filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  number of values to be set
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemsetD16
#ifdef USE_CUDA_NAMES
    function hipMemsetD16_orig(dest,myValue,count) bind(c, name="cudaMemsetD16")
#else
    function hipMemsetD16_orig(dest,myValue,count) bind(c, name="hipMemsetD16")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD16_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD16_orig
#endif
      type(c_ptr),value :: dest
      integer(kind=2),value :: myValue
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dest with the ant
  !>   short value value.
  !>  
  !>   hipMemsetD16Async() is asynchronous with respect to the host, so the call may return before the
  !>   memset is complete. The operation can optionally be associated to a stream by passing a non-zero
  !>   stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>   streams.
  !>  
  !>    @param[out] dst Data ptr to be filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  number of values to be set
  !>    @param[in]  stream - Stream identifier
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemsetD16Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD16Async_orig(dest,myValue,count,stream) bind(c, name="cudaMemsetD16Async")
#else
    function hipMemsetD16Async_orig(dest,myValue,count,stream) bind(c, name="hipMemsetD16Async")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD16Async_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD16Async_orig
#endif
      type(c_ptr),value :: dest
      integer(kind=2),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills the memory area pointed to by dest with the ant integer
  !>   value for specified number of times.
  !>  
  !>    @param[out] dst Data being filled
  !>    @param[in]  ant value to be set
  !>    @param[in]  number of values to be set
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  interface hipMemsetD32
#ifdef USE_CUDA_NAMES
    function hipMemsetD32_orig(dest,myValue,count) bind(c, name="cudaMemsetD32")
#else
    function hipMemsetD32_orig(dest,myValue,count) bind(c, name="hipMemsetD32")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD32_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD32_orig
#endif
      type(c_ptr),value :: dest
      integer(c_int),value :: myValue
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>    @brief Fills the first sizeBytes bytes of the memory area pointed to by dev with the ant
  !>   byte value value.
  !>  
  !>    hipMemsetAsync() is asynchronous with respect to the host, so the call may return before the
  !>   memset is complete. The operation can optionally be associated to a stream by passing a non-zero
  !>   stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>   streams.
  !>  
  !>    @param[out] dst Pointer to device memory
  !>    @param[in]  value - Value to set for each byte of specified memory
  !>    @param[in]  sizeBytes - Size in bytes to set
  !>    @param[in]  stream - Stream identifier
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemsetAsync
#ifdef USE_CUDA_NAMES
    function hipMemsetAsync_orig(dst,myValue,sizeBytes,stream) bind(c, name="cudaMemsetAsync")
#else
    function hipMemsetAsync_orig(dst,myValue,sizeBytes,stream) bind(c, name="hipMemsetAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetAsync_orig
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills the memory area pointed to by dev with the ant integer
  !>   value for specified number of times.
  !>  
  !>    hipMemsetD32Async() is asynchronous with respect to the host, so the call may return before the
  !>   memset is complete. The operation can optionally be associated to a stream by passing a non-zero
  !>   stream argument. If stream is non-zero, the operation may overlap with operations in other
  !>   streams.
  !>  
  !>    @param[out] dst Pointer to device memory
  !>    @param[in]  value - Value to set for each byte of specified memory
  !>    @param[in]  count - number of values to be set
  !>    @param[in]  stream - Stream identifier
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemsetD32Async
#ifdef USE_CUDA_NAMES
    function hipMemsetD32Async_orig(dst,myValue,count,stream) bind(c, name="cudaMemsetD32Async")
#else
    function hipMemsetD32Async_orig(dst,myValue,count,stream) bind(c, name="hipMemsetD32Async")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemsetD32Async_orig
#else
      integer(kind(hipSuccess)) :: hipMemsetD32Async_orig
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: myValue
      integer(c_size_t),value :: count
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills the memory area pointed to by dst with the ant value.
  !>  
  !>    @param[out] dst Pointer to device memory
  !>    @param[in]  pitch - data size in bytes
  !>    @param[in]  value - ant value to be set
  !>    @param[in]  width
  !>    @param[in]  height
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemset2D
#ifdef USE_CUDA_NAMES
    function hipMemset2D_orig(dst,pitch,myValue,width,height) bind(c, name="cudaMemset2D")
#else
    function hipMemset2D_orig(dst,pitch,myValue,width,height) bind(c, name="hipMemset2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset2D_orig
#else
      integer(kind(hipSuccess)) :: hipMemset2D_orig
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
    end function


  end interface
  !> 
  !>    @brief Fills asynchronously the memory area pointed to by dst with the ant value.
  !>  
  !>    @param[in]  dst Pointer to device memory
  !>    @param[in]  pitch - data size in bytes
  !>    @param[in]  value - ant value to be set
  !>    @param[in]  width
  !>    @param[in]  height
  !>    @param[in]  stream
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemset2DAsync
#ifdef USE_CUDA_NAMES
    function hipMemset2DAsync_orig(dst,pitch,myValue,width,height,stream) bind(c, name="cudaMemset2DAsync")
#else
    function hipMemset2DAsync_orig(dst,pitch,myValue,width,height,stream) bind(c, name="hipMemset2DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset2DAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemset2DAsync_orig
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: pitch
      integer(c_int),value :: myValue
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Fills synchronously the memory area pointed to by pitchedDevPtr with the ant value.
  !>  
  !>    @param[in] pitchedDevPtr
  !>    @param[in]  value - ant value to be set
  !>    @param[in]  extent
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemset3D
#ifdef USE_CUDA_NAMES
    function hipMemset3D_orig(pitchedDevPtr,myValue,extent) bind(c, name="cudaMemset3D")
#else
    function hipMemset3D_orig(pitchedDevPtr,myValue,extent) bind(c, name="hipMemset3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset3D_orig
#else
      integer(kind(hipSuccess)) :: hipMemset3D_orig
#endif
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
    end function


  end interface
  !> 
  !>    @brief Fills asynchronously the memory area pointed to by pitchedDevPtr with the ant value.
  !>  
  !>    @param[in] pitchedDevPtr
  !>    @param[in]  value - ant value to be set
  !>    @param[in]  extent
  !>    @param[in]  stream
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryFree
  !>  
  interface hipMemset3DAsync
#ifdef USE_CUDA_NAMES
    function hipMemset3DAsync_orig(pitchedDevPtr,myValue,extent,stream) bind(c, name="cudaMemset3DAsync")
#else
    function hipMemset3DAsync_orig(pitchedDevPtr,myValue,extent,stream) bind(c, name="hipMemset3DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemset3DAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemset3DAsync_orig
#endif
      type(c_ptr),value :: pitchedDevPtr
      integer(c_int),value :: myValue
      type(c_ptr),value :: extent
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Query memory info.
  !>   Return snapshot of free memory, and total allocatable memory on the device.
  !>  
  !>   Returns in free a snapshot of the current free memory.
  !>   @returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue
  !>   @warning On HCC, the free memory only accounts for memory allocated by this process and may be
  !>  optimistic.
  !>  
  interface hipMemGetInfo
#ifdef USE_CUDA_NAMES
    function hipMemGetInfo_orig(free,total) bind(c, name="cudaMemGetInfo")
#else
    function hipMemGetInfo_orig(free,total) bind(c, name="hipMemGetInfo")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemGetInfo_orig
#else
      integer(kind(hipSuccess)) :: hipMemGetInfo_orig
#endif
      integer(c_size_t) :: free
      integer(c_size_t) :: total
    end function


  end interface
  
  interface hipMemPtrGetInfo
#ifdef USE_CUDA_NAMES
    function hipMemPtrGetInfo_orig(ptr,mySize) bind(c, name="cudaMemPtrGetInfo")
#else
    function hipMemPtrGetInfo_orig(ptr,mySize) bind(c, name="hipMemPtrGetInfo")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemPtrGetInfo_orig
#else
      integer(kind(hipSuccess)) :: hipMemPtrGetInfo_orig
#endif
      type(c_ptr),value :: ptr
      integer(c_size_t) :: mySize
    end function


  end interface
  
  interface hipArrayCreate
#ifdef USE_CUDA_NAMES
    function hipArrayCreate_orig(pHandle,pAllocateArray) bind(c, name="cudaArrayCreate")
#else
    function hipArrayCreate_orig(pHandle,pAllocateArray) bind(c, name="hipArrayCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipArrayCreate_orig
#else
      integer(kind(hipSuccess)) :: hipArrayCreate_orig
#endif
      type(c_ptr) :: pHandle
      type(c_ptr) :: pAllocateArray
    end function


  end interface
  
  interface hipArray3DCreate
#ifdef USE_CUDA_NAMES
    function hipArray3DCreate_orig(array,pAllocateArray) bind(c, name="cudaArray3DCreate")
#else
    function hipArray3DCreate_orig(array,pAllocateArray) bind(c, name="hipArray3DCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipArray3DCreate_orig
#else
      integer(kind(hipSuccess)) :: hipArray3DCreate_orig
#endif
      type(c_ptr) :: array
      type(c_ptr) :: pAllocateArray
    end function


  end interface
  
  interface hipMalloc3D
#ifdef USE_CUDA_NAMES
    function hipMalloc3D_orig(pitchedDevPtr,extent) bind(c, name="cudaMalloc3D")
#else
    function hipMalloc3D_orig(pitchedDevPtr,extent) bind(c, name="hipMalloc3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc3D_orig
#else
      integer(kind(hipSuccess)) :: hipMalloc3D_orig
#endif
      type(c_ptr) :: pitchedDevPtr
      type(c_ptr),value :: extent
    end function


  end interface
  !> 
  !>    @brief Frees an array on the device.
  !>  
  !>    @param[in]  array  Pointer to array to free
  !>    @return     #hipSuccess, #hipErrorInvalidValue, #hipErrorNotInitialized
  !>  
  !>    @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipHostMalloc, hipHostFree
  !>  
  interface hipFreeArray
#ifdef USE_CUDA_NAMES
    function hipFreeArray_orig(array) bind(c, name="cudaFreeArray")
#else
    function hipFreeArray_orig(array) bind(c, name="hipFreeArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeArray_orig
#else
      integer(kind(hipSuccess)) :: hipFreeArray_orig
#endif
      type(c_ptr) :: array
    end function


  end interface
  !> 
  !>   @brief Frees a mipmapped array on the device
  !>   
  !>   @param[in] mipmappedArray - Pointer to mipmapped array to free
  !>   
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipFreeMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipFreeMipmappedArray_orig(mipmappedArray) bind(c, name="cudaFreeMipmappedArray")
#else
    function hipFreeMipmappedArray_orig(mipmappedArray) bind(c, name="hipFreeMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFreeMipmappedArray_orig
#else
      integer(kind(hipSuccess)) :: hipFreeMipmappedArray_orig
#endif
      type(c_ptr),value :: mipmappedArray
    end function


  end interface
  !> 
  !>    @brief Allocate an array on the device.
  !>  
  !>    @param[out]  array  Pointer to allocated array in device memory
  !>    @param[in]   desc   Requested channel format
  !>    @param[in]   extent Requested array allocation width, height and depth
  !>    @param[in]   flags  Requested properties of allocated array
  !>    @return      #hipSuccess, #hipErrorOutOfMemory
  !>  
  !>    @see hipMalloc, hipMallocPitch, hipFree, hipFreeArray, hipHostMalloc, hipHostFree
  !>  
  interface hipMalloc3DArray
#ifdef USE_CUDA_NAMES
    function hipMalloc3DArray_orig(array,desc,extent,flags) bind(c, name="cudaMalloc3DArray")
#else
    function hipMalloc3DArray_orig(array,desc,extent,flags) bind(c, name="hipMalloc3DArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc3DArray_orig
#else
      integer(kind(hipSuccess)) :: hipMalloc3DArray_orig
#endif
      type(c_ptr) :: array
      type(c_ptr) :: desc
      type(c_ptr),value :: extent
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Allocate a mipmapped array on the device
  !>  
  !>   @param[out] mipmappedArray  - Pointer to allocated mipmapped array in device memory
  !>   @param[in]  desc            - Requested channel format
  !>   @param[in]  extent          - Requested allocation size (width field in elements)
  !>   @param[in]  numLevels       - Number of mipmap levels to allocate
  !>   @param[in]  flags           - Flags for extensions
  !>   
  !>   @return #hipSuccess, #hipErrorInvalidValue, #hipErrorMemoryAllocation
  !>  
  interface hipMallocMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipMallocMipmappedArray_orig(mipmappedArray,desc,extent,numLevels,flags) bind(c, name="cudaMallocMipmappedArray")
#else
    function hipMallocMipmappedArray_orig(mipmappedArray,desc,extent,numLevels,flags) bind(c, name="hipMallocMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMallocMipmappedArray_orig
#else
      integer(kind(hipSuccess)) :: hipMallocMipmappedArray_orig
#endif
      type(c_ptr) :: mipmappedArray
      type(c_ptr) :: desc
      type(c_ptr),value :: extent
      integer(kind=4),value :: numLevels
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Gets a mipmap level of a HIP mipmapped array
  !>  
  !>   @param[out] levelArray     - Returned mipmap level HIP array
  !>   @param[in]  mipmappedArray - HIP mipmapped array
  !>   @param[in]  level          - Mipmap level
  !>   
  !>   @return #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipGetMipmappedArrayLevel
#ifdef USE_CUDA_NAMES
    function hipGetMipmappedArrayLevel_orig(levelArray,mipmappedArray,level) bind(c, name="cudaGetMipmappedArrayLevel")
#else
    function hipGetMipmappedArrayLevel_orig(levelArray,mipmappedArray,level) bind(c, name="hipGetMipmappedArrayLevel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetMipmappedArrayLevel_orig
#else
      integer(kind(hipSuccess)) :: hipGetMipmappedArrayLevel_orig
#endif
      type(c_ptr) :: levelArray
      type(c_ptr),value :: mipmappedArray
      integer(kind=4),value :: level
    end function


  end interface
  !> 
  !>    @brief Copies memory for 2D arrays.
  !>    @param[in]   pCopy Parameters for the memory copy
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !>   hipMemcpyToSymbol, hipMemcpyAsync
  !> 
  interface hipMemcpyParam2D
#ifdef USE_CUDA_NAMES
    function hipMemcpyParam2D_orig(pCopy) bind(c, name="cudaMemcpyParam2D")
#else
    function hipMemcpyParam2D_orig(pCopy) bind(c, name="hipMemcpyParam2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyParam2D_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyParam2D_orig
#endif
      type(c_ptr) :: pCopy
    end function


  end interface
  !> 
  !>    @brief Copies memory for 2D arrays.
  !>    @param[in]   pCopy Parameters for the memory copy
  !>    @param[in]   stream Stream to use
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2D, hipMemcpyToArray, hipMemcpy2DToArray, hipMemcpyFromArray,
  !>   hipMemcpyToSymbol, hipMemcpyAsync
  !> 
  interface hipMemcpyParam2DAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyParam2DAsync_orig(pCopy,stream) bind(c, name="cudaMemcpyParam2DAsync")
#else
    function hipMemcpyParam2DAsync_orig(pCopy,stream) bind(c, name="hipMemcpyParam2DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyParam2DAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyParam2DAsync_orig
#endif
      type(c_ptr) :: pCopy
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   dst     Destination memory address
  !>    @param[in]   wOffset Destination starting X offset
  !>    @param[in]   hOffset Destination starting Y offset
  !>    @param[in]   src     Source memory address
  !>    @param[in]   spitch  Pitch of source memory
  !>    @param[in]   width   Width of matrix transfer (columns in bytes)
  !>    @param[in]   height  Height of matrix transfer (rows)
  !>    @param[in]   kind    Type of transfer
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpyToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpy2DToArray
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DToArray_orig(dst,wOffset,hOffset,src,spitch,width,height,myKind) bind(c, name="cudaMemcpy2DToArray")
#else
    function hipMemcpy2DToArray_orig(dst,wOffset,hOffset,src,spitch,width,height,myKind) bind(c, name="hipMemcpy2DToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2DToArray_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpy2DToArray_orig
#endif
      type(c_ptr) :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: spitch
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function


  end interface
  
  interface hipMemcpyToArray
#ifdef USE_CUDA_NAMES
    function hipMemcpyToArray_orig(dst,wOffset,hOffset,src,count,myKind) bind(c, name="cudaMemcpyToArray")
#else
    function hipMemcpyToArray_orig(dst,wOffset,hOffset,src,count,myKind) bind(c, name="hipMemcpyToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyToArray_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyToArray_orig
#endif
      type(c_ptr) :: dst
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      type(c_ptr),value :: src
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function


  end interface
  
  interface hipMemcpyFromArray
#ifdef USE_CUDA_NAMES
    function hipMemcpyFromArray_orig(dst,srcArray,wOffset,hOffset,count,myKind) bind(c, name="cudaMemcpyFromArray")
#else
    function hipMemcpyFromArray_orig(dst,srcArray,wOffset,hOffset,count,myKind) bind(c, name="hipMemcpyFromArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyFromArray_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyFromArray_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr),value :: srcArray
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: count
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   dst       Destination memory address
  !>    @param[in]   dpitch    Pitch of destination memory
  !>    @param[in]   src       Source memory address
  !>    @param[in]   wOffset   Source starting X offset
  !>    @param[in]   hOffset   Source starting Y offset
  !>    @param[in]   width     Width of matrix transfer (columns in bytes)
  !>    @param[in]   height    Height of matrix transfer (rows)
  !>    @param[in]   kind      Type of transfer
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpy2DFromArray
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArray_orig(dst,dpitch,src,wOffset,hOffset,width,height,myKind) bind(c, name="cudaMemcpy2DFromArray")
#else
    function hipMemcpy2DFromArray_orig(dst,dpitch,src,wOffset,hOffset,width,height,myKind) bind(c, name="hipMemcpy2DFromArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2DFromArray_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArray_orig
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device asynchronously.
  !>  
  !>    @param[in]   dst       Destination memory address
  !>    @param[in]   dpitch    Pitch of destination memory
  !>    @param[in]   src       Source memory address
  !>    @param[in]   wOffset   Source starting X offset
  !>    @param[in]   hOffset   Source starting Y offset
  !>    @param[in]   width     Width of matrix transfer (columns in bytes)
  !>    @param[in]   height    Height of matrix transfer (rows)
  !>    @param[in]   kind      Type of transfer
  !>    @param[in]   stream    Accelerator view which the copy is being enqueued
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpy2DFromArrayAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy2DFromArrayAsync_orig(dst,dpitch,src,wOffset,hOffset,width,height,myKind,stream) bind(c, name="cudaMemcpy2DFromArrayAsync")
#else
    function hipMemcpy2DFromArrayAsync_orig(dst,dpitch,src,wOffset,hOffset,width,height,myKind,stream) bind(c, name="hipMemcpy2DFromArrayAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy2DFromArrayAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpy2DFromArrayAsync_orig
#endif
      type(c_ptr),value :: dst
      integer(c_size_t),value :: dpitch
      type(c_ptr),value :: src
      integer(c_size_t),value :: wOffset
      integer(c_size_t),value :: hOffset
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(kind(hipMemcpyHostToHost)),value :: myKind
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   dst       Destination memory address
  !>    @param[in]   srcArray  Source array
  !>    @param[in]   srcoffset Offset in bytes of source array
  !>    @param[in]   count     Size of memory copy in bytes
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpyAtoH
#ifdef USE_CUDA_NAMES
    function hipMemcpyAtoH_orig(dst,srcArray,srcOffset,count) bind(c, name="cudaMemcpyAtoH")
#else
    function hipMemcpyAtoH_orig(dst,srcArray,srcOffset,count) bind(c, name="hipMemcpyAtoH")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyAtoH_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyAtoH_orig
#endif
      type(c_ptr),value :: dst
      type(c_ptr) :: srcArray
      integer(c_size_t),value :: srcOffset
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   dstArray   Destination memory address
  !>    @param[in]   dstOffset  Offset in bytes of destination array
  !>    @param[in]   srcHost    Source host pointer
  !>    @param[in]   count      Size of memory copy in bytes
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpyHtoA
#ifdef USE_CUDA_NAMES
    function hipMemcpyHtoA_orig(dstArray,dstOffset,srcHost,count) bind(c, name="cudaMemcpyHtoA")
#else
    function hipMemcpyHtoA_orig(dstArray,dstOffset,srcHost,count) bind(c, name="hipMemcpyHtoA")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyHtoA_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyHtoA_orig
#endif
      type(c_ptr) :: dstArray
      integer(c_size_t),value :: dstOffset
      type(c_ptr),value :: srcHost
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   p   3D memory copy parameters
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpy3D
#ifdef USE_CUDA_NAMES
    function hipMemcpy3D_orig(p) bind(c, name="cudaMemcpy3D")
#else
    function hipMemcpy3D_orig(p) bind(c, name="hipMemcpy3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy3D_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpy3D_orig
#endif
      type(c_ptr) :: p
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device asynchronously.
  !>  
  !>    @param[in]   p        3D memory copy parameters
  !>    @param[in]   stream   Stream to use
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>   #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipMemcpy3DAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpy3DAsync_orig(p,stream) bind(c, name="cudaMemcpy3DAsync")
#else
    function hipMemcpy3DAsync_orig(p,stream) bind(c, name="hipMemcpy3DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpy3DAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpy3DAsync_orig
#endif
      type(c_ptr) :: p
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device.
  !>  
  !>    @param[in]   pCopy   3D memory copy parameters
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipDrvMemcpy3D
#ifdef USE_CUDA_NAMES
    function hipDrvMemcpy3D_orig(pCopy) bind(c, name="cudaDrvMemcpy3D")
#else
    function hipDrvMemcpy3D_orig(pCopy) bind(c, name="hipDrvMemcpy3D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDrvMemcpy3D_orig
#else
      integer(kind(hipSuccess)) :: hipDrvMemcpy3D_orig
#endif
      type(c_ptr) :: pCopy
    end function


  end interface
  !> 
  !>    @brief Copies data between host and device asynchronously.
  !>  
  !>    @param[in]   pCopy    3D memory copy parameters
  !>    @param[in]   stream   Stream to use
  !>    @return      #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidPitchValue,
  !>    #hipErrorInvalidDevicePointer, #hipErrorInvalidMemcpyDirection
  !>  
  !>    @see hipMemcpy, hipMemcpy2DToArray, hipMemcpy2D, hipMemcpyFromArray, hipMemcpyToSymbol,
  !>   hipMemcpyAsync
  !>  
  interface hipDrvMemcpy3DAsync
#ifdef USE_CUDA_NAMES
    function hipDrvMemcpy3DAsync_orig(pCopy,stream) bind(c, name="cudaDrvMemcpy3DAsync")
#else
    function hipDrvMemcpy3DAsync_orig(pCopy,stream) bind(c, name="hipDrvMemcpy3DAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDrvMemcpy3DAsync_orig
#else
      integer(kind(hipSuccess)) :: hipDrvMemcpy3DAsync_orig
#endif
      type(c_ptr) :: pCopy
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Determine if a device can access a peer's memory.
  !>  
  !>   @param [out] canAccessPeer Returns the peer access capability (0 or 1)
  !>   @param [in] device - device from where memory may be accessed.
  !>   @param [in] peerDevice - device where memory is physically located
  !>  
  !>   Returns "1" in @p canAccessPeer if the specified @p device is capable
  !>   of directly accessing memory physically located on peerDevice , or "0" if not.
  !>  
  !>   Returns "0" in @p canAccessPeer if deviceId == peerDeviceId, and both are valid devices : a
  !>   device is not a peer of itself.
  !>  
  !>   @returns #hipSuccess,
  !>   @returns #hipErrorInvalidDevice if deviceId or peerDeviceId are not valid devices
  !>  
  interface hipDeviceCanAccessPeer
#ifdef USE_CUDA_NAMES
    function hipDeviceCanAccessPeer_orig(canAccessPeer,deviceId,peerDeviceId) bind(c, name="cudaDeviceCanAccessPeer")
#else
    function hipDeviceCanAccessPeer_orig(canAccessPeer,deviceId,peerDeviceId) bind(c, name="hipDeviceCanAccessPeer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceCanAccessPeer_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceCanAccessPeer_orig
#endif
      type(c_ptr),value :: canAccessPeer
      integer(c_int),value :: deviceId
      integer(c_int),value :: peerDeviceId
    end function


  end interface
  !> 
  !>   @brief Enable direct access from current device's virtual address space to memory allocations
  !>   physically located on a peer device.
  !>  
  !>   Memory which already allocated on peer device will be mapped into the address space of the
  !>   current device.  In addition, all future memory allocations on peerDeviceId will be mapped into
  !>   the address space of the current device when the memory is allocated. The peer memory remains
  !>   accessible from the current device until a call to hipDeviceDisablePeerAccess or hipDeviceReset.
  !>  
  !>  
  !>   @param [in] peerDeviceId
  !>   @param [in] flags
  !>  
  !>   Returns #hipSuccess, #hipErrorInvalidDevice, #hipErrorInvalidValue,
  !>   @returns #hipErrorPeerAccessAlreadyEnabled if peer access is already enabled for this device.
  !>  
  interface hipDeviceEnablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipDeviceEnablePeerAccess_orig(peerDeviceId,flags) bind(c, name="cudaDeviceEnablePeerAccess")
#else
    function hipDeviceEnablePeerAccess_orig(peerDeviceId,flags) bind(c, name="hipDeviceEnablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceEnablePeerAccess_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceEnablePeerAccess_orig
#endif
      integer(c_int),value :: peerDeviceId
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Disable direct access from current device's virtual address space to memory allocations
  !>   physically located on a peer device.
  !>  
  !>   Returns hipErrorPeerAccessNotEnabled if direct access to memory on peerDevice has not yet been
  !>   enabled from the current device.
  !>  
  !>   @param [in] peerDeviceId
  !>  
  !>   @returns #hipSuccess, #hipErrorPeerAccessNotEnabled
  !>  
  interface hipDeviceDisablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipDeviceDisablePeerAccess_orig(peerDeviceId) bind(c, name="cudaDeviceDisablePeerAccess")
#else
    function hipDeviceDisablePeerAccess_orig(peerDeviceId) bind(c, name="hipDeviceDisablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceDisablePeerAccess_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceDisablePeerAccess_orig
#endif
      integer(c_int),value :: peerDeviceId
    end function


  end interface
  !> 
  !>   @brief Get information on memory allocations.
  !>  
  !>   @param [out] pbase - BAse pointer address
  !>   @param [out] psize - Size of allocation
  !>   @param [in]  dptr- Device Pointer
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidDevicePointer
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  
  interface hipMemGetAddressRange
#ifdef USE_CUDA_NAMES
    function hipMemGetAddressRange_orig(pbase,psize,dptr) bind(c, name="cudaMemGetAddressRange")
#else
    function hipMemGetAddressRange_orig(pbase,psize,dptr) bind(c, name="hipMemGetAddressRange")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemGetAddressRange_orig
#else
      integer(kind(hipSuccess)) :: hipMemGetAddressRange_orig
#endif
      type(c_ptr) :: pbase
      integer(c_size_t) :: psize
      type(c_ptr),value :: dptr
    end function


  end interface
  !> 
  !>   @brief Copies memory from one device to memory on another device.
  !>  
  !>   @param [out] dst - Destination device pointer.
  !>   @param [in] dstDeviceId - Destination device
  !>   @param [in] src - Source device pointer
  !>   @param [in] srcDeviceId - Source device
  !>   @param [in] sizeBytes - Size of memory copy in bytes
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
  !>  
  interface hipMemcpyPeer
#ifdef USE_CUDA_NAMES
    function hipMemcpyPeer_orig(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="cudaMemcpyPeer")
#else
    function hipMemcpyPeer_orig(dst,dstDeviceId,src,srcDeviceId,sizeBytes) bind(c, name="hipMemcpyPeer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyPeer_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyPeer_orig
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDeviceId
      integer(c_size_t),value :: sizeBytes
    end function


  end interface
  !> 
  !>   @brief Copies memory from one device to memory on another device.
  !>  
  !>   @param [out] dst - Destination device pointer.
  !>   @param [in] dstDevice - Destination device
  !>   @param [in] src - Source device pointer
  !>   @param [in] srcDevice - Source device
  !>   @param [in] sizeBytes - Size of memory copy in bytes
  !>   @param [in] stream - Stream identifier
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue, #hipErrorInvalidDevice
  !>  
  interface hipMemcpyPeerAsync
#ifdef USE_CUDA_NAMES
    function hipMemcpyPeerAsync_orig(dst,dstDeviceId,src,srcDevice,sizeBytes,stream) bind(c, name="cudaMemcpyPeerAsync")
#else
    function hipMemcpyPeerAsync_orig(dst,dstDeviceId,src,srcDevice,sizeBytes,stream) bind(c, name="hipMemcpyPeerAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemcpyPeerAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemcpyPeerAsync_orig
#endif
      type(c_ptr),value :: dst
      integer(c_int),value :: dstDeviceId
      type(c_ptr),value :: src
      integer(c_int),value :: srcDevice
      integer(c_size_t),value :: sizeBytes
      type(c_ptr),value :: stream
    end function


  end interface
  
  interface hipInit
#ifdef USE_CUDA_NAMES
    function hipInit_orig(flags) bind(c, name="cudaInit")
#else
    function hipInit_orig(flags) bind(c, name="hipInit")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipInit_orig
#else
      integer(kind(hipSuccess)) :: hipInit_orig
#endif
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipCtxCreate
#ifdef USE_CUDA_NAMES
    function hipCtxCreate_orig(ctx,flags,device) bind(c, name="cudaCtxCreate")
#else
    function hipCtxCreate_orig(ctx,flags,device) bind(c, name="hipCtxCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxCreate_orig
#else
      integer(kind(hipSuccess)) :: hipCtxCreate_orig
#endif
      type(c_ptr) :: ctx
      integer(kind=4),value :: flags
      integer(c_int),value :: device
    end function


  end interface
  
  interface hipCtxDestroy
#ifdef USE_CUDA_NAMES
    function hipCtxDestroy_orig(ctx) bind(c, name="cudaCtxDestroy")
#else
    function hipCtxDestroy_orig(ctx) bind(c, name="hipCtxDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxDestroy_orig
#else
      integer(kind(hipSuccess)) :: hipCtxDestroy_orig
#endif
      type(c_ptr),value :: ctx
    end function


  end interface
  
  interface hipCtxPopCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxPopCurrent_orig(ctx) bind(c, name="cudaCtxPopCurrent")
#else
    function hipCtxPopCurrent_orig(ctx) bind(c, name="hipCtxPopCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxPopCurrent_orig
#else
      integer(kind(hipSuccess)) :: hipCtxPopCurrent_orig
#endif
      type(c_ptr) :: ctx
    end function


  end interface
  
  interface hipCtxPushCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxPushCurrent_orig(ctx) bind(c, name="cudaCtxPushCurrent")
#else
    function hipCtxPushCurrent_orig(ctx) bind(c, name="hipCtxPushCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxPushCurrent_orig
#else
      integer(kind(hipSuccess)) :: hipCtxPushCurrent_orig
#endif
      type(c_ptr),value :: ctx
    end function


  end interface
  
  interface hipCtxSetCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxSetCurrent_orig(ctx) bind(c, name="cudaCtxSetCurrent")
#else
    function hipCtxSetCurrent_orig(ctx) bind(c, name="hipCtxSetCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetCurrent_orig
#else
      integer(kind(hipSuccess)) :: hipCtxSetCurrent_orig
#endif
      type(c_ptr),value :: ctx
    end function


  end interface
  
  interface hipCtxGetCurrent
#ifdef USE_CUDA_NAMES
    function hipCtxGetCurrent_orig(ctx) bind(c, name="cudaCtxGetCurrent")
#else
    function hipCtxGetCurrent_orig(ctx) bind(c, name="hipCtxGetCurrent")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetCurrent_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetCurrent_orig
#endif
      type(c_ptr) :: ctx
    end function


  end interface
  
  interface hipCtxGetDevice
#ifdef USE_CUDA_NAMES
    function hipCtxGetDevice_orig(device) bind(c, name="cudaCtxGetDevice")
#else
    function hipCtxGetDevice_orig(device) bind(c, name="hipCtxGetDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetDevice_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetDevice_orig
#endif
      integer(c_int) :: device
    end function


  end interface
  
  interface hipCtxGetApiVersion
#ifdef USE_CUDA_NAMES
    function hipCtxGetApiVersion_orig(ctx,apiVersion) bind(c, name="cudaCtxGetApiVersion")
#else
    function hipCtxGetApiVersion_orig(ctx,apiVersion) bind(c, name="hipCtxGetApiVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetApiVersion_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetApiVersion_orig
#endif
      type(c_ptr),value :: ctx
      type(c_ptr),value :: apiVersion
    end function


  end interface
  
  interface hipCtxGetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipCtxGetCacheConfig_orig(cacheConfig) bind(c, name="cudaCtxGetCacheConfig")
#else
    function hipCtxGetCacheConfig_orig(cacheConfig) bind(c, name="hipCtxGetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetCacheConfig_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetCacheConfig_orig
#endif
      type(c_ptr),value :: cacheConfig
    end function


  end interface
  
  interface hipCtxSetCacheConfig
#ifdef USE_CUDA_NAMES
    function hipCtxSetCacheConfig_orig(cacheConfig) bind(c, name="cudaCtxSetCacheConfig")
#else
    function hipCtxSetCacheConfig_orig(cacheConfig) bind(c, name="hipCtxSetCacheConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetCacheConfig_orig
#else
      integer(kind(hipSuccess)) :: hipCtxSetCacheConfig_orig
#endif
      integer(kind(hipFuncCachePreferNone)),value :: cacheConfig
    end function


  end interface
  
  interface hipCtxSetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipCtxSetSharedMemConfig_orig(config) bind(c, name="cudaCtxSetSharedMemConfig")
#else
    function hipCtxSetSharedMemConfig_orig(config) bind(c, name="hipCtxSetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSetSharedMemConfig_orig
#else
      integer(kind(hipSuccess)) :: hipCtxSetSharedMemConfig_orig
#endif
      integer(kind(hipSharedMemBankSizeDefault)),value :: config
    end function


  end interface
  
  interface hipCtxGetSharedMemConfig
#ifdef USE_CUDA_NAMES
    function hipCtxGetSharedMemConfig_orig(pConfig) bind(c, name="cudaCtxGetSharedMemConfig")
#else
    function hipCtxGetSharedMemConfig_orig(pConfig) bind(c, name="hipCtxGetSharedMemConfig")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetSharedMemConfig_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetSharedMemConfig_orig
#endif
      type(c_ptr),value :: pConfig
    end function


  end interface
  
  interface hipCtxSynchronize
#ifdef USE_CUDA_NAMES
    function hipCtxSynchronize_orig() bind(c, name="cudaCtxSynchronize")
#else
    function hipCtxSynchronize_orig() bind(c, name="hipCtxSynchronize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxSynchronize_orig
#else
      integer(kind(hipSuccess)) :: hipCtxSynchronize_orig
#endif
    end function


  end interface
  
  interface hipCtxGetFlags
#ifdef USE_CUDA_NAMES
    function hipCtxGetFlags_orig(flags) bind(c, name="cudaCtxGetFlags")
#else
    function hipCtxGetFlags_orig(flags) bind(c, name="hipCtxGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxGetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipCtxGetFlags_orig
#endif
      type(c_ptr),value :: flags
    end function


  end interface
  
  interface hipCtxEnablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipCtxEnablePeerAccess_orig(peerCtx,flags) bind(c, name="cudaCtxEnablePeerAccess")
#else
    function hipCtxEnablePeerAccess_orig(peerCtx,flags) bind(c, name="hipCtxEnablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxEnablePeerAccess_orig
#else
      integer(kind(hipSuccess)) :: hipCtxEnablePeerAccess_orig
#endif
      type(c_ptr),value :: peerCtx
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipCtxDisablePeerAccess
#ifdef USE_CUDA_NAMES
    function hipCtxDisablePeerAccess_orig(peerCtx) bind(c, name="cudaCtxDisablePeerAccess")
#else
    function hipCtxDisablePeerAccess_orig(peerCtx) bind(c, name="hipCtxDisablePeerAccess")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCtxDisablePeerAccess_orig
#else
      integer(kind(hipSuccess)) :: hipCtxDisablePeerAccess_orig
#endif
      type(c_ptr),value :: peerCtx
    end function


  end interface
  !> 
  !>   @brief Get the state of the primary context.
  !>  
  !>   @param [in] Device to get primary context flags for
  !>   @param [out] Pointer to store flags
  !>   @param [out] Pointer to store context state; 0 = inactive, 1 = active
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  
  interface hipDevicePrimaryCtxGetState
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxGetState_orig(dev,flags,active) bind(c, name="cudaDevicePrimaryCtxGetState")
#else
    function hipDevicePrimaryCtxGetState_orig(dev,flags,active) bind(c, name="hipDevicePrimaryCtxGetState")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxGetState_orig
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxGetState_orig
#endif
      integer(c_int),value :: dev
      type(c_ptr),value :: flags
      type(c_ptr),value :: active
    end function


  end interface
  !> 
  !>   @brief Release the primary context on the GPU.
  !>  
  !>   @param [in] Device which primary context is released
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>   @warning This function return #hipSuccess though doesn't release the primaryCtx by design on
  !>   HIPHCC path.
  !>  
  interface hipDevicePrimaryCtxRelease
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxRelease_orig(dev) bind(c, name="cudaDevicePrimaryCtxRelease")
#else
    function hipDevicePrimaryCtxRelease_orig(dev) bind(c, name="hipDevicePrimaryCtxRelease")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxRelease_orig
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRelease_orig
#endif
      integer(c_int),value :: dev
    end function


  end interface
  !> 
  !>   @brief Retain the primary context on the GPU.
  !>  
  !>   @param [out] Returned context handle of the new context
  !>   @param [in] Device which primary context is released
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  
  interface hipDevicePrimaryCtxRetain
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxRetain_orig(pctx,dev) bind(c, name="cudaDevicePrimaryCtxRetain")
#else
    function hipDevicePrimaryCtxRetain_orig(pctx,dev) bind(c, name="hipDevicePrimaryCtxRetain")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxRetain_orig
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxRetain_orig
#endif
      type(c_ptr) :: pctx
      integer(c_int),value :: dev
    end function


  end interface
  !> 
  !>   @brief Resets the primary context on the GPU.
  !>  
  !>   @param [in] Device which primary context is reset
  !>  
  !>   @returns #hipSuccess
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  
  interface hipDevicePrimaryCtxReset
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxReset_orig(dev) bind(c, name="cudaDevicePrimaryCtxReset")
#else
    function hipDevicePrimaryCtxReset_orig(dev) bind(c, name="hipDevicePrimaryCtxReset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxReset_orig
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxReset_orig
#endif
      integer(c_int),value :: dev
    end function


  end interface
  !> 
  !>   @brief Set flags for the primary context.
  !>  
  !>   @param [in] Device for which the primary context flags are set
  !>   @param [in] New flags for the device
  !>  
  !>   @returns #hipSuccess, #hipErrorContextAlreadyInUse
  !>  
  !>   @see hipCtxCreate, hipCtxDestroy, hipCtxGetFlags, hipCtxPopCurrent, hipCtxGetCurrent,
  !>   hipCtxSetCurrent, hipCtxPushCurrent, hipCtxSetCacheConfig, hipCtxSynchronize, hipCtxGetDevice
  !>  
  interface hipDevicePrimaryCtxSetFlags
#ifdef USE_CUDA_NAMES
    function hipDevicePrimaryCtxSetFlags_orig(dev,flags) bind(c, name="cudaDevicePrimaryCtxSetFlags")
#else
    function hipDevicePrimaryCtxSetFlags_orig(dev,flags) bind(c, name="hipDevicePrimaryCtxSetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDevicePrimaryCtxSetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipDevicePrimaryCtxSetFlags_orig
#endif
      integer(c_int),value :: dev
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Returns a handle to a compute device
  !>   @param [out] device
  !>   @param [in] ordinal
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceGet
#ifdef USE_CUDA_NAMES
    function hipDeviceGet_orig(device,ordinal) bind(c, name="cudaDeviceGet")
#else
    function hipDeviceGet_orig(device,ordinal) bind(c, name="hipDeviceGet")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGet_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGet_orig
#endif
      integer(c_int) :: device
      integer(c_int),value :: ordinal
    end function


  end interface
  !> 
  !>   @brief Returns the compute capability of the device
  !>   @param [out] major
  !>   @param [out] minor
  !>   @param [in] device
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceComputeCapability
#ifdef USE_CUDA_NAMES
    function hipDeviceComputeCapability_orig(major,minor,device) bind(c, name="cudaDeviceComputeCapability")
#else
    function hipDeviceComputeCapability_orig(major,minor,device) bind(c, name="hipDeviceComputeCapability")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceComputeCapability_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceComputeCapability_orig
#endif
      type(c_ptr),value :: major
      type(c_ptr),value :: minor
      integer(c_int),value :: device
    end function


  end interface
  !> 
  !>   @brief Returns an identifer string for the device.
  !>   @param [out] name
  !>   @param [in] len
  !>   @param [in] device
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceGetName
#ifdef USE_CUDA_NAMES
    function hipDeviceGetName_orig(name,len,device) bind(c, name="cudaDeviceGetName")
#else
    function hipDeviceGetName_orig(name,len,device) bind(c, name="hipDeviceGetName")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetName_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetName_orig
#endif
      type(c_ptr),value :: name
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function


  end interface
  !> 
  !>   @brief Returns a value for attr of link between two devices
  !>   @param [out] value
  !>   @param [in] attr
  !>   @param [in] srcDevice
  !>   @param [in] dstDevice
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceGetP2PAttribute
#ifdef USE_CUDA_NAMES
    function hipDeviceGetP2PAttribute_orig(myValue,attr,srcDevice,dstDevice) bind(c, name="cudaDeviceGetP2PAttribute")
#else
    function hipDeviceGetP2PAttribute_orig(myValue,attr,srcDevice,dstDevice) bind(c, name="hipDeviceGetP2PAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetP2PAttribute_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetP2PAttribute_orig
#endif
      type(c_ptr),value :: myValue
      integer(kind(hipDevP2PAttrPerformanceRank)),value :: attr
      integer(c_int),value :: srcDevice
      integer(c_int),value :: dstDevice
    end function


  end interface
  !> 
  !>   @brief Returns a PCI Bus Id string for the device, overloaded to take int device ID.
  !>   @param [out] pciBusId
  !>   @param [in] len
  !>   @param [in] device
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceGetPCIBusId
#ifdef USE_CUDA_NAMES
    function hipDeviceGetPCIBusId_orig(pciBusId,len,device) bind(c, name="cudaDeviceGetPCIBusId")
#else
    function hipDeviceGetPCIBusId_orig(pciBusId,len,device) bind(c, name="hipDeviceGetPCIBusId")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetPCIBusId_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetPCIBusId_orig
#endif
      type(c_ptr),value :: pciBusId
      integer(c_int),value :: len
      integer(c_int),value :: device
    end function


  end interface
  !> 
  !>   @brief Returns a handle to a compute device.
  !>   @param [out] device handle
  !>   @param [in] PCI Bus ID
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice, #hipErrorInvalidValue
  !>  
  interface hipDeviceGetByPCIBusId
#ifdef USE_CUDA_NAMES
    function hipDeviceGetByPCIBusId_orig(device,pciBusId) bind(c, name="cudaDeviceGetByPCIBusId")
#else
    function hipDeviceGetByPCIBusId_orig(device,pciBusId) bind(c, name="hipDeviceGetByPCIBusId")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceGetByPCIBusId_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceGetByPCIBusId_orig
#endif
      integer(c_int) :: device
      type(c_ptr),value :: pciBusId
    end function


  end interface
  !> 
  !>   @brief Returns the total amount of memory on the device.
  !>   @param [out] bytes
  !>   @param [in] device
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidDevice
  !>  
  interface hipDeviceTotalMem
#ifdef USE_CUDA_NAMES
    function hipDeviceTotalMem_orig(bytes,device) bind(c, name="cudaDeviceTotalMem")
#else
    function hipDeviceTotalMem_orig(bytes,device) bind(c, name="hipDeviceTotalMem")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDeviceTotalMem_orig
#else
      integer(kind(hipSuccess)) :: hipDeviceTotalMem_orig
#endif
      integer(c_size_t) :: bytes
      integer(c_int),value :: device
    end function


  end interface
  !> 
  !>   @brief Returns the approximate HIP driver version.
  !>  
  !>   @param [out] driverVersion
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidValue
  !>  
  !>   @warning The HIP feature set does not correspond to an exact CUDA SDK driver revision.
  !>   This function always set driverVersion to 4 as an approximation though HIP supports
  !>   some features which were introduced in later CUDA SDK revisions.
  !>   HIP apps code should not rely on the driver revision number here and should
  !>   use arch feature flags to test device capabilities or conditional compilation.
  !>  
  !>   @see hipRuntimeGetVersion
  !>  
  interface hipDriverGetVersion
#ifdef USE_CUDA_NAMES
    function hipDriverGetVersion_orig(driverVersion) bind(c, name="cudaDriverGetVersion")
#else
    function hipDriverGetVersion_orig(driverVersion) bind(c, name="hipDriverGetVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDriverGetVersion_orig
#else
      integer(kind(hipSuccess)) :: hipDriverGetVersion_orig
#endif
      type(c_ptr),value :: driverVersion
    end function


  end interface
  !> 
  !>   @brief Returns the approximate HIP Runtime version.
  !>  
  !>   @param [out] runtimeVersion
  !>  
  !>   @returns #hipSuccess, #hipErrorInavlidValue
  !>  
  !>   @warning On HIPHCC path this function returns HIP runtime patch version however on
  !>   HIPNVCC path this function return CUDA runtime version.
  !>  
  !>   @see hipDriverGetVersion
  !>  
  interface hipRuntimeGetVersion
#ifdef USE_CUDA_NAMES
    function hipRuntimeGetVersion_orig(runtimeVersion) bind(c, name="cudaRuntimeGetVersion")
#else
    function hipRuntimeGetVersion_orig(runtimeVersion) bind(c, name="hipRuntimeGetVersion")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRuntimeGetVersion_orig
#else
      integer(kind(hipSuccess)) :: hipRuntimeGetVersion_orig
#endif
      type(c_ptr),value :: runtimeVersion
    end function


  end interface
  !> 
  !>   @brief Loads code object from file into a hipModule_t
  !>  
  !>   @param [in] fname
  !>   @param [out] module
  !>  
  !>   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidContext, hipErrorFileNotFound,
  !>   hipErrorOutOfMemory, hipErrorSharedObjectInitFailed, hipErrorNotInitialized
  !>  
  !>  
  !>  
  interface hipModuleLoad
#ifdef USE_CUDA_NAMES
    function hipModuleLoad_orig(myModule,fname) bind(c, name="cudaModuleLoad")
#else
    function hipModuleLoad_orig(myModule,fname) bind(c, name="hipModuleLoad")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoad_orig
#else
      integer(kind(hipSuccess)) :: hipModuleLoad_orig
#endif
      type(c_ptr) :: myModule
      type(c_ptr),value :: fname
    end function


  end interface
  !> 
  !>   @brief Frees the module
  !>  
  !>   @param [in] module
  !>  
  !>   @returns hipSuccess, hipInvalidValue
  !>   module is freed and the code objects associated with it are destroyed
  !>  
  !>  
  interface hipModuleUnload
#ifdef USE_CUDA_NAMES
    function hipModuleUnload_orig(myModule) bind(c, name="cudaModuleUnload")
#else
    function hipModuleUnload_orig(myModule) bind(c, name="hipModuleUnload")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleUnload_orig
#else
      integer(kind(hipSuccess)) :: hipModuleUnload_orig
#endif
      type(c_ptr),value :: myModule
    end function


  end interface
  !> 
  !>   @brief Function with kname will be extracted if present in module
  !>  
  !>   @param [in] module
  !>   @param [in] kname
  !>   @param [out] function
  !>  
  !>   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidContext, hipErrorNotInitialized,
  !>   hipErrorNotFound,
  !>  
  interface hipModuleGetFunction
#ifdef USE_CUDA_NAMES
    function hipModuleGetFunction_orig(myFunction,myModule,kname) bind(c, name="cudaModuleGetFunction")
#else
    function hipModuleGetFunction_orig(myFunction,myModule,kname) bind(c, name="hipModuleGetFunction")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetFunction_orig
#else
      integer(kind(hipSuccess)) :: hipModuleGetFunction_orig
#endif
      type(c_ptr) :: myFunction
      type(c_ptr),value :: myModule
      type(c_ptr),value :: kname
    end function


  end interface
  !> 
  !>   @brief Find out attributes for a given function.
  !>  
  !>   @param [out] attr
  !>   @param [in] func
  !>  
  !>   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidDeviceFunction
  !>  
  interface hipFuncGetAttributes
#ifdef USE_CUDA_NAMES
    function hipFuncGetAttributes_orig(attr,func) bind(c, name="cudaFuncGetAttributes")
#else
    function hipFuncGetAttributes_orig(attr,func) bind(c, name="hipFuncGetAttributes")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncGetAttributes_orig
#else
      integer(kind(hipSuccess)) :: hipFuncGetAttributes_orig
#endif
      type(c_ptr) :: attr
      type(c_ptr),value :: func
    end function


  end interface
  !> 
  !>   @brief Find out a specific attribute for a given function.
  !>  
  !>   @param [out] value
  !>   @param [in]  attrib
  !>   @param [in]  hfunc
  !>  
  !>   @returns hipSuccess, hipErrorInvalidValue, hipErrorInvalidDeviceFunction
  !>  
  interface hipFuncGetAttribute
#ifdef USE_CUDA_NAMES
    function hipFuncGetAttribute_orig(myValue,attrib,hfunc) bind(c, name="cudaFuncGetAttribute")
#else
    function hipFuncGetAttribute_orig(myValue,attrib,hfunc) bind(c, name="hipFuncGetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFuncGetAttribute_orig
#else
      integer(kind(hipSuccess)) :: hipFuncGetAttribute_orig
#endif
      type(c_ptr),value :: myValue
      integer(kind(HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK)),value :: attrib
      type(c_ptr),value :: hfunc
    end function


  end interface
  
  interface hipModuleGetTexRef
#ifdef USE_CUDA_NAMES
    function hipModuleGetTexRef_orig(texRef,hmod,name) bind(c, name="cudaModuleGetTexRef")
#else
    function hipModuleGetTexRef_orig(texRef,hmod,name) bind(c, name="hipModuleGetTexRef")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleGetTexRef_orig
#else
      integer(kind(hipSuccess)) :: hipModuleGetTexRef_orig
#endif
      type(c_ptr) :: texRef
      type(c_ptr),value :: hmod
      type(c_ptr),value :: name
    end function


  end interface
  !> 
  !>   @brief builds module from code object which resides in host memory. Image is pointer to that
  !>   location.
  !>  
  !>   @param [in] image
  !>   @param [out] module
  !>  
  !>   @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  !>  
  interface hipModuleLoadData
#ifdef USE_CUDA_NAMES
    function hipModuleLoadData_orig(myModule,image) bind(c, name="cudaModuleLoadData")
#else
    function hipModuleLoadData_orig(myModule,image) bind(c, name="hipModuleLoadData")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoadData_orig
#else
      integer(kind(hipSuccess)) :: hipModuleLoadData_orig
#endif
      type(c_ptr) :: myModule
      type(c_ptr),value :: image
    end function


  end interface
  !> 
  !>   @brief builds module from code object which resides in host memory. Image is pointer to that
  !>   location. Options are not used. hipModuleLoadData is called.
  !>  
  !>   @param [in] image
  !>   @param [out] module
  !>   @param [in] number of options
  !>   @param [in] options for JIT
  !>   @param [in] option values for JIT
  !>  
  !>   @returns hipSuccess, hipErrorNotInitialized, hipErrorOutOfMemory, hipErrorNotInitialized
  !>  
  interface hipModuleLoadDataEx
#ifdef USE_CUDA_NAMES
    function hipModuleLoadDataEx_orig(myModule,image,numOptions,options,optionValues) bind(c, name="cudaModuleLoadDataEx")
#else
    function hipModuleLoadDataEx_orig(myModule,image,numOptions,options,optionValues) bind(c, name="hipModuleLoadDataEx")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLoadDataEx_orig
#else
      integer(kind(hipSuccess)) :: hipModuleLoadDataEx_orig
#endif
      type(c_ptr) :: myModule
      type(c_ptr),value :: image
      integer(kind=4),value :: numOptions
      type(c_ptr),value :: options
      type(c_ptr) :: optionValues
    end function


  end interface
  !> 
  !>   @brief launches kernel f with launch parameters and shared memory on stream with arguments passed
  !>   to kernelparams or extra
  !>  
  !>   @param [in] f         Kernel to launch.
  !>   @param [in] gridDimX  X grid dimension specified as multiple of blockDimX.
  !>   @param [in] gridDimY  Y grid dimension specified as multiple of blockDimY.
  !>   @param [in] gridDimZ  Z grid dimension specified as multiple of blockDimZ.
  !>   @param [in] blockDimX X block dimensions specified in work-items
  !>   @param [in] blockDimY Y grid dimension specified in work-items
  !>   @param [in] blockDimZ Z grid dimension specified in work-items
  !>   @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel.  The
  !>   kernel can access this with HIP_DYNAMIC_SHARED.
  !>   @param [in] stream    Stream where the kernel should be dispatched.  May be 0, in which case th
  !>   default stream is used with associated synchronization rules.
  !>   @param [in] kernelParams
  !>   @param [in] extra     Pointer to kernel arguments.   These are passed directly to the kernel and
  !>   must be in the memory layout and alignment expected by the kernel.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !>  
  !>   @warning kernellParams argument is not yet implemented in HIP. Please use extra instead. Please
  !>   refer to hip_porting_driver_api.md for sample usage.
  !>  
  interface hipModuleLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipModuleLaunchKernel_orig(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ,sharedMemBytes,stream,kernelParams,extra) bind(c, name="cudaModuleLaunchKernel")
#else
    function hipModuleLaunchKernel_orig(f,gridDimX,gridDimY,gridDimZ,blockDimX,blockDimY,blockDimZ,sharedMemBytes,stream,kernelParams,extra) bind(c, name="hipModuleLaunchKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleLaunchKernel_orig
#else
      integer(kind(hipSuccess)) :: hipModuleLaunchKernel_orig
#endif
      type(c_ptr),value :: f
      integer(kind=4),value :: gridDimX
      integer(kind=4),value :: gridDimY
      integer(kind=4),value :: gridDimZ
      integer(kind=4),value :: blockDimX
      integer(kind=4),value :: blockDimY
      integer(kind=4),value :: blockDimZ
      integer(kind=4),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr) :: kernelParams
      type(c_ptr) :: extra
    end function


  end interface
  !> 
  !>   @brief launches kernel f with launch parameters and shared memory on stream with arguments passed
  !>   to kernelparams or extra, where thread blocks can cooperate and synchronize as they execute
  !>  
  !>   @param [in] f         Kernel to launch.
  !>   @param [in] gridDim   Grid dimensions specified as multiple of blockDim.
  !>   @param [in] blockDim  Block dimensions specified in work-items
  !>   @param [in] kernelParams A list of kernel arguments
  !>   @param [in] sharedMemBytes Amount of dynamic shared memory to allocate for this kernel.  The
  !>   kernel can access this with HIP_DYNAMIC_SHARED.
  !>   @param [in] stream    Stream where the kernel should be dispatched.  May be 0, in which case th
  !>   default stream is used with associated synchronization rules.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue, hipErrorCooperativeLaunchTooLarge
  !>  
  interface hipLaunchCooperativeKernel
#ifdef USE_CUDA_NAMES
    function hipLaunchCooperativeKernel_orig(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) bind(c, name="cudaLaunchCooperativeKernel")
#else
    function hipLaunchCooperativeKernel_orig(f,gridDim,blockDimX,kernelParams,sharedMemBytes,stream) bind(c, name="hipLaunchCooperativeKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchCooperativeKernel_orig
#else
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernel_orig
#endif
      type(c_ptr),value :: f
      type(dim3),value :: gridDim
      type(dim3),value :: blockDimX
      type(c_ptr) :: kernelParams
      integer(kind=4),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Launches kernels on multiple devices where thread blocks can cooperate and
  !>   synchronize as they execute.
  !>  
  !>   @param [in] hipLaunchParams          List of launch parameters, one per device.
  !>   @param [in] numDevices               Size of the launchParamsList array.
  !>   @param [in] flags                    Flags to control launch behavior.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue, hipErrorCooperativeLaunchTooLarge
  !>  
  interface hipLaunchCooperativeKernelMultiDevice
#ifdef USE_CUDA_NAMES
    function hipLaunchCooperativeKernelMultiDevice_orig(launchParamsList,numDevices,flags) bind(c, name="cudaLaunchCooperativeKernelMultiDevice")
#else
    function hipLaunchCooperativeKernelMultiDevice_orig(launchParamsList,numDevices,flags) bind(c, name="hipLaunchCooperativeKernelMultiDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchCooperativeKernelMultiDevice_orig
#else
      integer(kind(hipSuccess)) :: hipLaunchCooperativeKernelMultiDevice_orig
#endif
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipModuleOccupancyMaxPotentialBlockSize
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxPotentialBlockSize_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="cudaModuleOccupancyMaxPotentialBlockSize")
#else
    function hipModuleOccupancyMaxPotentialBlockSize_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipModuleOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize_orig
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSize_orig
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function


  end interface
  
  interface hipModuleOccupancyMaxPotentialBlockSizeWithFlags
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit,flags) bind(c, name="cudaModuleOccupancyMaxPotentialBlockSizeWithFlags")
#else
    function hipModuleOccupancyMaxPotentialBlockSizeWithFlags_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit,flags) bind(c, name="hipModuleOccupancyMaxPotentialBlockSizeWithFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags_orig
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxPotentialBlockSizeWithFlags_orig
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Returns occupancy for a device function.
  !>  
  !>   @param [out] numBlocks        Returned occupancy
  !>   @param [in]  func             Kernel function (hipFunction) for which occupancy is calulated
  !>   @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>  
  interface hipModuleOccupancyMaxActiveBlocksPerMultiprocessor
#ifdef USE_CUDA_NAMES
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_orig(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="cudaModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#else
    function hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_orig(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipModuleOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_orig
#else
      integer(kind(hipSuccess)) :: hipModuleOccupancyMaxActiveBlocksPerMultiprocessor_orig
#endif
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function


  end interface
  !> 
  !>   @brief Returns occupancy for a device function.
  !>  
  !>   @param [out] numBlocks        Returned occupancy
  !>   @param [in]  func             Kernel function for which occupancy is calulated
  !>   @param [in]  blockSize        Block size the kernel is intended to be launched with
  !>   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>  
  interface hipOccupancyMaxActiveBlocksPerMultiprocessor
#ifdef USE_CUDA_NAMES
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_orig(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="cudaOccupancyMaxActiveBlocksPerMultiprocessor")
#else
    function hipOccupancyMaxActiveBlocksPerMultiprocessor_orig(numBlocks,f,blockSize,dynSharedMemPerBlk) bind(c, name="hipOccupancyMaxActiveBlocksPerMultiprocessor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_orig
#else
      integer(kind(hipSuccess)) :: hipOccupancyMaxActiveBlocksPerMultiprocessor_orig
#endif
      type(c_ptr),value :: numBlocks
      type(c_ptr),value :: f
      integer(c_int),value :: blockSize
      integer(c_size_t),value :: dynSharedMemPerBlk
    end function


  end interface
  !> 
  !>   @brief determine the grid and block sizes to achieves maximum occupancy for a kernel
  !>  
  !>   @param [out] gridSize           minimum grid size for maximum potential occupancy
  !>   @param [out] blockSize          block size for maximum potential occupancy
  !>   @param [in]  f                  kernel function for which occupancy is calulated
  !>   @param [in]  dynSharedMemPerBlk dynamic shared memory usage (in bytes) intended for each block
  !>   @param [in]  blockSizeLimit     the maximum block size for the kernel, use 0 for no limit
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorInvalidValue
  !>  
  interface hipOccupancyMaxPotentialBlockSize
#ifdef USE_CUDA_NAMES
    function hipOccupancyMaxPotentialBlockSize_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="cudaOccupancyMaxPotentialBlockSize")
#else
    function hipOccupancyMaxPotentialBlockSize_orig(gridSize,blockSize,f,dynSharedMemPerBlk,blockSizeLimit) bind(c, name="hipOccupancyMaxPotentialBlockSize")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipOccupancyMaxPotentialBlockSize_orig
#else
      integer(kind(hipSuccess)) :: hipOccupancyMaxPotentialBlockSize_orig
#endif
      type(c_ptr),value :: gridSize
      type(c_ptr),value :: blockSize
      type(c_ptr),value :: f
      integer(c_size_t),value :: dynSharedMemPerBlk
      integer(c_int),value :: blockSizeLimit
    end function


  end interface
  !> 
  !>   @brief Launches kernels on multiple devices and guarantees all specified kernels are dispatched
  !>   on respective streams before enqueuing any other work on the specified streams from any other threads
  !>  
  !>  
  !>   @param [in] hipLaunchParams          List of launch parameters, one per device.
  !>   @param [in] numDevices               Size of the launchParamsList array.
  !>   @param [in] flags                    Flags to control launch behavior.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !>  
  interface hipExtLaunchMultiKernelMultiDevice
#ifdef USE_CUDA_NAMES
    function hipExtLaunchMultiKernelMultiDevice_orig(launchParamsList,numDevices,flags) bind(c, name="cudaExtLaunchMultiKernelMultiDevice")
#else
    function hipExtLaunchMultiKernelMultiDevice_orig(launchParamsList,numDevices,flags) bind(c, name="hipExtLaunchMultiKernelMultiDevice")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtLaunchMultiKernelMultiDevice_orig
#else
      integer(kind(hipSuccess)) :: hipExtLaunchMultiKernelMultiDevice_orig
#endif
      type(c_ptr),value :: launchParamsList
      integer(c_int),value :: numDevices
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipProfilerStart
#ifdef USE_CUDA_NAMES
    function hipProfilerStart_orig() bind(c, name="cudaProfilerStart")
#else
    function hipProfilerStart_orig() bind(c, name="hipProfilerStart")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipProfilerStart_orig
#else
      integer(kind(hipSuccess)) :: hipProfilerStart_orig
#endif
    end function


  end interface
  
  interface hipProfilerStop
#ifdef USE_CUDA_NAMES
    function hipProfilerStop_orig() bind(c, name="cudaProfilerStop")
#else
    function hipProfilerStop_orig() bind(c, name="hipProfilerStop")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipProfilerStop_orig
#else
      integer(kind(hipSuccess)) :: hipProfilerStop_orig
#endif
    end function


  end interface
  !> 
  !>   @brief Gets an interprocess memory handle for an existing device memory
  !>            allocation
  !>  
  !>   Takes a pointer to the base of an existing device memory allocation created
  !>   with hipMalloc and exports it for use in another process. This is a
  !>   lightweight operation and may be called multiple times on an allocation
  !>   without adverse effects.
  !>  
  !>   If a region of memory is freed with hipFree and a subsequent call
  !>   to hipMalloc returns memory with the same device address,
  !>   hipIpcGetMemHandle will return a unique handle for the
  !>   new memory.
  !>  
  !>   @param handle - Pointer to user allocated hipIpcMemHandle to return
  !>                      the handle in.
  !>   @param devPtr - Base pointer to previously allocated device memory
  !>  
  !>   @returns
  !>   hipSuccess,
  !>   hipErrorInvalidHandle,
  !>   hipErrorOutOfMemory,
  !>   hipErrorMapFailed,
  !>  
  !>  
  interface hipIpcGetMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcGetMemHandle_orig(handle,devPtr) bind(c, name="cudaIpcGetMemHandle")
#else
    function hipIpcGetMemHandle_orig(handle,devPtr) bind(c, name="hipIpcGetMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcGetMemHandle_orig
#else
      integer(kind(hipSuccess)) :: hipIpcGetMemHandle_orig
#endif
      type(c_ptr) :: handle
      type(c_ptr),value :: devPtr
    end function


  end interface
  !> 
  !>   @brief Opens an interprocess memory handle exported from another process
  !>            and returns a device pointer usable in the local process.
  !>  
  !>   Maps memory exported from another process with hipIpcGetMemHandle into
  !>   the current device address space. For contexts on different devices
  !>   hipIpcOpenMemHandle can attempt to enable peer access between the
  !>   devices as if the user called hipDeviceEnablePeerAccess. This behavior is
  !>   controlled by the hipIpcMemLazyEnablePeerAccess flag.
  !>   hipDeviceCanAccessPeer can determine if a mapping is possible.
  !>  
  !>   Contexts that may open hipIpcMemHandles are restricted in the following way.
  !>   hipIpcMemHandles from each device in a given process may only be opened
  !>   by one context per device per other process.
  !>  
  !>   Memory returned from hipIpcOpenMemHandle must be freed with
  !>   hipIpcCloseMemHandle.
  !>  
  !>   Calling hipFree on an exported memory region before calling
  !>   hipIpcCloseMemHandle in the importing context will result in undefined
  !>   behavior.
  !>  
  !>   @param devPtr - Returned device pointer
  !>   @param handle - hipIpcMemHandle to open
  !>   @param flags  - Flags for this operation. Must be specified as hipIpcMemLazyEnablePeerAccess
  !>  
  !>   @returns
  !>   hipSuccess,
  !>   hipErrorMapFailed,
  !>   hipErrorInvalidHandle,
  !>   hipErrorTooManyPeers
  !>  
  !>   @note No guarantees are made about the address returned in @p devPtr.
  !>   In particular, multiple processes may not receive the same address for the same @p handle.
  !>  
  !>  
  interface hipIpcOpenMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcOpenMemHandle_orig(devPtr,handle,flags) bind(c, name="cudaIpcOpenMemHandle")
#else
    function hipIpcOpenMemHandle_orig(devPtr,handle,flags) bind(c, name="hipIpcOpenMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcOpenMemHandle_orig
#else
      integer(kind(hipSuccess)) :: hipIpcOpenMemHandle_orig
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: handle
      integer(kind=4),value :: flags
    end function


  end interface
  !> 
  !>   @brief Close memory mapped with hipIpcOpenMemHandle
  !>  
  !>   Unmaps memory returnd by hipIpcOpenMemHandle. The original allocation
  !>   in the exporting process as well as imported mappings in other processes
  !>   will be unaffected.
  !>  
  !>   Any resources used to enable peer access will be freed if this is the
  !>   last mapping using them.
  !>  
  !>   @param devPtr - Device pointer returned by hipIpcOpenMemHandle
  !>  
  !>   @returns
  !>   hipSuccess,
  !>   hipErrorMapFailed,
  !>   hipErrorInvalidHandle,
  !>  
  !>  
  interface hipIpcCloseMemHandle
#ifdef USE_CUDA_NAMES
    function hipIpcCloseMemHandle_orig(devPtr) bind(c, name="cudaIpcCloseMemHandle")
#else
    function hipIpcCloseMemHandle_orig(devPtr) bind(c, name="hipIpcCloseMemHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcCloseMemHandle_orig
#else
      integer(kind(hipSuccess)) :: hipIpcCloseMemHandle_orig
#endif
      type(c_ptr),value :: devPtr
    end function


  end interface
  
  interface hipIpcGetEventHandle
#ifdef USE_CUDA_NAMES
    function hipIpcGetEventHandle_orig(handle,event) bind(c, name="cudaIpcGetEventHandle")
#else
    function hipIpcGetEventHandle_orig(handle,event) bind(c, name="hipIpcGetEventHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcGetEventHandle_orig
#else
      integer(kind(hipSuccess)) :: hipIpcGetEventHandle_orig
#endif
      type(c_ptr) :: handle
      type(c_ptr),value :: event
    end function


  end interface
  
  interface hipIpcOpenEventHandle
#ifdef USE_CUDA_NAMES
    function hipIpcOpenEventHandle_orig(event,handle) bind(c, name="cudaIpcOpenEventHandle")
#else
    function hipIpcOpenEventHandle_orig(event,handle) bind(c, name="hipIpcOpenEventHandle")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipIpcOpenEventHandle_orig
#else
      integer(kind(hipSuccess)) :: hipIpcOpenEventHandle_orig
#endif
      type(c_ptr) :: event
      type(c_ptr),value :: handle
    end function


  end interface
  !> 
  !>   @brief Configure a kernel launch.
  !>  
  !>   @param [in] gridDim   grid dimension specified as multiple of blockDim.
  !>   @param [in] blockDim  block dimensions specified in work-items
  !>   @param [in] sharedMem Amount of dynamic shared memory to allocate for this kernel.  The
  !>   kernel can access this with HIP_DYNAMIC_SHARED.
  !>   @param [in] stream    Stream where the kernel should be dispatched.  May be 0, in which case the
  !>   default stream is used with associated synchronization rules.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !>  
  !>  
  interface hipConfigureCall
#ifdef USE_CUDA_NAMES
    function hipConfigureCall_orig(gridDim,blockDim,sharedMem,stream) bind(c, name="cudaConfigureCall")
#else
    function hipConfigureCall_orig(gridDim,blockDim,sharedMem,stream) bind(c, name="hipConfigureCall")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipConfigureCall_orig
#else
      integer(kind(hipSuccess)) :: hipConfigureCall_orig
#endif
      type(dim3),value :: gridDim
      type(dim3),value :: blockDim
      integer(c_size_t),value :: sharedMem
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Set a kernel argument.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !>  
  !>   @param [in] arg    Pointer the argument in host memory.
  !>   @param [in] size   Size of the argument.
  !>   @param [in] offset Offset of the argument on the argument stack.
  !>  
  !>  
  interface hipSetupArgument
#ifdef USE_CUDA_NAMES
    function hipSetupArgument_orig(arg,mySize,offset) bind(c, name="cudaSetupArgument")
#else
    function hipSetupArgument_orig(arg,mySize,offset) bind(c, name="hipSetupArgument")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipSetupArgument_orig
#else
      integer(kind(hipSuccess)) :: hipSetupArgument_orig
#endif
      type(c_ptr),value :: arg
      integer(c_size_t),value :: mySize
      integer(c_size_t),value :: offset
    end function


  end interface
  !> 
  !>   @brief Launch a kernel.
  !>  
  !>   @param [in] func Kernel to launch.
  !>  
  !>   @returns hipSuccess, hipInvalidDevice, hipErrorNotInitialized, hipErrorInvalidValue
  !>  
  !>  
  interface hipLaunchByPtr
#ifdef USE_CUDA_NAMES
    function hipLaunchByPtr_orig(func) bind(c, name="cudaLaunchByPtr")
#else
    function hipLaunchByPtr_orig(func) bind(c, name="hipLaunchByPtr")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchByPtr_orig
#else
      integer(kind(hipSuccess)) :: hipLaunchByPtr_orig
#endif
      type(c_ptr),value :: func
    end function


  end interface
  !> 
  !>   @brief C compliant kernel launch API
  !>  
  !>   @param [in] function_address - kernel stub function pointer.
  !>   @param [in] numBlocks - number of blocks
  !>   @param [in] dimBlocks - dimension of a block
  !>   @param [in] args - kernel arguments
  !>   @param [in] sharedMemBytes - Amount of dynamic shared memory to allocate for this kernel.  The
  !>    Kernel can access this with HIP_DYNAMIC_SHARED.
  !>   @param [in] stream - Stream where the kernel should be dispatched.  May be 0, in which case th
  !>    default stream is used with associated synchronization rules.
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue, hipInvalidDevice
  !>  
  !>  
  interface hipLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipLaunchKernel_orig(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) bind(c, name="cudaLaunchKernel")
#else
    function hipLaunchKernel_orig(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream) bind(c, name="hipLaunchKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipLaunchKernel_orig
#else
      integer(kind(hipSuccess)) :: hipLaunchKernel_orig
#endif
      type(c_ptr),value :: function_address
      type(dim3),value :: numBlocks
      type(dim3),value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t),value :: sharedMemBytes
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Prefetches memory to the specified destination device using AMD HMM.
  !>  
  !>   @param [in] dev_ptr  pointer to be prefetched
  !>   @param [in] count    size in bytes for prefetching
  !>   @param [in] device   destination device to prefetch to
  !>   @param [in] stream   stream to enqueue prefetch operation
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipMemPrefetchAsync
#ifdef USE_CUDA_NAMES
    function hipMemPrefetchAsync_orig(dev_ptr,count,device,stream) bind(c, name="cudaMemPrefetchAsync")
#else
    function hipMemPrefetchAsync_orig(dev_ptr,count,device,stream) bind(c, name="hipMemPrefetchAsync")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemPrefetchAsync_orig
#else
      integer(kind(hipSuccess)) :: hipMemPrefetchAsync_orig
#endif
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      integer(c_int),value :: device
      type(c_ptr),value :: stream
    end function


  end interface
  !> 
  !>   @brief Advise about the usage of a given memory range to AMD HMM.
  !>  
  !>   @param [in] dev_ptr  pointer to memory to set the advice for
  !>   @param [in] count    size in bytes of the memory range
  !>   @param [in] advice   advice to be applied for the specified memory range
  !>   @param [in] device   device to apply the advice for
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipMemAdvise
#ifdef USE_CUDA_NAMES
    function hipMemAdvise_orig(dev_ptr,count,advice,device) bind(c, name="cudaMemAdvise")
#else
    function hipMemAdvise_orig(dev_ptr,count,advice,device) bind(c, name="hipMemAdvise")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemAdvise_orig
#else
      integer(kind(hipSuccess)) :: hipMemAdvise_orig
#endif
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
      integer(kind(hipMemAdviseSetReadMostly)),value :: advice
      integer(c_int),value :: device
    end function


  end interface
  !> 
  !>   @brief Query an attribute of a given memory range in AMD HMM.
  !>  
  !>   @param [inout] data   a pointer to a memory location where the result of each
  !>                          attribute query will be written to
  !>   @param [in] data_size  the size of data
  !>   @param [in] attribute  the attribute to query
  !>   @param [in] dev_ptr    start of the range to query
  !>   @param [in] count      size of the range to query
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipMemRangeGetAttribute
#ifdef USE_CUDA_NAMES
    function hipMemRangeGetAttribute_orig(myData,data_size,attribute,dev_ptr,count) bind(c, name="cudaMemRangeGetAttribute")
#else
    function hipMemRangeGetAttribute_orig(myData,data_size,attribute,dev_ptr,count) bind(c, name="hipMemRangeGetAttribute")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemRangeGetAttribute_orig
#else
      integer(kind(hipSuccess)) :: hipMemRangeGetAttribute_orig
#endif
      type(c_ptr),value :: myData
      integer(c_size_t),value :: data_size
      integer(kind(hipMemRangeAttributeReadMostly)),value :: attribute
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
    end function


  end interface
  !> 
  !>   @brief Query attributes of a given memory range in AMD HMM.
  !>  
  !>   @param [inout] data     a two-dimensional array containing pointers to memory locations
  !>                            where the result of each attribute query will be written to
  !>   @param [in] data_sizes   an array, containing the sizes of each result
  !>   @param [in] attributes   the attribute to query
  !>   @param [in] num_attributes  an array of attributes to query (numAttributes and the number
  !>                            of attributes in this array should match)
  !>   @param [in] dev_ptr      start of the range to query
  !>   @param [in] count        size of the range to query
  !>  
  !>   @returns #hipSuccess, #hipErrorInvalidValue
  !>  
  interface hipMemRangeGetAttributes
#ifdef USE_CUDA_NAMES
    function hipMemRangeGetAttributes_orig(myData,data_sizes,attributes,num_attributes,dev_ptr,count) bind(c, name="cudaMemRangeGetAttributes")
#else
    function hipMemRangeGetAttributes_orig(myData,data_sizes,attributes,num_attributes,dev_ptr,count) bind(c, name="hipMemRangeGetAttributes")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMemRangeGetAttributes_orig
#else
      integer(kind(hipSuccess)) :: hipMemRangeGetAttributes_orig
#endif
      type(c_ptr) :: myData
      type(c_ptr),value :: data_sizes
      type(c_ptr),value :: attributes
      integer(c_size_t),value :: num_attributes
      type(c_ptr),value :: dev_ptr
      integer(c_size_t),value :: count
    end function


  end interface
  
  interface hipExtLaunchKernel
#ifdef USE_CUDA_NAMES
    function hipExtLaunchKernel_orig(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream,startEvent,stopEvent,flags) bind(c, name="cudaExtLaunchKernel")
#else
    function hipExtLaunchKernel_orig(function_address,numBlocks,dimBlocks,args,sharedMemBytes,stream,startEvent,stopEvent,flags) bind(c, name="hipExtLaunchKernel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipExtLaunchKernel_orig
#else
      integer(kind(hipSuccess)) :: hipExtLaunchKernel_orig
#endif
      type(c_ptr),value :: function_address
      type(dim3),value :: numBlocks
      type(dim3),value :: dimBlocks
      type(c_ptr) :: args
      integer(c_size_t),value :: sharedMemBytes
      type(c_ptr),value :: stream
      type(c_ptr),value :: startEvent
      type(c_ptr),value :: stopEvent
      integer(c_int),value :: flags
    end function


  end interface
  
  interface hipBindTexture2D
#ifdef USE_CUDA_NAMES
    function hipBindTexture2D_orig(offset,tex,devPtr,desc,width,height,pitch) bind(c, name="cudaBindTexture2D")
#else
    function hipBindTexture2D_orig(offset,tex,devPtr,desc,width,height,pitch) bind(c, name="hipBindTexture2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTexture2D_orig
#else
      integer(kind(hipSuccess)) :: hipBindTexture2D_orig
#endif
      integer(c_size_t) :: offset
      type(c_ptr) :: tex
      type(c_ptr),value :: devPtr
      type(c_ptr) :: desc
      integer(c_size_t),value :: width
      integer(c_size_t),value :: height
      integer(c_size_t),value :: pitch
    end function


  end interface
  
  interface hipBindTextureToArray
#ifdef USE_CUDA_NAMES
    function hipBindTextureToArray_orig(tex,array,desc) bind(c, name="cudaBindTextureToArray")
#else
    function hipBindTextureToArray_orig(tex,array,desc) bind(c, name="hipBindTextureToArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTextureToArray_orig
#else
      integer(kind(hipSuccess)) :: hipBindTextureToArray_orig
#endif
      type(c_ptr) :: tex
      type(c_ptr),value :: array
      type(c_ptr) :: desc
    end function


  end interface
  
  interface hipBindTextureToMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipBindTextureToMipmappedArray_orig(tex,mipmappedArray,desc) bind(c, name="cudaBindTextureToMipmappedArray")
#else
    function hipBindTextureToMipmappedArray_orig(tex,mipmappedArray,desc) bind(c, name="hipBindTextureToMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipBindTextureToMipmappedArray_orig
#else
      integer(kind(hipSuccess)) :: hipBindTextureToMipmappedArray_orig
#endif
      type(c_ptr) :: tex
      type(c_ptr),value :: mipmappedArray
      type(c_ptr) :: desc
    end function


  end interface
  
  interface hipGetTextureAlignmentOffset
#ifdef USE_CUDA_NAMES
    function hipGetTextureAlignmentOffset_orig(offset,texref) bind(c, name="cudaGetTextureAlignmentOffset")
#else
    function hipGetTextureAlignmentOffset_orig(offset,texref) bind(c, name="hipGetTextureAlignmentOffset")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureAlignmentOffset_orig
#else
      integer(kind(hipSuccess)) :: hipGetTextureAlignmentOffset_orig
#endif
      integer(c_size_t) :: offset
      type(c_ptr) :: texref
    end function


  end interface
  
  interface hipGetTextureReference
#ifdef USE_CUDA_NAMES
    function hipGetTextureReference_orig(texref,symbol) bind(c, name="cudaGetTextureReference")
#else
    function hipGetTextureReference_orig(texref,symbol) bind(c, name="hipGetTextureReference")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureReference_orig
#else
      integer(kind(hipSuccess)) :: hipGetTextureReference_orig
#endif
      type(c_ptr) :: texref
      type(c_ptr),value :: symbol
    end function


  end interface
  
  interface hipUnbindTexture
#ifdef USE_CUDA_NAMES
    function hipUnbindTexture_orig(tex) bind(c, name="cudaUnbindTexture")
#else
    function hipUnbindTexture_orig(tex) bind(c, name="hipUnbindTexture")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipUnbindTexture_orig
#else
      integer(kind(hipSuccess)) :: hipUnbindTexture_orig
#endif
      type(c_ptr) :: tex
    end function


  end interface
  
  interface hipCreateTextureObject
#ifdef USE_CUDA_NAMES
    function hipCreateTextureObject_orig(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="cudaCreateTextureObject")
#else
    function hipCreateTextureObject_orig(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipCreateTextureObject")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipCreateTextureObject_orig
#else
      integer(kind(hipSuccess)) :: hipCreateTextureObject_orig
#endif
      type(c_ptr) :: pTexObject
      type(c_ptr) :: pResDesc
      type(c_ptr) :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function


  end interface
  
  interface hipDestroyTextureObject
#ifdef USE_CUDA_NAMES
    function hipDestroyTextureObject_orig(textureObject) bind(c, name="cudaDestroyTextureObject")
#else
    function hipDestroyTextureObject_orig(textureObject) bind(c, name="hipDestroyTextureObject")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipDestroyTextureObject_orig
#else
      integer(kind(hipSuccess)) :: hipDestroyTextureObject_orig
#endif
      type(c_ptr),value :: textureObject
    end function


  end interface
  
  interface hipGetChannelDesc
#ifdef USE_CUDA_NAMES
    function hipGetChannelDesc_orig(desc,array) bind(c, name="cudaGetChannelDesc")
#else
    function hipGetChannelDesc_orig(desc,array) bind(c, name="hipGetChannelDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetChannelDesc_orig
#else
      integer(kind(hipSuccess)) :: hipGetChannelDesc_orig
#endif
      type(c_ptr) :: desc
      type(c_ptr),value :: array
    end function


  end interface
  
  interface hipGetTextureObjectResourceDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectResourceDesc_orig(pResDesc,textureObject) bind(c, name="cudaGetTextureObjectResourceDesc")
#else
    function hipGetTextureObjectResourceDesc_orig(pResDesc,textureObject) bind(c, name="hipGetTextureObjectResourceDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectResourceDesc_orig
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceDesc_orig
#endif
      type(c_ptr) :: pResDesc
      type(c_ptr),value :: textureObject
    end function


  end interface
  
  interface hipGetTextureObjectResourceViewDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectResourceViewDesc_orig(pResViewDesc,textureObject) bind(c, name="cudaGetTextureObjectResourceViewDesc")
#else
    function hipGetTextureObjectResourceViewDesc_orig(pResViewDesc,textureObject) bind(c, name="hipGetTextureObjectResourceViewDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectResourceViewDesc_orig
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectResourceViewDesc_orig
#endif
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),value :: textureObject
    end function


  end interface
  
  interface hipGetTextureObjectTextureDesc
#ifdef USE_CUDA_NAMES
    function hipGetTextureObjectTextureDesc_orig(pTexDesc,textureObject) bind(c, name="cudaGetTextureObjectTextureDesc")
#else
    function hipGetTextureObjectTextureDesc_orig(pTexDesc,textureObject) bind(c, name="hipGetTextureObjectTextureDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetTextureObjectTextureDesc_orig
#else
      integer(kind(hipSuccess)) :: hipGetTextureObjectTextureDesc_orig
#endif
      type(c_ptr) :: pTexDesc
      type(c_ptr),value :: textureObject
    end function


  end interface
  
  interface hipTexRefGetAddress
#ifdef USE_CUDA_NAMES
    function hipTexRefGetAddress_orig(dev_ptr,texRef) bind(c, name="cudaTexRefGetAddress")
#else
    function hipTexRefGetAddress_orig(dev_ptr,texRef) bind(c, name="hipTexRefGetAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetAddress_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetAddress_orig
#endif
      type(c_ptr) :: dev_ptr
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetAddressMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetAddressMode_orig(pam,texRef,dim) bind(c, name="cudaTexRefGetAddressMode")
#else
    function hipTexRefGetAddressMode_orig(pam,texRef,dim) bind(c, name="hipTexRefGetAddressMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetAddressMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetAddressMode_orig
#endif
      type(c_ptr),value :: pam
      type(c_ptr) :: texRef
      integer(c_int),value :: dim
    end function


  end interface
  
  interface hipTexRefGetFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFilterMode_orig(pfm,texRef) bind(c, name="cudaTexRefGetFilterMode")
#else
    function hipTexRefGetFilterMode_orig(pfm,texRef) bind(c, name="hipTexRefGetFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFilterMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFilterMode_orig
#endif
      type(c_ptr),value :: pfm
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetFlags
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFlags_orig(pFlags,texRef) bind(c, name="cudaTexRefGetFlags")
#else
    function hipTexRefGetFlags_orig(pFlags,texRef) bind(c, name="hipTexRefGetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFlags_orig
#endif
      type(c_ptr),value :: pFlags
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetFormat
#ifdef USE_CUDA_NAMES
    function hipTexRefGetFormat_orig(pFormat,pNumChannels,texRef) bind(c, name="cudaTexRefGetFormat")
#else
    function hipTexRefGetFormat_orig(pFormat,pNumChannels,texRef) bind(c, name="hipTexRefGetFormat")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetFormat_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetFormat_orig
#endif
      type(c_ptr),value :: pFormat
      type(c_ptr),value :: pNumChannels
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetMaxAnisotropy
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMaxAnisotropy_orig(pmaxAnsio,texRef) bind(c, name="cudaTexRefGetMaxAnisotropy")
#else
    function hipTexRefGetMaxAnisotropy_orig(pmaxAnsio,texRef) bind(c, name="hipTexRefGetMaxAnisotropy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMaxAnisotropy_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMaxAnisotropy_orig
#endif
      type(c_ptr),value :: pmaxAnsio
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetMipmapFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapFilterMode_orig(pfm,texRef) bind(c, name="cudaTexRefGetMipmapFilterMode")
#else
    function hipTexRefGetMipmapFilterMode_orig(pfm,texRef) bind(c, name="hipTexRefGetMipmapFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapFilterMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapFilterMode_orig
#endif
      type(c_ptr),value :: pfm
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetMipmapLevelBias
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapLevelBias_orig(pbias,texRef) bind(c, name="cudaTexRefGetMipmapLevelBias")
#else
    function hipTexRefGetMipmapLevelBias_orig(pbias,texRef) bind(c, name="hipTexRefGetMipmapLevelBias")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapLevelBias_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelBias_orig
#endif
      type(c_ptr),value :: pbias
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetMipmapLevelClamp
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipmapLevelClamp_orig(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) bind(c, name="cudaTexRefGetMipmapLevelClamp")
#else
    function hipTexRefGetMipmapLevelClamp_orig(pminMipmapLevelClamp,pmaxMipmapLevelClamp,texRef) bind(c, name="hipTexRefGetMipmapLevelClamp")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipmapLevelClamp_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipmapLevelClamp_orig
#endif
      type(c_ptr),value :: pminMipmapLevelClamp
      type(c_ptr),value :: pmaxMipmapLevelClamp
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefGetMipMappedArray
#ifdef USE_CUDA_NAMES
    function hipTexRefGetMipMappedArray_orig(pArray,texRef) bind(c, name="cudaTexRefGetMipMappedArray")
#else
    function hipTexRefGetMipMappedArray_orig(pArray,texRef) bind(c, name="hipTexRefGetMipMappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefGetMipMappedArray_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefGetMipMappedArray_orig
#endif
      type(c_ptr) :: pArray
      type(c_ptr) :: texRef
    end function


  end interface
  
  interface hipTexRefSetAddress
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddress_orig(ByteOffset,texRef,dptr,bytes) bind(c, name="cudaTexRefSetAddress")
#else
    function hipTexRefSetAddress_orig(ByteOffset,texRef,dptr,bytes) bind(c, name="hipTexRefSetAddress")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddress_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddress_orig
#endif
      integer(c_size_t) :: ByteOffset
      type(c_ptr) :: texRef
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: bytes
    end function


  end interface
  
  interface hipTexRefSetAddress2D
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddress2D_orig(texRef,desc,dptr,Pitch) bind(c, name="cudaTexRefSetAddress2D")
#else
    function hipTexRefSetAddress2D_orig(texRef,desc,dptr,Pitch) bind(c, name="hipTexRefSetAddress2D")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddress2D_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddress2D_orig
#endif
      type(c_ptr) :: texRef
      type(c_ptr) :: desc
      type(c_ptr),value :: dptr
      integer(c_size_t),value :: Pitch
    end function


  end interface
  
  interface hipTexRefSetAddressMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetAddressMode_orig(texRef,dim,am) bind(c, name="cudaTexRefSetAddressMode")
#else
    function hipTexRefSetAddressMode_orig(texRef,dim,am) bind(c, name="hipTexRefSetAddressMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetAddressMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetAddressMode_orig
#endif
      type(c_ptr) :: texRef
      integer(c_int),value :: dim
      integer(kind(hipAddressModeWrap)),value :: am
    end function


  end interface
  
  interface hipTexRefSetArray
#ifdef USE_CUDA_NAMES
    function hipTexRefSetArray_orig(tex,array,flags) bind(c, name="cudaTexRefSetArray")
#else
    function hipTexRefSetArray_orig(tex,array,flags) bind(c, name="hipTexRefSetArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetArray_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetArray_orig
#endif
      type(c_ptr) :: tex
      type(c_ptr),value :: array
      integer(kind=4),value :: flags
    end function


  end interface
  
  interface hipTexRefSetBorderColor
#ifdef USE_CUDA_NAMES
    function hipTexRefSetBorderColor_orig(texRef,pBorderColor) bind(c, name="cudaTexRefSetBorderColor")
#else
    function hipTexRefSetBorderColor_orig(texRef,pBorderColor) bind(c, name="hipTexRefSetBorderColor")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetBorderColor_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetBorderColor_orig
#endif
      type(c_ptr) :: texRef
      type(c_ptr),value :: pBorderColor
    end function


  end interface
  
  interface hipTexRefSetFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFilterMode_orig(texRef,fm) bind(c, name="cudaTexRefSetFilterMode")
#else
    function hipTexRefSetFilterMode_orig(texRef,fm) bind(c, name="hipTexRefSetFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFilterMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFilterMode_orig
#endif
      type(c_ptr) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function


  end interface
  
  interface hipTexRefSetFlags
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFlags_orig(texRef,Flags) bind(c, name="cudaTexRefSetFlags")
#else
    function hipTexRefSetFlags_orig(texRef,Flags) bind(c, name="hipTexRefSetFlags")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFlags_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFlags_orig
#endif
      type(c_ptr) :: texRef
      integer(kind=4),value :: Flags
    end function


  end interface
  
  interface hipTexRefSetFormat
#ifdef USE_CUDA_NAMES
    function hipTexRefSetFormat_orig(texRef,fmt,NumPackedComponents) bind(c, name="cudaTexRefSetFormat")
#else
    function hipTexRefSetFormat_orig(texRef,fmt,NumPackedComponents) bind(c, name="hipTexRefSetFormat")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetFormat_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetFormat_orig
#endif
      type(c_ptr) :: texRef
      integer(kind(HIP_AD_FORMAT_UNSIGNED_INT8)),value :: fmt
      integer(c_int),value :: NumPackedComponents
    end function


  end interface
  
  interface hipTexRefSetMaxAnisotropy
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMaxAnisotropy_orig(texRef,maxAniso) bind(c, name="cudaTexRefSetMaxAnisotropy")
#else
    function hipTexRefSetMaxAnisotropy_orig(texRef,maxAniso) bind(c, name="hipTexRefSetMaxAnisotropy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMaxAnisotropy_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMaxAnisotropy_orig
#endif
      type(c_ptr) :: texRef
      integer(kind=4),value :: maxAniso
    end function


  end interface
  
  interface hipTexRefSetMipmapFilterMode
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapFilterMode_orig(texRef,fm) bind(c, name="cudaTexRefSetMipmapFilterMode")
#else
    function hipTexRefSetMipmapFilterMode_orig(texRef,fm) bind(c, name="hipTexRefSetMipmapFilterMode")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapFilterMode_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapFilterMode_orig
#endif
      type(c_ptr) :: texRef
      integer(kind(hipFilterModePoint)),value :: fm
    end function


  end interface
  
  interface hipTexRefSetMipmapLevelBias
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapLevelBias_orig(texRef,bias) bind(c, name="cudaTexRefSetMipmapLevelBias")
#else
    function hipTexRefSetMipmapLevelBias_orig(texRef,bias) bind(c, name="hipTexRefSetMipmapLevelBias")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapLevelBias_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelBias_orig
#endif
      type(c_ptr) :: texRef
      real(c_float),value :: bias
    end function


  end interface
  
  interface hipTexRefSetMipmapLevelClamp
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmapLevelClamp_orig(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) bind(c, name="cudaTexRefSetMipmapLevelClamp")
#else
    function hipTexRefSetMipmapLevelClamp_orig(texRef,minMipMapLevelClamp,maxMipMapLevelClamp) bind(c, name="hipTexRefSetMipmapLevelClamp")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmapLevelClamp_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmapLevelClamp_orig
#endif
      type(c_ptr) :: texRef
      real(c_float),value :: minMipMapLevelClamp
      real(c_float),value :: maxMipMapLevelClamp
    end function


  end interface
  
  interface hipTexRefSetMipmappedArray
#ifdef USE_CUDA_NAMES
    function hipTexRefSetMipmappedArray_orig(texRef,mipmappedArray,Flags) bind(c, name="cudaTexRefSetMipmappedArray")
#else
    function hipTexRefSetMipmappedArray_orig(texRef,mipmappedArray,Flags) bind(c, name="hipTexRefSetMipmappedArray")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexRefSetMipmappedArray_orig
#else
      integer(kind(hipSuccess)) :: hipTexRefSetMipmappedArray_orig
#endif
      type(c_ptr) :: texRef
      type(c_ptr),value :: mipmappedArray
      integer(kind=4),value :: Flags
    end function


  end interface
  
  interface hipMipmappedArrayCreate
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayCreate_orig(pHandle,pMipmappedArrayDesc,numMipmapLevels) bind(c, name="cudaMipmappedArrayCreate")
#else
    function hipMipmappedArrayCreate_orig(pHandle,pMipmappedArrayDesc,numMipmapLevels) bind(c, name="hipMipmappedArrayCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayCreate_orig
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayCreate_orig
#endif
      type(c_ptr) :: pHandle
      type(c_ptr) :: pMipmappedArrayDesc
      integer(kind=4),value :: numMipmapLevels
    end function


  end interface
  
  interface hipMipmappedArrayDestroy
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayDestroy_orig(hMipmappedArray) bind(c, name="cudaMipmappedArrayDestroy")
#else
    function hipMipmappedArrayDestroy_orig(hMipmappedArray) bind(c, name="hipMipmappedArrayDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayDestroy_orig
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayDestroy_orig
#endif
      type(c_ptr),value :: hMipmappedArray
    end function


  end interface
  
  interface hipMipmappedArrayGetLevel
#ifdef USE_CUDA_NAMES
    function hipMipmappedArrayGetLevel_orig(pLevelArray,hMipMappedArray,level) bind(c, name="cudaMipmappedArrayGetLevel")
#else
    function hipMipmappedArrayGetLevel_orig(pLevelArray,hMipMappedArray,level) bind(c, name="hipMipmappedArrayGetLevel")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMipmappedArrayGetLevel_orig
#else
      integer(kind(hipSuccess)) :: hipMipmappedArrayGetLevel_orig
#endif
      type(c_ptr) :: pLevelArray
      type(c_ptr),value :: hMipMappedArray
      integer(kind=4),value :: level
    end function


  end interface
  
  interface hipTexObjectCreate
#ifdef USE_CUDA_NAMES
    function hipTexObjectCreate_orig(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="cudaTexObjectCreate")
#else
    function hipTexObjectCreate_orig(pTexObject,pResDesc,pTexDesc,pResViewDesc) bind(c, name="hipTexObjectCreate")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectCreate_orig
#else
      integer(kind(hipSuccess)) :: hipTexObjectCreate_orig
#endif
      type(c_ptr) :: pTexObject
      type(c_ptr),value :: pResDesc
      type(c_ptr),value :: pTexDesc
      type(c_ptr),value :: pResViewDesc
    end function


  end interface
  
  interface hipTexObjectDestroy
#ifdef USE_CUDA_NAMES
    function hipTexObjectDestroy_orig(texObject) bind(c, name="cudaTexObjectDestroy")
#else
    function hipTexObjectDestroy_orig(texObject) bind(c, name="hipTexObjectDestroy")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectDestroy_orig
#else
      integer(kind(hipSuccess)) :: hipTexObjectDestroy_orig
#endif
      type(c_ptr),value :: texObject
    end function


  end interface
  
  interface hipTexObjectGetResourceDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetResourceDesc_orig(pResDesc,texObject) bind(c, name="cudaTexObjectGetResourceDesc")
#else
    function hipTexObjectGetResourceDesc_orig(pResDesc,texObject) bind(c, name="hipTexObjectGetResourceDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetResourceDesc_orig
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceDesc_orig
#endif
      type(c_ptr),value :: pResDesc
      type(c_ptr),value :: texObject
    end function


  end interface
  
  interface hipTexObjectGetResourceViewDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetResourceViewDesc_orig(pResViewDesc,texObject) bind(c, name="cudaTexObjectGetResourceViewDesc")
#else
    function hipTexObjectGetResourceViewDesc_orig(pResViewDesc,texObject) bind(c, name="hipTexObjectGetResourceViewDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetResourceViewDesc_orig
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetResourceViewDesc_orig
#endif
      type(c_ptr),value :: pResViewDesc
      type(c_ptr),value :: texObject
    end function


  end interface
  
  interface hipTexObjectGetTextureDesc
#ifdef USE_CUDA_NAMES
    function hipTexObjectGetTextureDesc_orig(pTexDesc,texObject) bind(c, name="cudaTexObjectGetTextureDesc")
#else
    function hipTexObjectGetTextureDesc_orig(pTexDesc,texObject) bind(c, name="hipTexObjectGetTextureDesc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipTexObjectGetTextureDesc_orig
#else
      integer(kind(hipSuccess)) :: hipTexObjectGetTextureDesc_orig
#endif
      type(c_ptr),value :: pTexDesc
      type(c_ptr),value :: texObject
    end function


  end interface
  !> 
  !>   CallbackActivity API
  !>  
  interface hipRegisterApiCallback
#ifdef USE_CUDA_NAMES
    function hipRegisterApiCallback_orig(id,fun,arg) bind(c, name="cudaRegisterApiCallback")
#else
    function hipRegisterApiCallback_orig(id,fun,arg) bind(c, name="hipRegisterApiCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRegisterApiCallback_orig
#else
      integer(kind(hipSuccess)) :: hipRegisterApiCallback_orig
#endif
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function


  end interface
  
  interface hipRemoveApiCallback
#ifdef USE_CUDA_NAMES
    function hipRemoveApiCallback_orig(id) bind(c, name="cudaRemoveApiCallback")
#else
    function hipRemoveApiCallback_orig(id) bind(c, name="hipRemoveApiCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRemoveApiCallback_orig
#else
      integer(kind(hipSuccess)) :: hipRemoveApiCallback_orig
#endif
      integer(kind=4),value :: id
    end function


  end interface
  
  interface hipRegisterActivityCallback
#ifdef USE_CUDA_NAMES
    function hipRegisterActivityCallback_orig(id,fun,arg) bind(c, name="cudaRegisterActivityCallback")
#else
    function hipRegisterActivityCallback_orig(id,fun,arg) bind(c, name="hipRegisterActivityCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRegisterActivityCallback_orig
#else
      integer(kind(hipSuccess)) :: hipRegisterActivityCallback_orig
#endif
      integer(kind=4),value :: id
      type(c_ptr),value :: fun
      type(c_ptr),value :: arg
    end function


  end interface
  
  interface hipRemoveActivityCallback
#ifdef USE_CUDA_NAMES
    function hipRemoveActivityCallback_orig(id) bind(c, name="cudaRemoveActivityCallback")
#else
    function hipRemoveActivityCallback_orig(id) bind(c, name="hipRemoveActivityCallback")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipRemoveActivityCallback_orig
#else
      integer(kind(hipSuccess)) :: hipRemoveActivityCallback_orig
#endif
      integer(kind=4),value :: id
    end function


  end interface

#ifdef USE_FPOINTER_INTERFACES

  
#endif
end module hipfort