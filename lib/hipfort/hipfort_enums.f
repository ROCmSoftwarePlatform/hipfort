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
          
           
module hipfort_enums
  implicit none

  enum, bind(c)
    enumerator :: HIP_SUCCESS = 0
    enumerator :: HIP_ERROR_INVALID_VALUE
    enumerator :: HIP_ERROR_NOT_INITIALIZED
    enumerator :: HIP_ERROR_LAUNCH_OUT_OF_RESOURCES
  end enum

  enum, bind(c)
    enumerator :: hipMemoryTypeHost
    enumerator :: hipMemoryTypeDevice
    enumerator :: hipMemoryTypeArray
    enumerator :: hipMemoryTypeUnified
  end enum

  enum, bind(c)
    enumerator :: hipSuccess = 0
    enumerator :: hipErrorInvalidValue = 1
    enumerator :: hipErrorOutOfMemory = 2
    enumerator :: hipErrorMemoryAllocation = 2
    enumerator :: hipErrorNotInitialized = 3
    enumerator :: hipErrorInitializationError = 3
    enumerator :: hipErrorDeinitialized = 4
    enumerator :: hipErrorProfilerDisabled = 5
    enumerator :: hipErrorProfilerNotInitialized = 6
    enumerator :: hipErrorProfilerAlreadyStarted = 7
    enumerator :: hipErrorProfilerAlreadyStopped = 8
    enumerator :: hipErrorInvalidConfiguration = 9
    enumerator :: hipErrorInvalidSymbol = 13
    enumerator :: hipErrorInvalidDevicePointer = 17
    enumerator :: hipErrorInvalidMemcpyDirection = 21
    enumerator :: hipErrorInsufficientDriver = 35
    enumerator :: hipErrorMissingConfiguration = 52
    enumerator :: hipErrorPriorLaunchFailure = 53
    enumerator :: hipErrorInvalidDeviceFunction = 98
    enumerator :: hipErrorNoDevice = 100
    enumerator :: hipErrorInvalidDevice = 101
    enumerator :: hipErrorInvalidImage = 200
    enumerator :: hipErrorInvalidContext = 201
    enumerator :: hipErrorContextAlreadyCurrent = 202
    enumerator :: hipErrorMapFailed = 205
    enumerator :: hipErrorMapBufferObjectFailed = 205
    enumerator :: hipErrorUnmapFailed = 206
    enumerator :: hipErrorArrayIsMapped = 207
    enumerator :: hipErrorAlreadyMapped = 208
    enumerator :: hipErrorNoBinaryForGpu = 209
    enumerator :: hipErrorAlreadyAcquired = 210
    enumerator :: hipErrorNotMapped = 211
    enumerator :: hipErrorNotMappedAsArray = 212
    enumerator :: hipErrorNotMappedAsPointer = 213
    enumerator :: hipErrorECCNotCorrectable = 214
    enumerator :: hipErrorUnsupportedLimit = 215
    enumerator :: hipErrorContextAlreadyInUse = 216
    enumerator :: hipErrorPeerAccessUnsupported = 217
    enumerator :: hipErrorInvalidKernelFile = 218
    enumerator :: hipErrorInvalidGraphicsContext = 219
    enumerator :: hipErrorInvalidSource = 300
    enumerator :: hipErrorFileNotFound = 301
    enumerator :: hipErrorSharedObjectSymbolNotFound = 302
    enumerator :: hipErrorSharedObjectInitFailed = 303
    enumerator :: hipErrorOperatingSystem = 304
    enumerator :: hipErrorInvalidHandle = 400
    enumerator :: hipErrorInvalidResourceHandle = 400
    enumerator :: hipErrorNotFound = 500
    enumerator :: hipErrorNotReady = 600
    enumerator :: hipErrorIllegalAddress = 700
    enumerator :: hipErrorLaunchOutOfResources = 701
    enumerator :: hipErrorLaunchTimeOut = 702
    enumerator :: hipErrorPeerAccessAlreadyEnabled = 704
    enumerator :: hipErrorPeerAccessNotEnabled = 705
    enumerator :: hipErrorSetOnActiveProcess = 708
    enumerator :: hipErrorAssert = 710
    enumerator :: hipErrorHostMemoryAlreadyRegistered = 712
    enumerator :: hipErrorHostMemoryNotRegistered = 713
    enumerator :: hipErrorLaunchFailure = 719
    enumerator :: hipErrorCooperativeLaunchTooLarge = 720
    enumerator :: hipErrorNotSupported = 801
    enumerator :: hipErrorUnknown = 999
    enumerator :: hipErrorRuntimeMemory = 1052
    enumerator :: hipErrorRuntimeOther = 1053
    enumerator :: hipErrorTbd
  end enum

  enum, bind(c)
    enumerator :: hipDeviceAttributeMaxThreadsPerBlock
    enumerator :: hipDeviceAttributeMaxBlockDimX
    enumerator :: hipDeviceAttributeMaxBlockDimY
    enumerator :: hipDeviceAttributeMaxBlockDimZ
    enumerator :: hipDeviceAttributeMaxGridDimX
    enumerator :: hipDeviceAttributeMaxGridDimY
    enumerator :: hipDeviceAttributeMaxGridDimZ
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerBlock
    enumerator :: hipDeviceAttributeTotalConstantMemory
    enumerator :: hipDeviceAttributeWarpSize
    enumerator :: hipDeviceAttributeMaxRegistersPerBlock
    enumerator :: hipDeviceAttributeClockRate
    enumerator :: hipDeviceAttributeMemoryClockRate
    enumerator :: hipDeviceAttributeMemoryBusWidth
    enumerator :: hipDeviceAttributeMultiprocessorCount
    enumerator :: hipDeviceAttributeComputeMode
    enumerator :: hipDeviceAttributeL2CacheSize
    enumerator :: hipDeviceAttributeMaxThreadsPerMultiProcessor
    enumerator :: hipDeviceAttributeComputeCapabilityMajor
    enumerator :: hipDeviceAttributeComputeCapabilityMinor
    enumerator :: hipDeviceAttributeConcurrentKernels
    enumerator :: hipDeviceAttributePciBusId
    enumerator :: hipDeviceAttributePciDeviceId
    enumerator :: hipDeviceAttributeMaxSharedMemoryPerMultiprocessor
    enumerator :: hipDeviceAttributeIsMultiGpuBoard
    enumerator :: hipDeviceAttributeIntegrated
    enumerator :: hipDeviceAttributeCooperativeLaunch
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceLaunch
    enumerator :: hipDeviceAttributeMaxTexture1DWidth
    enumerator :: hipDeviceAttributeMaxTexture2DWidth
    enumerator :: hipDeviceAttributeMaxTexture2DHeight
    enumerator :: hipDeviceAttributeMaxTexture3DWidth
    enumerator :: hipDeviceAttributeMaxTexture3DHeight
    enumerator :: hipDeviceAttributeMaxTexture3DDepth
    enumerator :: hipDeviceAttributeHdpMemFlushCntl
    enumerator :: hipDeviceAttributeHdpRegFlushCntl
    enumerator :: hipDeviceAttributeMaxPitch
    enumerator :: hipDeviceAttributeTextureAlignment
    enumerator :: hipDeviceAttributeTexturePitchAlignment
    enumerator :: hipDeviceAttributeKernelExecTimeout
    enumerator :: hipDeviceAttributeCanMapHostMemory
    enumerator :: hipDeviceAttributeEccEnabled
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedFunc
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedGridDim
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedBlockDim
    enumerator :: hipDeviceAttributeCooperativeMultiDeviceUnmatchedSharedMem
    enumerator :: hipDeviceAttributeAsicRevision
    enumerator :: hipDeviceAttributeManagedMemory
    enumerator :: hipDeviceAttributeDirectManagedMemAccessFromHost
    enumerator :: hipDeviceAttributeConcurrentManagedAccess
    enumerator :: hipDeviceAttributePageableMemoryAccess
    enumerator :: hipDeviceAttributePageableMemoryAccessUsesHostPageTables
  end enum

  enum, bind(c)
    enumerator :: hipComputeModeDefault = 0
    enumerator :: hipComputeModeExclusive = 1
    enumerator :: hipComputeModeProhibited = 2
    enumerator :: hipComputeModeExclusiveProcess = 3
  end enum

  enum, bind(c)
    enumerator :: hipDevP2PAttrPerformanceRank = 0
    enumerator :: hipDevP2PAttrAccessSupported
    enumerator :: hipDevP2PAttrNativeAtomicSupported
    enumerator :: hipDevP2PAttrHipArrayAccessSupported
  end enum

  enum, bind(c)
    enumerator :: hipLimitMallocHeapSize = 2
  end enum

  enum, bind(c)
    enumerator :: hipMemAdviseSetReadMostly = 1
    enumerator :: hipMemAdviseUnsetReadMostly = 2
    enumerator :: hipMemAdviseSetPreferredLocation = 3
    enumerator :: hipMemAdviseUnsetPreferredLocation = 4
    enumerator :: hipMemAdviseSetAccessedBy = 5
    enumerator :: hipMemAdviseUnsetAccessedBy = 6
  end enum

  enum, bind(c)
    enumerator :: hipMemRangeAttributeReadMostly = 1
    enumerator :: hipMemRangeAttributePreferredLocation = 2
    enumerator :: hipMemRangeAttributeAccessedBy = 3
    enumerator :: hipMemRangeAttributeLastPrefetchLocation = 4
  end enum

  enum, bind(c)
    enumerator :: hipJitOptionMaxRegisters = 0
    enumerator :: hipJitOptionThreadsPerBlock
    enumerator :: hipJitOptionWallTime
    enumerator :: hipJitOptionInfoLogBuffer
    enumerator :: hipJitOptionInfoLogBufferSizeBytes
    enumerator :: hipJitOptionErrorLogBuffer
    enumerator :: hipJitOptionErrorLogBufferSizeBytes
    enumerator :: hipJitOptionOptimizationLevel
    enumerator :: hipJitOptionTargetFromContext
    enumerator :: hipJitOptionTarget
    enumerator :: hipJitOptionFallbackStrategy
    enumerator :: hipJitOptionGenerateDebugInfo
    enumerator :: hipJitOptionLogVerbose
    enumerator :: hipJitOptionGenerateLineInfo
    enumerator :: hipJitOptionCacheMode
    enumerator :: hipJitOptionSm3xOpt
    enumerator :: hipJitOptionFastCompile
    enumerator :: hipJitOptionNumOptions
  end enum

  enum, bind(c)
    enumerator :: hipFuncAttributeMaxDynamicSharedMemorySize = 8
    enumerator :: hipFuncAttributePreferredSharedMemoryCarveout = 9
    enumerator :: hipFuncAttributeMax
  end enum

  enum, bind(c)
    enumerator :: hipFuncCachePreferNone
    enumerator :: hipFuncCachePreferShared
    enumerator :: hipFuncCachePreferL1
    enumerator :: hipFuncCachePreferEqual
  end enum

  enum, bind(c)
    enumerator :: hipSharedMemBankSizeDefault
    enumerator :: hipSharedMemBankSizeFourByte
    enumerator :: hipSharedMemBankSizeEightByte
  end enum

  enum, bind(c)
    enumerator :: hipChannelFormatKindSigned = 0
    enumerator :: hipChannelFormatKindUnsigned = 1
    enumerator :: hipChannelFormatKindFloat = 2
    enumerator :: hipChannelFormatKindNone = 3
  end enum

  enum, bind(c)
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT8 = 1
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT16 = 2
    enumerator :: HIP_AD_FORMAT_UNSIGNED_INT32 = 3
    enumerator :: HIP_AD_FORMAT_SIGNED_INT8 = 8
    enumerator :: HIP_AD_FORMAT_SIGNED_INT16 = 9
    enumerator :: HIP_AD_FORMAT_SIGNED_INT32 = 10
    enumerator :: HIP_AD_FORMAT_HALF = 16
    enumerator :: HIP_AD_FORMAT_FLOAT = 32
  end enum

  enum, bind(c)
    enumerator :: hipResourceTypeArray = 0
    enumerator :: hipResourceTypeMipmappedArray = 1
    enumerator :: hipResourceTypeLinear = 2
    enumerator :: hipResourceTypePitch2D = 3
  end enum

  enum, bind(c)
    enumerator :: HIP_RESOURCE_TYPE_ARRAY = 0
    enumerator :: HIP_RESOURCE_TYPE_MIPMAPPED_ARRAY = 1
    enumerator :: HIP_RESOURCE_TYPE_LINEAR = 2
    enumerator :: HIP_RESOURCE_TYPE_PITCH2D = 3
  end enum

  enum, bind(c)
    enumerator :: HIP_TR_ADDRESS_MODE_WRAP = 0
    enumerator :: HIP_TR_ADDRESS_MODE_CLAMP = 1
    enumerator :: HIP_TR_ADDRESS_MODE_MIRROR = 2
    enumerator :: HIP_TR_ADDRESS_MODE_BORDER = 3
  end enum

  enum, bind(c)
    enumerator :: HIP_TR_FILTER_MODE_POINT = 0
    enumerator :: HIP_TR_FILTER_MODE_LINEAR = 1
  end enum

  enum, bind(c)
    enumerator :: hipResViewFormatNone = 0
    enumerator :: hipResViewFormatUnsignedChar1 = 1
    enumerator :: hipResViewFormatUnsignedChar2 = 2
    enumerator :: hipResViewFormatUnsignedChar4 = 3
    enumerator :: hipResViewFormatSignedChar1 = 4
    enumerator :: hipResViewFormatSignedChar2 = 5
    enumerator :: hipResViewFormatSignedChar4 = 6
    enumerator :: hipResViewFormatUnsignedShort1 = 7
    enumerator :: hipResViewFormatUnsignedShort2 = 8
    enumerator :: hipResViewFormatUnsignedShort4 = 9
    enumerator :: hipResViewFormatSignedShort1 = 10
    enumerator :: hipResViewFormatSignedShort2 = 11
    enumerator :: hipResViewFormatSignedShort4 = 12
    enumerator :: hipResViewFormatUnsignedInt1 = 13
    enumerator :: hipResViewFormatUnsignedInt2 = 14
    enumerator :: hipResViewFormatUnsignedInt4 = 15
    enumerator :: hipResViewFormatSignedInt1 = 16
    enumerator :: hipResViewFormatSignedInt2 = 17
    enumerator :: hipResViewFormatSignedInt4 = 18
    enumerator :: hipResViewFormatHalf1 = 19
    enumerator :: hipResViewFormatHalf2 = 20
    enumerator :: hipResViewFormatHalf4 = 21
    enumerator :: hipResViewFormatFloat1 = 22
    enumerator :: hipResViewFormatFloat2 = 23
    enumerator :: hipResViewFormatFloat4 = 24
    enumerator :: hipResViewFormatUnsignedBlockCompressed1 = 25
    enumerator :: hipResViewFormatUnsignedBlockCompressed2 = 26
    enumerator :: hipResViewFormatUnsignedBlockCompressed3 = 27
    enumerator :: hipResViewFormatUnsignedBlockCompressed4 = 28
    enumerator :: hipResViewFormatSignedBlockCompressed4 = 29
    enumerator :: hipResViewFormatUnsignedBlockCompressed5 = 30
    enumerator :: hipResViewFormatSignedBlockCompressed5 = 31
    enumerator :: hipResViewFormatUnsignedBlockCompressed6H = 32
    enumerator :: hipResViewFormatSignedBlockCompressed6H = 33
    enumerator :: hipResViewFormatUnsignedBlockCompressed7 = 34
  end enum

  enum, bind(c)
    enumerator :: HIP_RES_VIEW_FORMAT_NONE = 0
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X8 = 1
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X8 = 2
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X8 = 3
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X8 = 4
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X8 = 5
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X8 = 6
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X16 = 7
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X16 = 8
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X16 = 9
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X16 = 10
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X16 = 11
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X16 = 12
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_1X32 = 13
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_2X32 = 14
    enumerator :: HIP_RES_VIEW_FORMAT_UINT_4X32 = 15
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_1X32 = 16
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_2X32 = 17
    enumerator :: HIP_RES_VIEW_FORMAT_SINT_4X32 = 18
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_1X16 = 19
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_2X16 = 20
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_4X16 = 21
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_1X32 = 22
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_2X32 = 23
    enumerator :: HIP_RES_VIEW_FORMAT_FLOAT_4X32 = 24
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC1 = 25
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC2 = 26
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC3 = 27
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC4 = 28
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC4 = 29
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC5 = 30
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC5 = 31
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC6H = 32
    enumerator :: HIP_RES_VIEW_FORMAT_SIGNED_BC6H = 33
    enumerator :: HIP_RES_VIEW_FORMAT_UNSIGNED_BC7 = 34
  end enum

  enum, bind(c)
    enumerator :: hipMemcpyHostToHost = 0
    enumerator :: hipMemcpyHostToDevice = 1
    enumerator :: hipMemcpyDeviceToHost = 2
    enumerator :: hipMemcpyDeviceToDevice = 3
    enumerator :: hipMemcpyDefault = 4
  end enum

  enum, bind(c)
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX_THREADS_PER_BLOCK
    enumerator :: HIP_FUNC_ATTRIBUTE_SHARED_SIZE_BYTES
    enumerator :: HIP_FUNC_ATTRIBUTE_CONST_SIZE_BYTES
    enumerator :: HIP_FUNC_ATTRIBUTE_LOCAL_SIZE_BYTES
    enumerator :: HIP_FUNC_ATTRIBUTE_NUM_REGS
    enumerator :: HIP_FUNC_ATTRIBUTE_PTX_VERSION
    enumerator :: HIP_FUNC_ATTRIBUTE_BINARY_VERSION
    enumerator :: HIP_FUNC_ATTRIBUTE_CACHE_MODE_CA
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX_DYNAMIC_SHARED_SIZE_BYTES
    enumerator :: HIP_FUNC_ATTRIBUTE_PREFERRED_SHARED_MEMORY_CARVEOUT
    enumerator :: HIP_FUNC_ATTRIBUTE_MAX
  end enum

  enum, bind(c)
    enumerator :: hipAddressModeWrap = 0
    enumerator :: hipAddressModeClamp = 1
    enumerator :: hipAddressModeMirror = 2
    enumerator :: hipAddressModeBorder = 3
  end enum

  enum, bind(c)
    enumerator :: hipFilterModePoint = 0
    enumerator :: hipFilterModeLinear = 1
  end enum

  enum, bind(c)
    enumerator :: hipReadModeElementType = 0
    enumerator :: hipReadModeNormalizedFloat = 1
  end enum

 

#ifdef USE_FPOINTER_INTERFACES

  
#endif
end module hipfort_enums