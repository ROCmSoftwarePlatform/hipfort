module hipfort_types
  use iso_c_binding
  implicit none
  
  type,bind(c) :: dim3
     integer(c_int) :: x,y,z 
  end type dim3


  ! runtime api parameters

  integer, parameter :: hipIpcMemLazyEnablePeerAccess =  0

  integer, parameter :: hipStreamDefault = &
      0  !< Default stream creation flags. These are used with hipStreamCreate = ().
  integer, parameter :: hipStreamNonBlocking =  1  !< Stream does not implicitly synchronize with null stream
  
  integer, parameter :: hipEventDefault =  0  !< Default flags
  integer, parameter :: hipEventBlockingSync = &
      1  !< Waiting will yield CPU.  Power-friendly and usage-friendly but may increase latency.
  integer, parameter :: hipEventDisableTiming = &
      2  !< Disable event's capability to record timing information.  May improve performance.
  integer, parameter :: hipEventInterprocess =  4  !< Event can support IPC.  @warning - not supported in HIP.
  integer, parameter :: hipEventReleaseToDevice = &
      1073741824 !< 0x40000000 - Use a device-scope release when recording this event.  This flag is useful to
  !integer, parameter :: hipEventReleaseToSystem = &
  !    2147483648 !< 0x80000000 - Use a system-scope release that when recording this event.  This flag is
  integer, parameter :: hipHostMallocDefault =  0
  integer, parameter :: hipHostMallocPortable =  1  !< Memory is considered allocated by all contexts.
  integer, parameter :: hipHostMallocMapped = &
      2  !< Map the allocation into the address space for the current device.  The device pointer
  integer, parameter :: hipHostMallocWriteCombined =  4
  integer, parameter :: hipHostMallocNumaUser = &
      536870912 !< 0x20000000 - Host memory allocation will follow numa policy set by user
  integer, parameter :: hipHostMallocCoherent = &
      1073741824 !< 0x40000000 - Allocate coherent memory. Overrides HIP_COHERENT_HOST_ALLOC for specific
  !integer, parameter :: hipHostMallocNonCoherent = &
  !    2147483648 !< 0x80000000 - Allocate non-coherent memory. Overrides HIP_COHERENT_HOST_ALLOC for specific
  integer, parameter :: hipMemAttachGlobal =   1    !< Memory can be accessed by any stream on any device
  integer, parameter :: hipMemAttachHost =     2    !< Memory cannot be accessed by any stream on any device
  integer, parameter :: hipMemAttachSingle =   4    !< Memory can only be accessed by a single stream on
                                      !< the associated device
  integer, parameter :: hipDeviceMallocDefault =  0
  integer, parameter :: hipDeviceMallocFinegrained =  1  !< Memory is allocated in fine grained region of device.
  
  integer, parameter :: hipHostRegisterDefault =  0   !< Memory is Mapped and Portable
  integer, parameter :: hipHostRegisterPortable =  1  !< Memory is considered registered by all contexts.
  integer, parameter :: hipHostRegisterMapped = &
      2  !< Map the allocation into the address space for the current device.  The device pointer
  integer, parameter :: hipHostRegisterIoMemory =  4  !< Not supported.
  integer, parameter :: hipExtHostRegisterCoarseGrained =  8  !< Coarse Grained host memory lock
  
  integer, parameter :: hipDeviceScheduleAuto =  0  !< Automatically select between Spin and Yield
  integer, parameter :: hipDeviceScheduleSpin = &
      1  !< Dedicate a CPU core to spin-wait.  Provides lowest latency, but burns a CPU core and
  integer, parameter :: hipDeviceScheduleYield = &
      2  !< Yield the CPU to the operating system when waiting.  May increase latency, but lowers
  integer, parameter :: hipDeviceScheduleBlockingSync =  4
  integer, parameter :: hipDeviceScheduleMask =  7
  
  integer, parameter :: hipDeviceMapHost =  8
  integer, parameter :: hipDeviceLmemResizeToMax =  22 ! 16
  
  integer, parameter :: hipArrayDefault =  0  !< Default HIP array allocation flag
  integer, parameter :: hipArrayLayered =  1
  integer, parameter :: hipArraySurfaceLoadStore =  2
  integer, parameter :: hipArrayCubemap =  4
  integer, parameter :: hipArrayTextureGather =  8
  
  integer, parameter :: hipOccupancyDefault =  0
  
  integer, parameter :: hipCooperativeLaunchMultiDeviceNoPreSync =  1
  integer, parameter :: hipCooperativeLaunchMultiDeviceNoPostSync =  2

end module hipfort_types
